# Usar uma imagem base do Python
FROM python:3.9-slim

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos do projeto para o diretório de trabalho
COPY . /app

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Define a porta que o Flask irá usar
EXPOSE 8080

# Define variáveis de ambiente padrão (pode ser configurado no deploy)
ENV BASE_API_URL=https://us-central1-stratfin-393617.cloudfunctions.net/getFileFromGCS
ENV WEBVIEW_URL=https://dashboard-indicadores-473172521347.us-central1.run.app/dashboard

# Comando para rodar a aplicação
CMD ["python3", "main.py"]
