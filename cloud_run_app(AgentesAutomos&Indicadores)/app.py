from flask import Flask, jsonify, Response
from google.cloud import storage
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
EXTRACTED_PATH = '/tmp/extracted/'
GCS_BUCKET = "cloud_folder"
ECONOMIC_DIR = "economic_indicators"
JSON_OUTPUT_DIR = "json_output"

# URLs para indicadores econômicos e Yahoo Finance
economic_indicators_urls = {
    "USD_BRL": None,  # Substituído pelo Yahoo Finance
    "IPCA": "https://api.bcb.gov.br/dados/serie/bcdata.sgs.4449/dados?formato=json&dataInicial={data_inicial}&dataFinal={data_final}",
    "SELIC": "https://api.bcb.gov.br/dados/serie/bcdata.sgs.432/dados?formato=json&dataInicial={data_inicial}&dataFinal={data_final}",
    "PIB": "https://api.bcb.gov.br/dados/serie/bcdata.sgs.1207/dados?formato=json&dataInicial={data_inicial}&dataFinal={data_final}",
    "DividaPublica_PIB": "https://api.bcb.gov.br/dados/serie/bcdata.sgs.4513/dados?formato=json&dataInicial={data_inicial}&dataFinal={data_final}",
    "IndiceConfiancaConsumidor": "https://api.bcb.gov.br/dados/serie/bcdata.sgs.4393/dados?formato=json&dataInicial={data_inicial}&dataFinal={data_final}",
    "IGPM": "https://api.bcb.gov.br/dados/serie/bcdata.sgs.189/dados?formato=json&dataInicial={data_inicial}&dataFinal={data_final}",
    "INPC": "https://api.bcb.gov.br/dados/serie/bcdata.sgs.188/dados?formato=json&dataInicial={data_inicial}&dataFinal={data_final}",
    "IBOVESPA": None  # Dados do IBOVESPA virão de yfinance
}

# Função para definir datas para yfinance (YYYY-MM-DD) e APIs do Banco Central (dd/MM/YYYY)
def get_date_range():
    # Datas para yfinance
    end_date_yfinance = datetime.now().strftime('%Y-%m-%d')
    start_date_yfinance = (datetime.now() - timedelta(days=720)).strftime('%Y-%m-%d')
    
    # Datas para APIs do Banco Central
    end_date_bcb = datetime.now().strftime('%d/%m/%Y')
    start_date_bcb = (datetime.now() - timedelta(days=720)).strftime('%d/%m/%Y')
    
    return (start_date_yfinance, end_date_yfinance), (start_date_bcb, end_date_bcb)

# Função para download e extração de ZIP da CVM
def download_and_extract_zip(url, extract_to):
    try:
        response = requests.get(url, stream=True)
        response.raise_for_status()
        zip_path = '/tmp/temp.zip'
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

# Função para detectar encoding de arquivo CSV
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
    
    # Campos específicos para PJ e PF
    pj_columns = ['SIT', 'UF', 'MUN', 'DENOM_SOCIAL', 'EMAIL', 'SITE_ADMIN']
    pf_columns = ['NOME', 'DT_REG', 'SIT']
    
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
                    # Detectar a codificação do arquivo CSV
                    encoding = detect_encoding(csv_path)
                    df = pd.read_csv(csv_path, encoding=encoding, sep=';', engine='python')
                    
                    # Preencher valores nulos
                    for col in df.columns:
                        if df[col].dtype == 'object':
                            df[col] = df[col].fillna("")
                        else:
                            df[col] = df[col].fillna(0)
                    
                    # Normalizar strings nas colunas de tipo object
                    for col in df.select_dtypes(include=[object]).columns:
                        df[col] = df[col].apply(normalize_string)
                    
                    # Aplicar filtros para SIT="EM FUNCIONAMENTO NORMAL"
                    df_filtered = df[df['SIT'] == "EM FUNCIONAMENTO NORMAL"]
                    
                    # Processamento para PJ (Pessoa Jurídica)
                    if "cad_agente_auton_pj" in filename:
                        if set(pj_columns).issubset(df.columns):
                            pj_filtered = df_filtered[pj_columns]
                            pj_data.extend(pj_filtered.to_dict(orient='records'))
                        else:
                            logging.warning(f"Missing required columns in PJ file: {filename}")
                    
                    # Processamento para PF (Pessoa Física)
                    elif "cad_agente_auton_pf" in filename:
                        if set(pf_columns).issubset(df.columns):
                            pf_filtered = df_filtered[pf_columns]
                            pf_data.extend(pf_filtered.to_dict(orient='records'))
                        else:
                            logging.warning(f"Missing required columns in PF file: {filename}")

                except Exception as e:
                    logging.error(f"Error reading CSV file {csv_path}: {e}")
                    return None, None

        return pj_data, pf_data
    
    except Exception as e:
        logging.error(f"Failed to process CSV to JSON with pandas: {e}")
        return None, None
        
# Função para salvar JSON localmente
def save_json_locally(json_data, file_name):
    try:
        with open(file_name, 'w', encoding='utf-8') as f:
            json.dump(json_data, f, ensure_ascii=False, indent=2, default=str)
    except Exception as e:
        logging.error(f"Error saving JSON locally: {e}")

