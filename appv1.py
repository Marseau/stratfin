from flask import Flask, jsonify, Response
import requests
import zipfile
import os
import json
import logging
from logging.handlers import QueueHandler, QueueListener
from queue import Queue
import sys
from datetime import datetime, timedelta
import pandas as pd
import chardet
import unicodedata
import yfinance as yf
import time

app = Flask(__name__)

# Configuração de logging
log_queue = Queue()
queue_handler = QueueHandler(log_queue)
console_handler = logging.StreamHandler(sys.stdout)
root_logger = logging.getLogger()
root_logger.setLevel(logging.INFO)
root_logger.addHandler(queue_handler)
listener = QueueListener(log_queue, console_handler)
listener.start()

# Variáveis de URLs e caminhos
LAST_RUN_FILE = "last_run_date.txt"
API_URL_CVM = 'https://dados.cvm.gov.br/dados/AGENTE_AUTON/CAD/DADOS/cad_agente_auton.zip'
EXTRACTED_PATH = './extracted/'  # Diretório local para salvar arquivos extraídos
LOCAL_OUTPUT_DIR = "./output"  # Diretório local para salvar arquivos JSON gerados

# URLs para indicadores econômicos e IBGE
economic_indicators_urls = {
    "USD_BRL": None,  # Substituído pelo Yahoo Finance, ver abaixo
    "IPCA": "https://api.bcb.gov.br/dados/serie/bcdata.sgs.4449/dados?formato=json&dataInicial={data_inicial}&dataFinal={data_final}",
    "SELIC": "https://api.bcb.gov.br/dados/serie/bcdata.sgs.432/dados?formato=json&dataInicial={data_inicial}&dataFinal={data_final}",
    "PIB": "https://api.bcb.gov.br/dados/serie/bcdata.sgs.1207/dados?formato=json&dataInicial={data_inicial}&dataFinal={data_final}",
    "DividaPublica_PIB": "https://api.bcb.gov.br/dados/serie/bcdata.sgs.4513/dados?formato=json&dataInicial={data_inicial}&dataFinal={data_final}",
    "IndiceConfiancaConsumidor": "https://api.bcb.gov.br/dados/serie/bcdata.sgs.4393/dados?formato=json&dataInicial={data_inicial}&dataFinal={data_final}",
    "IGPM": "https://api.bcb.gov.br/dados/serie/bcdata.sgs.189/dados?formato=json&dataInicial={data_inicial}&dataFinal={data_final}",
    "INPC": "https://api.bcb.gov.br/dados/serie/bcdata.sgs.188/dados?formato=json&dataInicial={data_inicial}&dataFinal={data_final}",
    "IBOVESPA": None  # Dados do IBOVESPA virão de yfinance
}

ibge_urls = {
    "Expectativa de Vida": "https://servicodados.ibge.gov.br/api/v2/expectativa_de_vida?format=json",
    "Salário Mínimo": "https://api.dados.gov.br/salario-minimo",
    "Teto de Aposentadoria e Contribuição": "https://api.dados.gov.br/aposentadoria/teto-contribuicao",
    "Idade Mínima de Aposentadoria": "https://api.dados.gov.br/aposentadoria/idade-minima"
}

# Função para definir data inicial e final
def get_date_range():
    end_date = datetime.now().strftime('%d/%m/%Y')  # Formato correto dd/MM/yyyy
    start_date = (datetime.now() - timedelta(days=720)).strftime('%d/%m/%Y')  # 720 dias antes
    return start_date, end_date

# Função para download e extração de ZIP da CVM
def download_and_extract_zip(url, extract_to):
    try:
        response = requests.get(url, stream=True)
        response.raise_for_status()
        zip_path = './temp.zip'
        with open(zip_path, 'wb') as f:
            for chunk in response.iter_content(chunk_size=8192):
                f.write(chunk)
        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            zip_ref.extractall(extract_to)
        os.remove(zip_path)
        return True
    except Exception as e:
        logging.error(f"Failed to download and extract zip: {e}")
        return False

# Função para detectar encoding
def detect_encoding(file_path):
    with open(file_path, 'rb') as f:
        result = chardet.detect(f.read())
        return result['encoding']

# Função para normalizar string
def normalize_string(s):
    if isinstance(s, str):
        return unicodedata.normalize('NFKD', s).encode('ascii', 'ignore').decode('utf-8')
    return s

# Função para processar CSV e transformar em JSON
def process_csv_to_json_with_pandas(extracted_path):
    pj_data = []
    pf_data = []
    try:
        if not os.path.exists(extracted_path):
            logging.error(f"Extracted path {extracted_path} does not exist.")
            return None, None
        if not os.listdir(extracted_path):
            logging.error(f"No files found in extracted path: {extracted_path}")
            return None, None
        for filename in os.listdir(extracted_path):
            if filename.endswith('.csv'):
                csv_path = os.path.join(extracted_path, filename)
                try:
                    encoding = detect_encoding(csv_path)
                    df = pd.read_csv(csv_path, encoding=encoding, sep=';', engine='python')
                    for col in df.columns:
                        if df[col].dtype == 'object':
                            df[col] = df[col].fillna("")
                        else:
                            df[col] = df[col].fillna(0)
                    for col in df.select_dtypes(include=[object]).columns:
                        df[col] = df[col].apply(normalize_string)
                    if "cad_agente_auton_pj" in filename:
                        pj_data.extend(df.to_dict(orient='records'))
                    elif "cad_agente_auton_pf" in filename:
                        pf_data.extend(df.to_dict(orient='records'))
                except Exception as e:
                    logging.error(f"Error reading CSV file {csv_path}: {e}")
                    return None, None
        return pj_data, pf_data
    except Exception as e:
        logging.error(f"Failed to process CSV to JSON with pandas: {e}")
        return None, None

