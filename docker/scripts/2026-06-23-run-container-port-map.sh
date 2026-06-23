#!/bin/sh
# Run my first container with port mapping — from build to browser
# Following the Docker quickstart: build an image, run it, map port, verify

IMAGE_NAME="hello-portmap"
HOST_PORT=8080
CONTAINER_PORT=80

echo "=== Building a simple nginx-alpine image ==="
cat <<DOCKERFILE > /tmp/Dockerfile.portmap
FROM nginx:alpine
# nginx listens on 80 by default — just need to map host:container
DOCKERFILE

docker build -t "$IMAGE_NAME" -f /tmp/Dockerfile.portmap .
rm /tmp/Dockerfile.portmap

echo "=== Running container with port map: localhost:$HOST_PORT -> container:$CONTAINER_PORT ==="
CONTAINER_ID=$(docker run -d -p "$HOST_PORT:$CONTAINER_PORT" --name "$IMAGE_NAME" "$IMAGE_NAME")
echo "Container started: $CONTAINER_ID"

echo "=== Testing with curl ==="
sleep 1
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:$HOST_PORT")
echo "HTTP status: $STATUS"

if [ "$STATUS" = "200" ]; then
    echo "SUCCESS: Port mapping works"
else
    echo "WARNING: Expected 200 but got $STATUS"
fi

echo "=== Cleaning up ==="
docker stop "$CONTAINER_ID" > /dev/null
docker rm "$CONTAINER_ID" > /dev/null
docker rmi "$IMAGE_NAME" > /dev/null

echo "Done"
