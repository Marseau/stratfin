import requests
import pprint

# ID do dataset que você identificou
dataset_id = 'agente_auton-cad'

# Endpoint para obter detalhes do dataset
url = f'https://dados.cvm.gov.br/api/3/action/package_show?id={dataset_id}'

# Fazer a requisição HTTP
response = requests.get(url)
if response.status_code == 200:
    dataset_details = response.json()
    pprint.pprint(dataset_details)
else:
    print("Erro ao acessar o dataset")
