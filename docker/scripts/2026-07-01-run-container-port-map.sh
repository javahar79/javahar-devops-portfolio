#!/bin/sh
# Run a container with port mapping end to end
# Builds the Dockerfile I just created, runs it, and verifies the port

IMAGE="py-web:v1"
CONTAINER="py-web-test"
HOST_PORT=5000
CONTAINER_PORT=5000

echo "=== Building $IMAGE ==="
docker build -t "$IMAGE" -f dockerfiles/2026-07-01-trying-tagged-build.Dockerfile .

echo ""
echo "=== Running $CONTAINER on port $HOST_PORT ==="
docker run -d --name "$CONTAINER" -p "$HOST_PORT:$CONTAINER_PORT" "$IMAGE"

sleep 2

echo ""
echo "=== Testing endpoint ==="
curl -s http://localhost:$HOST_PORT
echo ""

echo ""
echo "=== Container logs ==="
docker logs "$CONTAINER"

echo ""
echo "=== Cleaning up ==="
docker stop "$CONTAINER"
docker rm "$CONTAINER"
echo "Done!"
