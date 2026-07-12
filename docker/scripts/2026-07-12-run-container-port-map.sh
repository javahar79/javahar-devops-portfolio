#!/bin/bash
# last_verified: 2026-07-12 · Docker 29.2.0
# Run a container and map its port so I can reach it from the host
# I kept getting "connection refused" — I had the -p order backwards

# Using nginx since it serves HTTP on port 80 by default — no app code needed
docker pull nginx:1.27-alpine

# -p HOST:CONTAINER — I always mix this up
# Maps host port 8082 to container port 80
# So I visit http://localhost:8082, not port 80
docker run -d --name hello-web -p 8082:80 nginx:1.27-alpine

echo "Container started. Test it:"
echo "  curl http://localhost:8082"
echo ""
echo "Stop and clean up:"
echo "  docker stop hello-web && docker rm hello-web"
