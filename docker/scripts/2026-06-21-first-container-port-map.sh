#!/bin/sh
# Run a lightweight web server and verify the port mapping end to end

IMAGE="nginx:alpine"
CONTAINER_NAME="test-nginx"
HOST_PORT="8080"
CONTAINER_PORT="80"

echo "=== Starting nginx container on port $HOST_PORT -> $CONTAINER_PORT ==="

docker run -d --name "$CONTAINER_NAME" -p "$HOST_PORT:$CONTAINER_PORT" "$IMAGE"

echo "=== Container started. Checking with docker ps ==="
docker ps --filter "name=$CONTAINER_NAME" --format "table {{.ID}}\t{{.Image}}\t{{.Ports}}"

echo "=== Testing HTTP response from localhost:$HOST_PORT ==="
curl -s -o /dev/null -w "HTTP status: %{http_code}\n" "http://localhost:$HOST_PORT"

echo "=== Stopping and removing container ==="
docker stop "$CONTAINER_NAME"
docker rm "$CONTAINER_NAME"

echo "=== Done ==="
