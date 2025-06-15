import requests
from google.cloud import storage
import os

# Definir o caminho para o arquivo de credenciais JSON do Firebase
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "/Users/marseau/StratFin/stratfin-393617-firebase-adminsdk-ya4u5-c7f57fd55a.json"

# Função para buscar a API key da Brevo armazenada no GCS
def obter_brevo_api_key(bucket_name, file_path):
    # Inicializando o cliente do GCS
    storage_client = storage.Client()

    # Acessando o bucket e o arquivo onde a chave está armazenada
    bucket = storage_client.get_bucket(bucket_name)
    blob = bucket.blob(file_path)

    # Lendo o conteúdo do arquivo
    api_key = blob.download_as_text()

    return api_key.strip()

# Função para enviar e-mail via Brevo
def enviar_email(destinatario, assunto, mensagem_html, api_key):
    brevo_url = "https://api.brevo.com/v3/smtp/email"  # URL do endpoint da API da Brevo para envio de e-mails
    
    from_email = "admin@stratfin.tec.br"  # Remetente

    # Parâmetros do e-mail
    data = {
        "sender": {"name": "Equipe StratFin", "email": from_email},
        "to": [{"email": destinatario}],
        "subject": assunto,
        "htmlContent": mensagem_html
    }

    # Fazendo a requisição POST à API da Brevo
    headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "api-key": api_key
    }
    
    response = requests.post(
        brevo_url,
        headers=headers,
        json=data
    )
    
    # Exibindo o status
    print(f"Status Code: {response.status_code}")
    print(f"Response: {response.text}")

# Definindo o bucket e caminho do arquivo onde está armazenada a API Key no GCS
bucket_name = 'service_credentials'
file_path = 'BrevoKey.txt'

# Obtendo a API Key do GCS
brevo_api_key = obter_brevo_api_key(bucket_name, file_path)

# Link do logo da empresa no Firebase Storage
logo_link = "https://firebasestorage.googleapis.com/v0/b/stratfin-393617.appspot.com/o/Logo%20completo%20branco%20com%20fundo%20azul.png?alt=media&token=4a515457-a8c8-453b-90b1-59b19b2cec75"

# Corpo do e-mail com a assinatura usando a fonte Roboto e o logo
mensagem_html = f"""
<html>
  <head>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  </head>
  <body style="font-family: 'Roboto', sans-serif;">
    <p>Olá,</p>
    <p>Bem-vindo à StratFin! Estamos felizes em ter você conosco.</p>
    <p>--</p>
    <p>Atenciosamente,<br>
    Equipe StratFin</p>
    <p>
      <img src="{logo_link}" alt="Logo da StratFin" style="width:100px;"><br>
      StratFin | <a href='https://www.stratfin.tec.br'>www.stratfin.tec.br</a>
    </p>
  </body>
</html>
"""

# Chamando a função para enviar e-mail
enviar_email("marseaufranco@gmail.com", "Bem-vindo à StratFin", mensagem_html, brevo_api_key)
