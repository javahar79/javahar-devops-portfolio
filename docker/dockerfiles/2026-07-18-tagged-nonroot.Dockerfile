# last_verified: 2026-07-18 · Docker n/a
# Multi-stage build for a Python app, pinned tag, non-root runtime
# Build:  docker build -t my-py-app:v1.0.0 .
# Run:    docker run --rm -p 8080:8080 my-py-app:v1.0.0

FROM python:3.12-slim AS builder
WORKDIR /src
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

FROM python:3.12-slim
RUN adduser --disabled-password --gecos "" appuser
COPY --from=builder /src /app
WORKDIR /app
USER appuser
EXPOSE 8080
CMD ["python", "app.py"]
