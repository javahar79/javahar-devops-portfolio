#!/bin/sh
# First attempt at running a container with port mapping
# I tried -p 8080:80 first and it worked, then tested with explicit protocol

IMAGE="nginx:alpine"
CONTAINER_NAME="test-nginx"

echo "Pulling $IMAGE..."
docker pull "$IMAGE" > /dev/null 2>&1

echo "Starting $CONTAINER_NAME on host port 8080 -> container port 80..."
docker run -d --name "$CONTAINER_NAME" -p 8080:80 "$IMAGE"

echo "Container started. Checking status..."
docker ps --filter "name=$CONTAINER_NAME" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo "Testing with curl at http://localhost:8080..."
curl -sI http://localhost:8080 | head -3

echo "Stopping and removing container..."
docker stop "$CONTAINER_NAME" > /dev/null
docker rm "$CONTAINER_NAME" > /dev/null
echo "Done."
