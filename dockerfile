# Usar uma imagem base do Python 3.9 (ou outra versão compatível com sua aplicação)
FROM python:3.9-slim

# Definir variáveis de ambiente
ENV PYTHONUNBUFFERED=1 \
    FLASK_APP=app.py \
    FLASK_RUN_HOST=0.0.0.0 \
    FLASK_RUN_PORT=8080

# Definir diretório de trabalho
WORKDIR /app

# Copiar apenas os arquivos necessários para instalar as dependências
COPY requirements.txt /app/requirements.txt

# Instalar as dependências do projeto
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copiar todo o código do projeto para o contêiner
COPY . /app

# Expor a porta do Flask
EXPOSE 8080

# Comando de entrada para iniciar o aplicativo
CMD ["flask", "run"]
