from flask import Flask, jsonify, request
from google.cloud import storage
import requests
import zipfile
import os
import json
import logging
from logging.handlers import QueueHandler, QueueListener
from queue import Queue
import sys
from datetime import datetime
import pandas as pd

app = Flask(__name__)

# Configuração de logging
log_queue = Queue()
queue_handler = QueueHandler(log_queue)
console_handler = logging.StreamHandler(sys.stdout)

# Configuração do logger raiz
root_logger = logging.getLogger()
root_logger.setLevel(logging.INFO)
root_logger.addHandler(queue_handler)

# Configuração do listener de logging
listener = QueueListener(log_queue, console_handler)
listener.start()

# Nome do arquivo que armazenará a data da última execução
LAST_RUN_FILE = "last_run_date.txt"
API_URL = 'https://dados.cvm.gov.br/dados/AGENTE_AUTON/CAD/DADOS/cad_agente_auton.zip'
EXTRACTED_PATH = '/tmp/extracted/'

def download_and_extract_zip(url, extract_to):
    try:
        logging.info(f"Starting download from {url}")
        response = requests.get(url, stream=True)
        response.raise_for_status()
        zip_path = '/tmp/temp.zip'
        
        with open(zip_path, 'wb') as f:
            for chunk in response.iter_content(chunk_size=8192):
                f.write(chunk)
        
        logging.info(f"Download complete. Extracting ZIP file to {extract_to}")
        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            zip_ref.extractall(extract_to)
        
        os.remove(zip_path)
        logging.info("Download and extraction successful.")
        return True
    except Exception as e:
        logging.error(f"Failed to download and extract zip: {e}")
        return False

def process_csv_to_json_with_pandas(extracted_path):
    pj_data = []
    pf_data = []
    try:
        logging.info(f"Checking extracted path: {extracted_path}")
        if not os.path.exists(extracted_path):
            logging.error(f"Extracted path {extracted_path} does not exist.")
            return None, None
        
        if not os.listdir(extracted_path):
            logging.error(f"No files found in extracted path: {extracted_path}")
            return None, None

        for filename in os.listdir(extracted_path):
            logging.info(f"Found file: {filename}")
            if filename.endswith('.csv'):
                csv_path = os.path.join(extracted_path, filename)
                logging.info(f"Processing CSV file: {csv_path}")
                try:
                    df = pd.read_csv(csv_path, encoding='iso-8859-1', sep=';', engine='python')
                    df.fillna("", inplace=True)
                    json_data = df.to_dict(orient='records')

                    if "cad_agente_auton_pj" in filename:
                        pj_data.extend(json_data)
                        logging.info(f"Processed PJ file: {filename}")
                    elif "cad_agente_auton_pf" in filename:
                        pf_data.extend(json_data)
                        logging.info(f"Processed PF file: {filename}")
                except Exception as e:
                    logging.error(f"Error reading CSV file {csv_path}: {e}")
                    return None, None
        logging.info(f"Completed CSV processing with pandas. PJ Data: {len(pj_data)} entries, PF Data: {len(pf_data)} entries.")
        return pj_data, pf_data
    except Exception as e:
        logging.error(f"Failed to process CSV to JSON with pandas: {e}")
        return None, None

def save_json_locally(json_data, file_name):
    try:
        logging.info(f"Saving JSON data locally to {file_name}")
        with open(file_name, 'w', encoding='utf-8') as f:
            json.dump(json_data, f, ensure_ascii=False, indent=2)
        logging.info(f"Data saved locally to {file_name}.")
    except Exception as e:
        logging.error(f"Error saving JSON locally: {e}")

@app.route('/update_data', methods=['POST'])
def update_data():
    logging.info("Starting the data update process...")
    
    if not download_and_extract_zip(API_URL, EXTRACTED_PATH):
        return jsonify({"error": "Failed to download or extract ZIP"}), 500
    
    pj_data, pf_data = process_csv_to_json_with_pandas(EXTRACTED_PATH)
    if pj_data is None or pf_data is None:
        return jsonify({"error": "Failed to process CSV"}), 500
    
    # Salvar JSON localmente para teste
    save_json_locally(pj_data, 'agente_auton_pj.json')
    save_json_locally(pf_data, 'agente_auton_pf.json')

    logging.info("Data update process completed successfully.")
    return jsonify({"message": "Data processed and saved locally successfully!"}), 200

@app.route('/health_check', methods=['GET'])
def health_check():
    return jsonify({"status": "Healthy"}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
