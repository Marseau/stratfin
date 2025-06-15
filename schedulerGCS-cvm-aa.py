from google.cloud import scheduler_v1
from google.cloud.scheduler_v1 import Job
from google.protobuf import duration_pb2
from google.protobuf import timestamp_pb2

# Defina o ID do projeto e a localização
project_id = "stratfin-393617"
location = "us-central1"  # Região central dos EUA
job_name = "cvm-aa"
url = "https://cvm-aa-app-4ums6msurq-uc.a.run.app/update_data"  # Insira o URL do Cloud Run aqui

# Crie um cliente para o Cloud Scheduler
client = scheduler_v1.CloudSchedulerClient()

# Crie o caminho do job
parent = f"projects/{project_id}/locations/{location}"

# Defina o job
job = {
    "name": f"{parent}/jobs/{job_name}",
    "http_target": {
        "http_method": scheduler_v1.HttpMethod.POST,
        "uri": url,
        "oidc_token": {
            "service_account_email": "stratfin-393617@appspot.gserviceaccount.com"  # Use sua conta de serviço padrão
        }
    },
    "schedule": "0 0 */30 * *",
    "time_zone": "America/Chicago"
}

# Crie o job no Cloud Scheduler
try:
    response = client.create_job(request={"parent": parent, "job": job})
    print(f"Job criado com sucesso: {response.name}")
except Exception as e:
    print(f"Erro ao criar o job: {e}")
