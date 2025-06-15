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

# Variáveis de URLs e caminhos (desabilitamos GCS)
JSON_OUTPUT_DIR = "./json_output"

# URLs para indicadores econômicos e Yahoo Finance
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

# Função para definir data inicial e final no formato necessário para yfinance (%Y-%m-%d)
# e para APIs do Banco Central (%d/%m/%Y)
def get_date_range():
    end_date_yfinance = datetime.now().strftime('%Y-%m-%d')  # Formato para yfinance
    start_date_yfinance = (datetime.now() - timedelta(days=720)).strftime('%Y-%m-%d')  # 720 dias antes para yfinance
    
    end_date_bcb = datetime.now().strftime('%d/%m/%Y')  # Formato para Banco Central (APIs BCB)
    start_date_bcb = (datetime.now() - timedelta(days=720)).strftime('%d/%m/%Y')  # 720 dias antes para APIs BCB
    
    return (start_date_yfinance, end_date_yfinance), (start_date_bcb, end_date_bcb)

# Função para salvar JSON localmente (sem enviar para GCS)
def save_json_locally(json_data, file_name):
    try:
        file_path = os.path.join(JSON_OUTPUT_DIR, file_name)
        with open(file_path, 'w', encoding='utf-8') as f:
            json.dump(json_data, f, ensure_ascii=False, indent=2, default=str)
        logging.info(f"Dados salvos localmente em {file_path}")
    except Exception as e:
        logging.error(f"Erro ao salvar JSON localmente: {e}")

# Função para processar e salvar os indicadores econômicos localmente
def process_and_save_economic_indicators():
    # Obter intervalos de datas no formato correto para cada tipo de API
    (start_date_yfinance, end_date_yfinance), (start_date_bcb, end_date_bcb) = get_date_range()

    for name, url in economic_indicators_urls.items():
        try:
            if name == "IBOVESPA":
                # Obter dados de IBOVESPA do yfinance
                ibovespa = yf.Ticker("^BVSP").history(start=start_date_yfinance, end=end_date_yfinance).reset_index().to_dict(orient='records')
                file_name = f'{name.lower()}.json'
                save_json_locally(ibovespa, file_name)
                continue

            if name == "USD_BRL":
                # Obter dados de USD/BRL do yfinance (últimos 2 anos de cotação)
                usd_brl = yf.Ticker("USDBRL=X").history(start=start_date_yfinance, end=end_date_yfinance).reset_index().to_dict(orient='records')
                file_name = 'usd_brl.json'
                save_json_locally(usd_brl, file_name)
                continue

            # Substituir as datas corretamente na URL (para os demais indicadores)
            formatted_url = url.format(data_inicial=start_date_bcb, data_final=end_date_bcb)
            logging.info(f"Buscando dados para {name} de {formatted_url}")
            response = requests.get(formatted_url)

            if response.status_code == 200:
                logging.info(f"Dados buscados com sucesso para {name}")
                economic_data = response.json()

                # Salvar o JSON localmente
                file_name = f'{name.lower()}.json'
                save_json_locally(economic_data, file_name)
            else:
                logging.error(f"Falha ao buscar dados para {name} de {formatted_url}. Código de status: {response.status_code}")
        except Exception as e:
            logging.error(f"Erro ao processar {name}: {e}")

# Função principal para rodar o código localmente
@app.route('/run_local', methods=['GET'])
def run_local():
    logging.info("Iniciando o processo de download e geração de arquivos localmente...")

    # Processar e salvar os dados econômicos localmente
    process_and_save_economic_indicators()

    logging.info("Processo concluído com sucesso!")
    
    # Resposta final de sucesso
    response_data = json.dumps({"message": "Todos os dados processados e salvos localmente com sucesso!"}, ensure_ascii=False).encode('utf-8')
    response = Response(response_data, content_type='application/json; charset=utf-8')
    return response

# Função de inicialização da aplicação
if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8080))
    app.run(host='0.0.0.0', port=port)
