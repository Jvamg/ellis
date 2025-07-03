FROM python:3.13.5-alpine3.22

# Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instalar as dependências do projeto
# A flag --no-cache-dir ajuda a manter a imagem menor
RUN pip install --no-cache-dir -r requirements.txt

# Copiar todos os arquivos do projeto para o diretório de trabalho
COPY . .

# Expor a porta em que a aplicação irá rodar
EXPOSE 8000

# Comando para iniciar a aplicação quando o contêiner for executado
# O host 0.0.0.0 permite que a aplicação seja acessível de fora do contêiner
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
