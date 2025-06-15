from flask import Flask, request, jsonify
import firebase_admin
from firebase_admin import credentials, firestore
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from datetime import datetime, timedelta
import os
import logging

app = Flask(__name__)
logging.basicConfig(level=logging.INFO)

# Inicializar o Firebase Admin SDK
try:
    cred = credentials.Certificate('serviceAccountKey.json')
    firebase_admin.initialize_app(cred)
    db = firestore.client()
except Exception as e:
    logging.error(f"Erro ao inicializar Firebase: {e}")

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/send_invitations', methods=['POST'])
def send_invitations():
    now = datetime.now()
    five_days_ago = now - timedelta(days=5)

    try:
        invited_docs = db.collection('convidados').stream()
        for doc in invited_docs:
            convidado = doc.to_dict()
            logging.info(f"Processando convidado: {convidado}")
            if not convidado.get('enviado', False):
                send_email(convidado)
                doc_ref = db.collection('convidados').document(doc.id)
                doc_ref.update({
                    'data_envio': now,
                    'enviado': True,
                    'status': 'enviado'
                })
            elif convidado.get('enviado') and convidado.get('status') == 'enviado' and convidado.get('data_login') is None:
                data_envio = convidado.get('data_envio').replace(tzinfo=None)
                if data_envio < five_days_ago:
                    send_email(convidado, reenvio=True)
                    doc_ref = db.collection('convidados').document(doc.id)
                    doc_ref.update({
                        'data_reenvio': now,
                        'status': 'reenviado'
                    })
        return jsonify({"status": "Processado"})
    except Exception as e:
        logging.error(f"Erro ao processar convites: {e}")
        return jsonify({"status": "Erro", "message": str(e)}), 500

def send_email(convidado, reenvio=False):
    try:
        sender_email = convidado.get('email_emissor')
        receiver_email = convidado.get('email')
        link = convidado.get('link')
        nome_completo = convidado.get('nome_completo')
        subject = "Convite para participar do nosso App"
        body = f"Olá {nome_completo},\n\nGostaríamos de convidá-lo para participar do nosso App. Clique no link abaixo para se registrar:\n{link}\n\nAtenciosamente,\nEquipe"

        if reenvio:
            subject = "Lembrete: Convite para participar do nosso App"
            body = f"Olá {nome_completo},\n\nGostaríamos de lembrá-lo sobre nosso convite para participar do nosso App. Clique no link abaixo para se registrar:\n{link}\n\nAtenciosamente,\nEquipe"

        msg = MIMEMultipart()
        msg['From'] = sender_email
        msg['To'] = receiver_email
        msg['Subject'] = subject
        msg.attach(MIMEText(body, 'plain'))

        smtp_server = os.getenv('SMTP_SERVER')
        smtp_port = os.getenv('SMTP_PORT')
        smtp_user = os.getenv('SMTP_USER')
        smtp_password = os.getenv('SMTP_PASSWORD')

        server = smtplib.SMTP(smtp_server, smtp_port)
        server.starttls()
        server.login(smtp_user, smtp_password)
        text = msg.as_string()
        server.sendmail(sender_email, receiver_email, text)
        server.quit()
        logging.info(f"Email enviado para {receiver_email}")
    except Exception as e:
        logging.error(f"Falha ao enviar email para {receiver_email}: {e}")

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
