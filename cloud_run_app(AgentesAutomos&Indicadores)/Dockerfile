# Usar uma imagem mais completa
FROM python:3.9

# Definir o diretório de trabalho
WORKDIR /app

# Instalar bibliotecas de compilação, se necessário
RUN apt-get update && apt-get install -y gcc build-essential

# Copiar o arquivo requirements.txt para a imagem
COPY requirements.txt requirements.txt

# Instalar dependências
RUN pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

# Copiar o código da aplicação para a imagem
COPY . .

# Expor a porta que será utilizada pela aplicação
EXPOSE 8080

RUN pip install gunicorn

# Comando para iniciar a aplicação
CMD ["gunicorn", "--timeout", "120", "--bind", "0.0.0.0:8080", "app:app"]


