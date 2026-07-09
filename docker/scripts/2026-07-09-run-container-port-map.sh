#!/bin/bash
# last_verified: 2026-07-09 · Docker n/a

# Build the minimal tagged image from the dockerfile
docker build -t hello-python:0.1.0 -f ../dockerfiles/2026-07-09-tagged-nonroot.Dockerfile .

# Run container with host port 8082 mapped to container port 8000
docker run -d --name hello-demo -p 8082:8000 hello-python:0.1.0

echo "Waiting for container to start..."
sleep 2

# Verify the port mapping works — HTTP server returns directory listing
curl -s http://localhost:8082

# Check container logs for confirmation
docker logs hello-demo

# Clean up
docker stop hello-demo && docker rm hello-demo
