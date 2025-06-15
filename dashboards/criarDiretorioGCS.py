from google.cloud import storage

# Configuração do GCS
bucket_name = "cloud_folder"

# Inicializa a conexão com o GCS
storage_client = storage.Client()
bucket = storage_client.bucket(bucket_name)

def create_directory_in_gcs(bucket_name, directory_path):
    """Cria um diretório no GCS adicionando um objeto vazio no local."""
    blob = bucket.blob(directory_path + "/")  # O "/" final cria um diretório
    blob.upload_from_string('')
    print(f"Diretório '{directory_path}' criado no bucket {bucket_name}.")

# Função para criar a estrutura básica
def setup_gcs_structure(bucket_name):
    directories = [
        "companies",  # Diretório para empresas
        "companies/{company_id}",  # Diretório para uma empresa específica
        "companies/{company_id}/advisors",  # Diretório para advisors de uma empresa
        "companies/{company_id}/advisors/{advisor_id}/clients"  # Diretório para clientes de um advisor específico
    ]
    
    for directory in directories:
        create_directory_in_gcs(bucket_name, directory.format(company_id="example_company", advisor_id="example_advisor"))

# Executa a criação da estrutura
setup_gcs_structure(bucket_name)
