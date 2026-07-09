# last_verified: 2026-07-09 · Docker n/a

# Tagged build — pinned Python version, not :latest
FROM python:3.12-alpine3.20

RUN addgroup -S app && adduser -S app -G app

WORKDIR /app

# Python's built-in HTTP server — no extra files needed
USER app

EXPOSE 8000

CMD ["python", "-m", "http.server", "8000", "--bind", "0.0.0.0"]
