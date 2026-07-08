#!/bin/bash
# last_verified: 2026-07-07 · Docker 4.25

# Quick Node.js server so we have something to run
cat > server.js << 'EOF'
const http = require('http');
http.createServer((req, res) => {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello from container on port 3000!\n');
}).listen(3000);
EOF

cat > package.json << 'EOF'
{"name":"port-map-demo","version":"1.0.0","private":true}
EOF

# Build the image — tags it as port-map-demo:v1
docker build -t port-map-demo:v1 -f ../dockerfiles/2026-07-07-tagged-nonroot.Dockerfile .

# Run with host port 8080 → container port 3000
docker run -d --name port-demo -p 8080:3000 port-map-demo:v1

# Verify the app responds on the mapped port
curl -s http://localhost:8080

# Print container logs to confirm it started cleanly
docker logs port-demo

# Clean up
docker stop port-demo && docker rm port-demo
rm -f server.js package.json
