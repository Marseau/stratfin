import requests
import pandas as pd

# Passo 1: Obter os dados da API
url = 'https://dados.cvm.gov.br/api/3/action/package_list'
response = requests.get(url)

# Verifica se a requisição foi bem-sucedida
if response.status_code == 200:
    data = response.json()
    
    # Passo 2: Converter os dados para um DataFrame
    dataset_ids = data['result']
    df = pd.DataFrame(dataset_ids, columns=['Dataset ID'])

    # Passo 3: Exportar para um arquivo Excel ou CSV
    df.to_csv('datasets_cvm.csv', index=False)  # Salva como CSV
    df.to_excel('datasets_cvm.xlsx', index=False)  # Salva como Excel
    print("Dados exportados com sucesso!")
else:
    print("Erro ao acessar a API.")
