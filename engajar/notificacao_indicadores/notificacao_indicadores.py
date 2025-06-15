from flask import Flask
from google.cloud import storage
import firebase_admin
from firebase_admin import credentials, firestore
from datetime import datetime
import os

app = Flask(__name__)

# Inicializa o cliente de armazenamento do Google Cloud
storage_client = storage.Client()

# Nome do bucket e arquivo de credenciais
bucket_name = 'service_credentials'
blob_name = 'stratfin-393617-firebase-adminsdk-ya4u5-c7f57fd55a.json'
local_json_path = '/app/credenciais.json'



# Nome do bucket e arquivo de data
bucket_data_name = 'cloud_folder'
blob_data_name = 'last_run_date.txt'
local_data_path = '/tmp/ultima_data.txt'

# Função para baixar a nova credencial do GCS
def baixar_nova_credencial():
    try:
        bucket = storage_client.get_bucket(bucket_name)
        blob = bucket.blob(blob_name)
        blob.download_to_filename(local_json_path)
        print(f"Arquivo de credenciais {blob_name} baixado com sucesso.")
    except Exception as e:
        print(f"Erro ao baixar o arquivo de credenciais: {e}")

# Inicializa o Firebase Admin SDK
def inicializar_firebase():
    try:
        if not firebase_admin._apps:
            print(f"Tentando carregar credenciais de {local_json_path}")
            cred = credentials.Certificate(local_json_path)
            firebase_admin.initialize_app(cred)
            print("Firebase Admin SDK inicializado com sucesso.")
        else:
            print("Firebase Admin SDK já foi inicializado.")
    except Exception as e:
        print(f"Erro ao inicializar o Firebase Admin SDK: {e}")
        raise e  # Faz o programa falhar se não conseguir inicializar o Firebase


# Função para baixar a data do arquivo last_run_date.txt
def obter_data_arquivo():
    try:
        bucket = storage_client.get_bucket(bucket_data_name)
        blob = bucket.blob(blob_data_name)
        blob.download_to_filename(local_data_path)
        with open(local_data_path, 'r') as f:
            data = f.read().strip()
            print(f"Data do arquivo last_run_date.txt: {data}")
            return data
    except Exception as e:
        print(f"Erro ao acessar o bucket ou o arquivo: {e}")
        return None

# Função para comparar datas corretamente
def comparar_datas():
    data_ultima_execucao = None
    # Ler a data armazenada localmente (ultima_data.txt)
    if os.path.exists(local_data_path):
        with open(local_data_path, 'r') as f:
            data_ultima_execucao = f.read().strip()
        print(f"Data da última execução: {data_ultima_execucao}")
    else:
        print("Nenhuma data de execução anterior encontrada.")
    
    # Ler a data do arquivo last_run_date.txt no bucket
    data_arquivo = obter_data_arquivo()

    # Se existir data local e data do arquivo, faz a comparação
    if data_ultima_execucao and data_arquivo:
        data_ultima_execucao_formatada = datetime.strptime(data_ultima_execucao, '%Y-%m-%d')
        data_arquivo_formatada = datetime.strptime(data_arquivo, '%Y-%m-%d')

        # Somente processar notificações se a data do arquivo for posterior à data local
        if data_arquivo_formatada > data_ultima_execucao_formatada:
            print(f"A data {data_arquivo} é posterior a {data_ultima_execucao}. Processando notificações.")
            return True
        else:
            print(f"A data {data_arquivo} não é posterior a {data_ultima_execucao}. Nenhuma notificação será criada.")
            return False
    elif not data_ultima_execucao:
        # Se não existir uma data local (primeira execução)
        print("Primeira execução, processando notificações.")
        return True
    else:
        # Se houver algum problema com a leitura da data
        print("Erro ao comparar as datas.")
        return False

# Função principal para processar notificações
def processar_notificacoes():
    # Não precisamos passar data_atual para comparar_datas()
    if comparar_datas():
        try:
            db = firestore.client()

            users_ref = db.collection('users').where('notificacao', '==', True)
            docs = users_ref.stream()

            print("Processando notificações...")
            for doc in docs:
                user_data = doc.to_dict()
                email = user_data.get('email', 'Email não disponível')
                user_id = doc.id

                # Atualiza a coleção de notificações
                notificacao_data = {
                    'data_notificacao': firestore.SERVER_TIMESTAMP,
                    'tipo_notificacao': 'Novos indicadores',
                    'user': user_id,
                    'enviado_por': 'Sistema',
                    'texto_notificacao': 'Novos indicadores publicados. Confira as informações.'
                }
                db.collection('notificacao').add(notificacao_data)
                print(f"Notificação registrada para o usuário {email}")
            
            # Atualiza a data no arquivo last_run_date.txt
            data_atual = datetime.now().strftime('%Y-%m-%d')
            with open(local_data_path, 'w') as f:
                f.write(data_atual)
            print(f"Data atual {data_atual} gravada no arquivo.")

        except Exception as e:
            print(f"Erro ao processar notificações: {e}")
    else:
        print("Nenhuma notificação foi processada.")


# Rota para Cloud Scheduler
@app.route('/executar_job', methods=['GET', 'POST'])
def executar_job():
    # Baixa a credencial e inicializa o Firebase
    baixar_nova_credencial()
    inicializar_firebase()

    # Processa as notificações
    processar_notificacoes()

    return "Job Executado com sucesso.", 200

# Inicia o servidor Flask
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 8080)))
