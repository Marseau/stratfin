# Use uma imagem base oficial do Python do Docker Hub
FROM python:3.9-slim

# Defina o diretório de trabalho
WORKDIR /app

# Copie o arquivo de requisitos para o contêiner
COPY requirements.txt .

# Instale as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copie o código da aplicação para o contêiner
COPY . .

# Exponha a porta em que o Flask irá rodar
EXPOSE 8080

# Comando para iniciar a aplicação
CMD ["python3", "app.py"]
