# last_verified: 2026-07-06 - Docker 27.x

# Build stage — pinned tag for reproducibility
FROM python:3.11-slim AS build
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Runtime stage — strip build deps, switch to non-root
FROM python:3.11-slim AS runtime
WORKDIR /app
COPY --from=build /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY app.py .

# Non-root user — container processes default to root otherwise
RUN addgroup --system app && adduser --system --ingroup app app
USER app

EXPOSE 8080
CMD ["python", "app.py"]