# Função para upload de arquivos JSON para o GCS
def upload_json_to_gcs(local_file_path, bucket_name, destination_blob_name):
    try:
        storage_client = storage.Client()
        bucket = storage_client.bucket(bucket_name)
        blob = bucket.blob(destination_blob_name)
        blob.upload_from_filename(local_file_path)
        return True
    except Exception as e:
        logging.error(f"Error uploading JSON to GCS: {e}")
        return False

# Função para processar e enviar os indicadores econômicos para o GCS
def process_and_upload_economic_indicators():
    # Obter intervalos de datas formatadas corretamente para cada fonte
    (start_date_yfinance, end_date_yfinance), (start_date_bcb, end_date_bcb) = get_date_range()

    for name, url in economic_indicators_urls.items():
        try:
            if name == "IBOVESPA":
                # Obter dados de IBOVESPA do yfinance
                ibovespa = yf.Ticker("^BVSP").history(start=start_date_yfinance, end=end_date_yfinance).reset_index().to_dict(orient='records')
                file_name = f'{name.lower()}.json'
                save_json_locally(ibovespa, file_name)
                upload_json_to_gcs(file_name, GCS_BUCKET, f"{ECONOMIC_DIR}/{file_name}")
                continue

            if name == "USD_BRL":
                # Obter dados de USD/BRL do yfinance
                usd_brl = yf.Ticker("USDBRL=X").history(start=start_date_yfinance, end=end_date_yfinance).reset_index().to_dict(orient='records')
                file_name = 'usd_brl.json'
                save_json_locally(usd_brl, file_name)
                upload_json_to_gcs(file_name, GCS_BUCKET, f"{ECONOMIC_DIR}/{file_name}")
                continue

            # Substituir as datas corretamente na URL para APIs do BCB
            formatted_url = url.format(data_inicial=start_date_bcb, data_final=end_date_bcb)
            logging.info(f"Buscando dados de {name} a partir de {formatted_url}")
            response = requests.get(formatted_url)

            if response.status_code == 200:
                logging.info(f"Dados obtidos com sucesso para {name}")
                economic_data = response.json()

                # Salvar o JSON localmente
                file_name = f'{name.lower()}.json'
                save_json_locally(economic_data, file_name)
                upload_json_to_gcs(file_name, GCS_BUCKET, f"{ECONOMIC_DIR}/{file_name}")
            else:
                logging.error(f"Falha ao buscar dados para {name} de {formatted_url}. Código de status: {response.status_code}")
        except Exception as e:
            logging.error(f"Erro ao processar {name}: {e}")

# Função para atualizar a data da última execução no GCS
def update_last_run_date():
    try:
        logging.info("Atualizando a data da última execução no GCS.")
        storage_client = storage.Client()
        bucket = storage_client.bucket(GCS_BUCKET)
        blob = bucket.blob(LAST_RUN_FILE)
        blob.upload_from_string(datetime.now().strftime('%Y-%m-%d'))
    except Exception as e:
        logging.error(f"Falha ao atualizar a data da última execução: {e}")

# Função principal para atualizar todos os dados (CVM, indicadores econômicos)
@app.route('/update_data', methods=['POST'])
def update_data():
    logging.info("Iniciando atualização dos dados...")

    # Fazer o download e extrair os dados da CVM
    if not download_and_extract_zip(API_URL_CVM, EXTRACTED_PATH):
        return jsonify({"error": "Falha ao baixar ou extrair o ZIP"}), 500
    
    # Processar os arquivos CSV da CVM e convertê-los em JSON
    pj_data, pf_data = process_csv_to_json_with_pandas(EXTRACTED_PATH)
    if pj_data is None or pf_data is None:
        return jsonify({"error": "Falha ao processar os arquivos CSV"}), 500
    
    # Salvar os arquivos JSON localmente
    save_json_locally(pj_data, 'agente_auton_pj.json')
    save_json_locally(pf_data, 'agente_auton_pf.json')
    
    # Fazer o upload dos arquivos JSON para o GCS
    pj_uploaded = upload_json_to_gcs('agente_auton_pj.json', GCS_BUCKET, f"{JSON_OUTPUT_DIR}/agente_auton_pj.json")
    pf_uploaded = upload_json_to_gcs('agente_auton_pf.json', GCS_BUCKET, f"{JSON_OUTPUT_DIR}/agente_auton_pf.json")
    
    if not pj_uploaded or not pf_uploaded:
        return jsonify({"error": "Falha ao enviar um ou ambos os arquivos JSON para o GCS"}), 500

    # Processar e salvar os dados econômicos
    process_and_upload_economic_indicators()

    # Atualizar a data da última execução
    update_last_run_date()

    logging.info("Processo de atualização dos dados concluído com sucesso.")
    
    # Responder com sucesso
    response_data = json.dumps({"message": "Todos os dados foram processados e enviados com sucesso!"}, ensure_ascii=False).encode('utf-8')
    response = Response(response_data, content_type='application/json; charset=utf-8')
    return response

# Função de inicialização da aplicação
if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8080))
    app.run(host='0.0.0.0', port=port)
