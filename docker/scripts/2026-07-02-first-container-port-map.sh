#!/bin/sh
# Run my first container and map its port end to end
# Builds from the tagged non-root Dockerfile, runs it, tests it, cleans up

IMAGE_TAG="hello-server:v1"
CONTAINER_NAME="hello-server"
HOST_PORT="8080"
CONTAINER_PORT="8000"

echo "=== Building $IMAGE_TAG ==="
docker build -t "$IMAGE_TAG" \
  -f dockerfiles/2026-07-02-tagged-nonroot.Dockerfile \
  .

echo ""
echo "=== Running $CONTAINER_NAME on port $HOST_PORT -> $CONTAINER_PORT ==="
docker run -d --name "$CONTAINER_NAME" -p "$HOST_PORT:$CONTAINER_PORT" "$IMAGE_TAG"

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
