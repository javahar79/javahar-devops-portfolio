#!/bin/bash
# last_verified: 2026-07-18 · Docker n/a
# Build a Python image and run it with a port map so I can reach it from the host

# Create a tiny app on the fly for this demo
mkdir -p /tmp/docker-demo && cd /tmp/docker-demo || exit

cat > app.py << 'PYEOF'
from http.server import HTTPServer, BaseHTTPRequestHandler

class HelloHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"Hello from inside the container")

HTTPServer(("0.0.0.0", 8080), HelloHandler).serve_forever()
PYEOF

cat > requirements.txt << 'EOF'
# empty — stdlib only
EOF

# Build with a specific tag so I know exactly what I'm running
docker build -t python-hello:v1.0.0 .

# -p HOST:CONTAINER — map host port 8081 to container port 8080
docker run -d --name hello-demo -p 8081:8080 python-hello:v1.0.0

echo "Container started."
echo "Open http://localhost:8081 to see the response."
echo ""
echo "Stop and remove:"
echo "  docker stop hello-demo && docker rm hello-demo"
