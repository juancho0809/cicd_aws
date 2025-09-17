FROM python:3.9-slim-buster

LABEL Name="Python Flask Demo App" Version=1.4.2
LABEL org.opencontainers.image.source="https://github.com/benc-uk/python-demoapp"

# Definir dónde trabajamos
WORKDIR /src

# Copiar requirements y luego instalar
COPY src/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto del código
COPY src/ .

# Exponer puerto
EXPOSE 5000

# Usar gunicorn para producción
CMD ["gunicorn", "-b", "0.0.0.0:5000", "run:app"]
