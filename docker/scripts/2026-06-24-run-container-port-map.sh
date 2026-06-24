#!/bin/sh
# Run my first container and map its port end to end
# Following the quickstart: build an image, start it with port mapping, verify

IMAGE_NAME="portmap-test"
HOST_PORT=8080
CONTAINER_PORT=80

echo "=== Step 1: Build a minimal nginx image ==="
cat <<DOCKERFILE > /tmp/Dockerfile.portmap
FROM nginx:alpine
# nginx listens on 80 by default inside the container
# we map host:container ports when we run it
DOCKERFILE
docker build -q -t "$IMAGE_NAME" -f /tmp/Dockerfile.portmap .
rm /tmp/Dockerfile.portmap

echo "=== Step 2: Start container with port mapping ==="
ID=$(docker run -d -p "$HOST_PORT:$CONTAINER_PORT" --name "$IMAGE_NAME" "$IMAGE_NAME")
echo "Container ID: $ID"

echo "=== Step 3: Verify the port mapping ==="
docker port "$IMAGE_NAME"

echo "=== Step 4: Test HTTP response ==="
sleep 1
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:$HOST_PORT")
echo "HTTP $STATUS"

if [ "$STATUS" = "200" ]; then
    echo "SUCCESS: Port mapping works — localhost:$HOST_PORT -> container:$CONTAINER_PORT"
else
    echo "WARNING: Expected 200 got $STATUS"
fi

echo "=== Step 5: Check container logs ==="
docker logs "$IMAGE_NAME" 2>/dev/null | tail -3

echo "=== Step 6: Clean up ==="
docker stop "$IMAGE_NAME" > /dev/null
docker rm "$IMAGE_NAME" > /dev/null
docker rmi "$IMAGE_NAME" > /dev/null

echo "Done"
