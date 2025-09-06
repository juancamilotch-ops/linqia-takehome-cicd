FROM python:3.12-slim
WORKDIR /app
COPY . /app
# Instala dependencias si las hubiera (no falla si no existe)
RUN pip install --no-cache-dir -r requirements.txt || true
# Permite pasar argumentos: docker run <img> 2 3
ENTRYPOINT ["python", "-m", "sample_app"]
