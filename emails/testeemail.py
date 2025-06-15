import sendgrid
from sendgrid.helpers.mail import Mail, Email, To, Content
from google.cloud import storage
import os

# Definir o caminho para o arquivo de credenciais JSON do Firebase
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "/Users/marseau/StratFin/stratfin-393617-firebase-adminsdk-ya4u5-c7f57fd55a.json"

# Função para buscar a API key do SendGrid armazenada no GCS
def obter_sendgrid_api_key(bucket_name, file_path):
    # Inicializando o cliente do GCS
    storage_client = storage.Client()

    # Acessando o bucket e o arquivo onde a chave está armazenada
    bucket = storage_client.get_bucket(bucket_name)
    blob = bucket.blob(file_path)

    # Lendo o conteúdo do arquivo
    api_key = blob.download_as_text()

    return api_key.strip()

# Função para enviar e-mail
def enviar_email(destinatario, assunto, mensagem_html, api_key):
    # Configuração da API SendGrid com a chave obtida do GCS
    sg = sendgrid.SendGridAPIClient(api_key=api_key)

    # E-mail de remetente
    from_email = Email("admin@stratfin.tec.br", "Equipe StratFin")
    
    # E-mail do destinatário
    to_email = To(destinatario)  # Usar o argumento destinatario passado na função
    
    # Assunto do e-mail
    subject = assunto
    
    # Conteúdo do e-mail (HTML)
    content = Content("text/html", mensagem_html)
    
    # Criando o objeto de e-mail
    mail = Mail(from_email, to_email, subject, content)

    # Enviando o e-mail
    response = sg.send(mail)
    
    # Exibindo o status
    print(f"Status Code: {response.status_code}")
    print(f"Body: {response.body}")
    print(f"Headers: {response.headers}")

# Definindo o bucket e caminho do arquivo onde está armazenada a API Key no GCS
bucket_name = 'service_credentials'
file_path = 'SendGridkey.txt'

# Obtendo a API Key do GCS
sendgrid_api_key = obter_sendgrid_api_key(bucket_name, file_path)

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
      <img src="{logo_link}" alt="Logo da StratFin" style="width:150px;"><br>
      StratFin | <a href='https://www.stratfin.tec.br'>www.stratfin.tec.br</a>
    </p>
  </body>
</html>
"""

# Chamando a função para enviar e-mail
enviar_email("marseaufranco@gmail.com", "Bem-vindo à StratFin", mensagem_html, sendgrid_api_key)