# Função para serializar Timestamps
def custom_json_serializer(obj):
    if isinstance(obj, (datetime.date, datetime.datetime)):
        return obj.isoformat()
    raise TypeError(f"Type {type(obj)} not serializable")

# Função para salvar JSON localmente
def save_json_locally(json_data, file_name):
    try:
        # Criar diretório de saída se não existir
        if not os.path.exists(LOCAL_OUTPUT_DIR):
            os.makedirs(LOCAL_OUTPUT_DIR)
        
        # Salvar no diretório de saída local
        output_path = os.path.join(LOCAL_OUTPUT_DIR, file_name)
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(json_data, f, ensure_ascii=False, indent=2, default=custom_json_serializer)
        logging.info(f"Data saved locally at {output_path}")
    except Exception as e:
        logging.error(f"Error saving JSON locally: {e}")

# Função para processar e enviar os indicadores econômicos para o diretório local
def process_and_upload_economic_indicators():
    start_date, end_date = get_date_range()  # Obter intervalo de datas

    for name, url in economic_indicators_urls.items():
        try:
            if name == "IBOVESPA":
                # Obter dados de IBOVESPA do yfinance
                ibovespa = yf.Ticker("^BVSP").history(period="2y").reset_index().to_dict(orient='records')
                file_name = f'{name.lower()}.json'
                save_json_locally(ibovespa, file_name)
                continue

            if name == "USD_BRL":
                # Obter dados de USD/BRL do yfinance
                usd_brl = yf.Ticker("USDBRL=X").history(period="2y").reset_index().to_dict(orient='records')
                file_name = 'usd_brl.json'
                save_json_locally(usd_brl, file_name)
                continue

            # Substituir as datas corretamente na URL (para os demais indicadores)
            formatted_url = url.format(data_inicial=start_date, data_final=end_date)
            logging.info(f"Fetching data for {name} from {formatted_url}")
            response = requests.get(formatted_url)

            if response.status_code == 200:
                logging.info(f"Data fetched successfully for {name}")
                economic_data = response.json()

                # Salvar o JSON em um arquivo separado para cada indicador
                file_name = f'{name.lower()}.json'
                save_json_locally(economic_data, file_name)
            else:
                logging.error(f"Failed to fetch data for {name} from {formatted_url}. Status code: {response.status_code}")
        except Exception as e:
            logging.error(f"Error processing {name}: {e}")

# Função com retry para buscar dados do IBGE e salvar localmente
def make_request_with_retry(url, retries=3, delay=5):
    for i in range(retries):
        try:
            response = requests.get(url)
            if response.status_code == 200:
                return response
            logging.warning(f"Retry {i+1}: Failed to fetch data. Status code: {response.status_code}")
        except requests.exceptions.RequestException as e:
            logging.error(f"Request failed: {e}")
        time.sleep(delay)
    return None

def process_and_upload_ibge_data():
    for name, url in ibge_urls.items():
        try:
            logging.info(f"Fetching data for {name} from {url}")
            response = make_request_with_retry(url)

            if response and response.status_code == 200:
                ibge_data = response.json()
                file_name = f'{name.lower().replace(" ", "_")}.json'
                save_json_locally(ibge_data, file_name)
            else:
                logging.error(f"Failed to fetch data for {name} from {url}. Status code: {response.status_code}")
        except Exception as e:
            logging.error(f"Error processing {name}: {e}")

# Função para atualizar a data da última execução no sistema de arquivos local
def update_last_run_date():
    try:
        logging.info("Updating last run date locally.")
        with open(LAST_RUN_FILE, 'w') as f:
            f.write(datetime.now().strftime('%Y-%m-%d'))
    except Exception as e:
        logging.error(f"Failed to update last run date: {e}")

# Função principal para atualizar todos os dados (CVM, indicadores econômicos, IBGE)
@app.route('/update_data', methods=['POST'])
def update_data():
    logging.info("Starting data update...")

    # Atualizar dados da CVM
    if not download_and_extract_zip(API_URL_CVM, EXTRACTED_PATH):
        return jsonify({"error": "Failed to download or extract ZIP"}), 500
    
    pj_data, pf_data = process_csv_to_json_with_pandas(EXTRACTED_PATH)
    if pj_data is None or pf_data is None:
        return jsonify({"error": "Failed to process CSV"}), 500
    
    # Salvar os arquivos JSON localmente diretamente no diretório local
    save_json_locally(pj_data, 'agente_auton_pj.json')
    save_json_locally(pf_data, 'agente_auton_pf.json')

    # Processar e salvar os dados econômicos individualmente no diretório local
    process_and_upload_economic_indicators()

    # Coletar e processar dados do IBGE por último e salvar localmente
    process_and_upload_ibge_data()

    # Atualizar a data da última execução localmente
    update_last_run_date()

    logging.info("Data update process completed successfully.")
    
    # Resposta final de sucesso
    response_data = json.dumps({"message": "All data processed and saved locally!"}, ensure_ascii=False).encode('utf-8')
    response = Response(response_data, content_type='application/json; charset=utf-8')
    return response

# Função de inicialização da aplicação
if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8080))
    app.run(host='0.0.0.0', port=port)
