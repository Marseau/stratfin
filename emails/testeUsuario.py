import firebase_admin
from firebase_admin import credentials, auth
import time

# Caminho para a chave JSON do Firebase
firebase_key_path = '/Users/marseau/Stratfin/emails/StratFin-393617-firebase-adminsdk-ya4u5-c7f57fd55a.json'

# Inicializar o app do Firebase com a credencial
cred = credentials.Certificate(firebase_key_path)
firebase_admin.initialize_app(cred)

# Função para obter todos os usuários
def get_all_users():
    users = []
    page = auth.list_users()
    while page:
        users.extend(page.users)
        page = page.get_next_page()
    return users

# Função para tentar ler o campo `custom_claims` com polling
def get_custom_claim_with_polling(user_uid, max_attempts=5, delay=5):
    attempt = 0
    while attempt < max_attempts:
        user_record = auth.get_user(user_uid)
        
        # Verificar se `custom_claims` está disponível e contém o campo desejado
        if user_record.custom_claims and 'usuario_tipo' in user_record.custom_claims:
            return user_record.custom_claims.get('usuario_tipo')
        
        # Se não estiver disponível, aguardar e tentar novamente
        print(f"Tentativa {attempt + 1}/{max_attempts}: 'usuario_tipo' ainda não disponível. Tentando novamente em {delay} segundos...")
        attempt += 1
        time.sleep(delay)
    
    # Se atingir o número máximo de tentativas, retornar "Não especificado"
    return "Não especificado"

# Função para monitorar a criação de novos usuários
def monitor_new_users():
    existing_users = set(user.uid for user in get_all_users())

    print("Monitorando novos usuários...")

    while True:
        # Obter a lista atual de usuários
        current_users = set(user.uid for user in get_all_users())
        
        # Detectar novos usuários
        new_users = current_users - existing_users
        if new_users:
            for user_uid in new_users:
                print(f'Novo usuário detectado! UID: {user_uid}')
                
                # Tentar buscar o campo 'usuario_tipo' com polling
                usuario_tipo = get_custom_claim_with_polling(user_uid)
                print(f'Tipo de usuário: {usuario_tipo}')
        
        # Atualizar a lista de usuários existentes
        existing_users = current_users

        # Aguardar 10 segundos antes de verificar novamente
        time.sleep(3)

if __name__ == "__main__":
    monitor_new_users()
