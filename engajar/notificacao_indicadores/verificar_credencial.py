import google.auth

# Verifica a conta de serviço usada
credentials, project = google.auth.default()
print(f"Usando a conta de serviço: {credentials.service_account_email}")
