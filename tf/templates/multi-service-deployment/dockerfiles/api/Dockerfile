# last_verified: 2026-08-09 · docker n/a

FROM python:slim

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN addgroup --system --gid 1001 appuser && \
    adduser --system --uid 1001 --ingroup appuser --no-create-home appuser

USER appuser
EXPOSE 8001
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8001/health')" || exit 1
CMD ["python", "app.py"]
