FROM python:3.11-slim

WORKDIR /app

# Chrome/Chromium e driver (se precisar)
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
 && rm -rf /var/lib/apt/lists/*

# Dependências Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Código do projeto
COPY . .

EXPOSE 5000

# Sobe o Flask da carteira
CMD ["gunicorn", "carteira:app", "--bind", "0.0.0.0:5000"]
