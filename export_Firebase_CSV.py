import firebase_admin
from firebase_admin import credentials, firestore
import pandas as pd
from datetime import datetime

def export_firebase_csv():
    # Caminho para o arquivo de credenciais JSON do Firebase
    cred = credentials.Certificate('/Users/marseau/StratFin/stratfin-393617-firebase-adminsdk-ya4u5-c7f57fd55a.json')
    firebase_admin.initialize_app(cred)

    # Inicializa o Firestore
    db = firestore.client()

    # Pergunta ao usuário o nome da coleção
    collection_name = input('Digite o nome da coleção que deseja exportar: ')

    # Pega todos os documentos da coleção
    docs = db.collection(collection_name).stream()

    # Extrai os dados para uma lista de dicionários
    data = []
    for doc in docs:
        doc_data = doc.to_dict()
        doc_data['id'] = doc.id  # Adiciona o ID do documento ao dicionário
        data.append(doc_data)

    # Cria um DataFrame com os dados
    df = pd.DataFrame(data)

    # Gera o nome do arquivo com base na coleção e na data atual
    date_str = datetime.now().strftime('%Y%m%d')
    output_filename = f'{collection_name}_{date_str}.csv'

    # Exporta para um arquivo CSV
    df.to_csv(output_filename, index=False)

    print(f'Dados exportados com sucesso para {output_filename}')

# Chama a função
if __name__ == '__main__':
    export_firebase_csv()
