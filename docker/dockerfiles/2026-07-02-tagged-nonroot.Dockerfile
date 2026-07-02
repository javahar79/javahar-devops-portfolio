# Trying a tagged build with non-root runtime — minimal multi-stage
# Build stage: copy source and install deps
FROM python:3.12-alpine AS build
WORKDIR /app

# Self-contained server — one file, no external dependencies
RUN cat > server.py <<'PYEOF'
from http.server import HTTPServer, BaseHTTPRequestHandler

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"Hello from a tagged, non-root container!\n")

HTTPServer(("0.0.0.0", 8000), Handler).serve_forever()
PYEOF

# Runtime stage: ship only what's needed
FROM python:3.12-alpine
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
COPY --from=build --chown=appuser:appgroup /app /app
USER appuser
EXPOSE 8000
CMD ["python", "/app/server.py"]
