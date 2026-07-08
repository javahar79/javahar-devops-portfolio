#!/bin/bash
# last_verified: 2026-07-06 - Docker 27.x

# Build the image from the Dockerfile in the current directory
docker build -t my-app:latest .

# Run the container, mapping host port 8080 to container port 8080
# Using --rm so the container cleans up after itself on stop
# I used -d here to get the terminal back — first time I forgot it and
# the container ate my shell
docker run -d --rm -p 8080:8080 --name my-app-container my-app:latest

echo "Container started on http://localhost:8080"
echo "Stop it with: docker stop my-app-container"
