#!/bin/sh
# Run a tiny Python HTTP server container and verify port mapping end to end
# Using python:3.12-alpine as the base — pulls fast, runs small

IMAGE="python:3.12-alpine"
CONTAINER="port-test-py"
HOST_PORT=8888
CONTAINER_PORT=5000

echo "=== Step 1: Start container with port mapping ==="
CONTAINER_ID=$(docker run -d --name "$CONTAINER" -p "$HOST_PORT:$CONTAINER_PORT" "$IMAGE" python -m http.server "$CONTAINER_PORT")
echo "Container ID: $(echo "$CONTAINER_ID" | cut -c1-12)"

echo "=== Step 2: Inspect the mapping ==="
docker port "$CONTAINER"

echo "=== Step 3: Hit the server ==="
sleep 1
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:$HOST_PORT")
echo "HTTP $HTTP_CODE on localhost:$HOST_PORT"

if [ "$HTTP_CODE" = "200" ]; then
    echo "PASS: Port mapping works"
else
    echo "FAIL: Expected 200, got $HTTP_CODE"
fi

echo "=== Step 4: Clean up ==="
docker stop "$CONTAINER" > /dev/null 2>&1
docker rm "$CONTAINER" > /dev/null 2>&1
echo "Done"
