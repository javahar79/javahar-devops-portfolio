#!/bin/bash
# last_verified: 2026-07-16 · Docker n/a
# Run a container and map its port so I can reach it from my browser
# I kept getting "connection refused" because I had the -p order backwards

# Using nginx: it serves HTTP on port 80 with zero config
docker pull nginx:1.27-alpine

# -p syntax: HOST_PORT:CONTAINER_PORT
# This maps host port 8083 to container port 80
docker run -d --name web-demo -p 8083:80 nginx:1.27-alpine

echo "Container started."
echo "Open http://localhost:8083 in your browser."
echo ""
echo "Stop and remove:"
echo "  docker stop web-demo && docker rm web-demo"
