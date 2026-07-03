#!/bin/sh
# last_verified: 2026-07-03 - Docker 4.25
# Build the tagged Dockerfile and test port mapping end to end
# Uses the 2026-07-03 tagged non-root Dockerfile from dockerfiles/

IMAGE_TAG="my-app:v1.0.0"
CONTAINER_NAME="my-app-test"
HOST_PORT="8080"
CONTAINER_PORT="8080"

echo "=== Building $IMAGE_TAG ==="
docker build -t "$IMAGE_TAG" \
  -f dockerfiles/2026-07-03-minimal-tagged-nonroot.Dockerfile \
  .

echo ""
echo "=== Running $CONTAINER_NAME on port $HOST_PORT ==="
# -d for detached, -p maps host:container port
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
