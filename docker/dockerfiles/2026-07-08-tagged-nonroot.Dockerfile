# last_verified: 2026-07-08 · Docker 4.25

# Build stage — pin a specific tag, not :latest
FROM python:3.11-slim AS builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Runtime stage — same base but stripped down
FROM python:3.11-slim

# Create non-root user before switching
RUN addgroup --system app && adduser --system --ingroup app app

WORKDIR /app
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin
COPY server.py .

USER app

EXPOSE 8000

CMD ["python", "server.py"]
