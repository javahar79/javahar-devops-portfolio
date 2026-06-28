#!/bin/sh
# Run a container with port mapping — end to end
# Using the Go server dockerfile I just wrote so I can test the full build+run flow

IMAGE_TAG="go-server:v1.0.0"
CONTAINER_NAME="go-server"
HOST_PORT="8080"
CONTAINER_PORT="8080"

echo "=== Building $IMAGE_TAG ==="
docker build -t "$IMAGE_TAG" \
  -f dockerfiles/2026-06-28-trying-tagged-go-server.Dockerfile \
  .

echo ""
echo "=== Running $CONTAINER_NAME on port $HOST_PORT ==="
docker run -d --name "$CONTAINER_NAME" -p "$HOST_PORT:$CONTAINER_PORT" "$IMAGE_TAG"

# Giving the Go server a moment to start
sleep 2

echo ""
echo "=== Testing endpoint ==="
curl -s http://localhost:$HOST_PORT
echo ""

echo ""
echo "=== Container logs ==="
docker logs "$CONTAINER_NAME"

echo ""
echo "=== Cleaning up ==="
docker stop "$CONTAINER_NAME"
docker rm "$CONTAINER_NAME"
echo "Done!"
