#!/bin/bash
# last_verified: 2026-07-04 · Docker 4.25

# Build the image first — tags it as port-map-demo
docker build -t port-map-demo -f ../dockerfiles/2026-07-04-tagged-nonroot.Dockerfile .

# Run with host port 8080 mapping to container port 8000
docker run -d --name port-demo -p 8080:8000 port-map-demo

# Verify it's reachable
curl -s http://localhost:8080 | head -n 5

# Check container logs to confirm it's serving
docker logs port-demo

# Clean up
docker stop port-demo && docker rm port-demo
