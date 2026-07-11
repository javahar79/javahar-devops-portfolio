#!/bin/bash
# last_verified: 2026-07-09 · Docker 4.25

# Build the tagged image from the Dockerfile I just made
docker build -t tagged-demo:0.1.0 -f ../dockerfiles/2026-07-09-tagged-nonroot.Dockerfile .

# Run it in background with port 8082 -> container port 80
# (alpine's default sh doesn't listen on a port, so this is mostly
#  a smoke test that the image built and runs as non-root)
docker run -d --name tagged-demo -p 8082:80 tagged-demo:0.1.0

echo "Waiting a second..."
sleep 2

# Check the container is actually running
docker ps --filter name=tagged-demo

# Peek at the logs to confirm the CMD ran
docker logs tagged-demo

# Clean up
docker stop tagged-demo && docker rm tagged-demo