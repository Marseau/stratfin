import yfinance as yf
import logging
import os
import json
from datetime import datetime

# Diretório local onde os arquivos JSON serão salvos
LOCAL_OUTPUT_DIR = "./output"

# Função para serializar Timestamps
def custom_json_serializer(obj):
    if isinstance(obj, (datetime,)):
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

# Função para obter a cotação do USD/BRL do Yahoo Finance
def get_usd_brl_data():
    logging.info("Fetching USD/BRL data from Yahoo Finance...")
    try:
        usd_brl = yf.Ticker("USDBRL=X").history(period="2y").reset_index()  # Dados dos últimos 2 anos
        if not usd_brl.empty:
            usd_brl_data = usd_brl.to_dict(orient='records')
            save_json_locally(usd_brl_data, 'usd_brl.json')
        else:
            logging.warning("No data found for USD/BRL.")
    except Exception as e:
        logging.error(f"Error fetching USD/BRL data: {e}")

# Função para obter dados do IBOVESPA do Yahoo Finance
def get_ibovespa_data():
    logging.info("Fetching IBOVESPA data from Yahoo Finance...")
    try:
        ibovespa = yf.Ticker("^BVSP").history(period="2y").reset_index()  # Dados dos últimos 2 anos
        if not ibovespa.empty:
            ibovespa_data = ibovespa.to_dict(orient='records')
            save_json_locally(ibovespa_data, 'ibovespa.json')
        else:
            logging.warning("No data found for IBOVESPA.")
    except Exception as e:
        logging.error(f"Error fetching IBOVESPA data: {e}")

# Chamar as funções para buscar os dados e salvar localmente
get_usd_brl_data()
get_ibovespa_data()
