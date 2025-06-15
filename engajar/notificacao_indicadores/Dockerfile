# Use a imagem base do Python
FROM python:3.11-slim

# Defina o diretório de trabalho no container
WORKDIR /app

# Copie o arquivo de requisitos e instale as dependências
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copie o código da aplicação para o diretório de trabalho
COPY . .

# Copie o arquivo de credenciais para o container
COPY stratfin-393617-firebase-adminsdk-ya4u5-c7f57fd55a.json /app/credenciais.json

# Exponha a porta 8080
EXPOSE 8080

# Defina o comando de inicialização
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--timeout", "120", "notificacao_indicadores:app"]

