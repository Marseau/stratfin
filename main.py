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
import pandas as pd  # Certifique-se de que pandas está instalado

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
                    # Usando pandas para ler o CSV com tratamento de codificação
                    df = pd.read_csv(csv_path, encoding='iso-8859-1', sep=';', engine='python')

                    # Substituir NaN por string vazia
                    df.fillna("", inplace=True)

                    # Converter o DataFrame para JSON
                    json_data = df.to_dict(orient='records')

                    if "cad_agente_auton_pj" in filename:
                        pj_data.extend(json_data)  # Adicionando ao array PJ
                        logging.info(f"Processed PJ file: {filename}")
                    elif "cad_agente_auton_pf" in filename:
                        pf_data.extend(json_data)  # Adicionando ao array PF
                        logging.info(f"Processed PF file: {filename}")
                except Exception as e:
                    logging.error(f"Error reading CSV file {csv_path}: {e}")
                    return None, None
        logging.info(f"Completed CSV processing with pandas. PJ Data: {len(pj_data)} entries, PF Data: {len(pf_data)} entries.")
        return pj_data, pf_data
    except Exception as e:
        logging.error(f"Failed to process CSV to JSON with pandas: {e}")
        return None, None

def upload_json_to_gcs(json_data, bucket_name, destination_blob_name):
    try:
        logging.info(f"Tentando fazer upload do JSON para o bucket {bucket_name}, destino: {destination_blob_name}")
        storage_client = storage.Client()
        bucket = storage_client.bucket(bucket_name)
        blob = bucket.blob(destination_blob_name)

        # Verificar se o blob já existe e remover (opcional)
        if blob.exists():
            logging.info(f"Blob {destination_blob_name} já existe. Preparando para sobrescrever.")

        # Upload do JSON
        blob.upload_from_string(json.dumps(json_data, ensure_ascii=False, indent=2))
        logging.info(f"Arquivo {destination_blob_name} enviado para o bucket {bucket_name}.")
        return True
    except Exception as e:
        logging.error(f"Erro ao fazer upload do JSON para o GCS: {e}")
        return False

def update_last_run_date():
    try:
        logging.info("Updating the last run date in GCS.")
        storage_client = storage.Client()
        bucket = storage_client.bucket('cloud_folder')
        blob = bucket.blob(LAST_RUN_FILE)
        blob.upload_from_string(datetime.now().strftime('%Y-%m-%d'))
        logging.info("Last run date updated.")
    except Exception as e:
        logging.error(f"Failed to update last run date: {e}")

@app.route('/update_data', methods=['POST'])
def update_data():
    logging.info("Starting the data update process...")
    
    if not download_and_extract_zip(API_URL, EXTRACTED_PATH):
        return jsonify({"error": "Failed to download or extract ZIP"}), 500
    
    pj_data, pf_data = process_csv_to_json_with_pandas(EXTRACTED_PATH)
    if pj_data is None or pf_data is None:
        return jsonify({"error": "Failed to process CSV"}), 500
    
    pj_uploaded = upload_json_to_gcs(pj_data, 'cloud_folder', 'json_output/agente_auton_pj.json')
    pf_uploaded = upload_json_to_gcs(pf_data, 'cloud_folder', 'json_output/agente_auton_pf.json')

    if not pj_uploaded or not pf_uploaded:
        return jsonify({"error": "Failed to upload one or both JSON files to GCS"}), 500

    update_last_run_date()

    logging.info("Data update process completed successfully.")
    return jsonify({"message": "Data processed and uploaded successfully!"}), 200

@app.route('/health_check', methods=['GET'])
def health_check():
    return jsonify({"status": "Healthy"}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5500)
