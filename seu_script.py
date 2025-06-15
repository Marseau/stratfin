import requests
from bs4 import BeautifulSoup
import logging
import os
import json

# Diretório local onde os arquivos JSON serão salvos
LOCAL_OUTPUT_DIR = "./output_ibge"

# Função para salvar JSON localmente
def save_json_locally(json_data, file_name):
    try:
        # Criar diretório de saída se não existir
        if not os.path.exists(LOCAL_OUTPUT_DIR):
            os.makedirs(LOCAL_OUTPUT_DIR)
        
        # Salvar no diretório de saída local
        output_path = os.path.join(LOCAL_OUTPUT_DIR, file_name)
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(json_data, f, ensure_ascii=False, indent=2)
        logging.info(f"Data saved locally at {output_path}")
    except Exception as e:
        logging.error(f"Error saving JSON locally: {e}")

# Função para buscar o salário mínimo de uma página web
def fetch_salario_minimo():
    url = "https://www.example.com/salario-minimo"  # Coloque o URL correto aqui
    try:
        logging.info(f"Fetching salário mínimo from {url}")
        response = requests.get(url)
        response.raise_for_status()
        
        # Parsear o HTML da página
        soup = BeautifulSoup(response.content, "html.parser")
        
        # Exemplo: supondo que o salário mínimo esteja dentro de um elemento <span> com id="salario"
        salario_minimo = soup.find("span", id="salario").text.strip()
        
        # Salvar o valor em JSON
        salario_data = {"salario_minimo": salario_minimo}
        save_json_locally(salario_data, "salario_minimo.json")
        
    except Exception as e:
        logging.error(f"Error fetching salário mínimo: {e}")

# Função para buscar o teto de aposentadoria de uma página web
def fetch_teto_aposentadoria():
    url = "https://www.example.com/teto-aposentadoria"  # Coloque o URL correto aqui
    try:
        logging.info(f"Fetching teto de aposentadoria from {url}")
        response = requests.get(url)
        response.raise_for_status()
        
        # Parsear o HTML da página
        soup = BeautifulSoup(response.content, "html.parser")
        
        # Exemplo: supondo que o teto esteja dentro de um elemento <div> com classe="teto"
        teto_aposentadoria = soup.find("div", class_="teto").text.strip()
        
        # Salvar o valor em JSON
        teto_data = {"teto_aposentadoria": teto_aposentadoria}
        save_json_locally(teto_data, "teto_aposentadoria.json")
        
    except Exception as e:
        logging.error(f"Error fetching teto de aposentadoria: {e}")

# Função principal para buscar e processar todas as informações
def fetch_ibge_data_via_scraping():
    # Buscar salário mínimo
    fetch_salario_minimo()
    
    # Buscar teto de aposentadoria
    fetch_teto_aposentadoria()

# Executar o processo
if __name__ == "__main__":
    fetch_ibge_data_via_scraping()
