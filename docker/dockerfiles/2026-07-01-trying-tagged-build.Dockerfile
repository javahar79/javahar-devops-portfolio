# Trying a tagged multi-stage build with non-root runtime
# Keeping everything self-contained so I don't need external files

FROM python:3.12-alpine AS build
WORKDIR /app

# Embedding a tiny HTTP server inline
RUN cat > app.py <<'PYEOF'
from http.server import HTTPServer, BaseHTTPRequestHandler

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"Hello from a tagged, non-root container!\n")

HTTPServer(("0.0.0.0", 5000), Handler).serve_forever()
PYEOF

# Runtime stage — clean alpine, no build toolchain
FROM python:3.12-alpine
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
COPY --from=build --chown=appuser:appgroup /app /app
USER appuser
WORKDIR /app
EXPOSE 5000
CMD ["python", "app.py"]
