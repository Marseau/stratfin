import firebase_admin
from firebase_admin import credentials

# Substitua pelo caminho do seu arquivo JSON de credenciais
cred_path = "/Users/marseau/StratFin/stratfin-393617-firebase-adminsdk-ya4u5-c7f57fd55a.json"

# Inicializar o Firebase Admin SDK
cred = credentials.Certificate(cred_path)
firebase_admin.initialize_app(cred)

print("Conexão com o Firebase estabelecida com sucesso!")
