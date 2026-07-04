# last_verified: 2026-07-04 · Docker n/a
# Minimal tagged multi-stage build with non-root runtime
# Build stage: alpine + python to create a tiny web server
# Runtime stage: scratch with just the python binary

FROM python:3.13-alpine AS build
WORKDIR /app

# Embedding the server inline so the build is self-contained
RUN cat > server.py << 'PYEOF'
from http.server import HTTPServer, BaseHTTPRequestHandler

class H(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"Hello from a non-root container!\n")

HTTPServer(("0.0.0.0", 8080), H).serve_forever()
PYEOF

# Runtime stage -- clean alpine with a non-root user
FROM python:3.13-alpine
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
COPY --from=build --chown=appuser:appgroup /app /app
USER appuser
WORKDIR /app
EXPOSE 8080
CMD ["python", "server.py"]
