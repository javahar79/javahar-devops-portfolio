#!/bin/sh
# Run my first container and map its port end to end
# Builds the tagged Dockerfile, runs it, hits the endpoint, cleans up

IMAGE="hello-web:v1"
CONTAINER="hello-web-test"
HOST_PORT=8080
CTR_PORT=8080

echo "=== Building $IMAGE ==="
docker build -t "$IMAGE" -f dockerfiles/2026-07-04-tagged-nonroot.Dockerfile .

echo ""
echo "=== Running $CONTAINER on host port $HOST_PORT ==="
docker run -d --name "$CONTAINER" -p "$HOST_PORT:$CTR_PORT" "$IMAGE"

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
