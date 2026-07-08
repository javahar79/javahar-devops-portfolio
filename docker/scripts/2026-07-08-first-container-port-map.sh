#!/bin/bash
# last_verified: 2026-07-08 · Docker 4.25

# Build the tagged multi-stage image
docker build -t port-map-demo:0.1.0 -f ../dockerfiles/2026-07-08-tagged-nonroot.Dockerfile .

# Run with host port 8081 mapped to container port 8000
# Using 8081 in case 8080 is occupied
docker run -d --name port-demo -p 8081:8000 port-map-demo:0.1.0

echo "Waiting for container to start..."
sleep 2

# Hit the server to confirm port mapping works
curl -s http://localhost:8081

# Show container logs for extra verification
docker logs port-demo

# Clean up
docker stop port-demo && docker rm port-demo
