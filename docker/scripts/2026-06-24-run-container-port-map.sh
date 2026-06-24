#!/bin/sh
# Run my first container end-to-end with port mapping — build, run, test, clean up

IMAGE_NAME="portmap-test"
HOST_PORT=8080
CONTAINER_PORT=80

echo "=== Step 1: build a simple nginx image ==="
docker build -t "$IMAGE_NAME" -f- . <<'DOCKERFILE'
FROM nginx:alpine
# nginx listens on 80 by default — no extra config needed for a basic test
DOCKERFILE

echo "=== Step 2: run container with port mapping ==="
CONTAINER_ID=$(docker run -d -p "$HOST_PORT:$CONTAINER_PORT" "$IMAGE_NAME")
echo "Container ID: $CONTAINER_ID"
sleep 1

echo "=== Step 3: verify with curl ==="
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:$HOST_PORT")
echo "HTTP status from localhost:$HOST_PORT: $STATUS"

if [ "$STATUS" = "200" ]; then
    echo "SUCCESS: Port mapping works — host $HOST_PORT -> container $CONTAINER_PORT"
else
    echo "UNEXPECTED: got $STATUS, expected 200"
fi

echo "=== Step 4: clean up ==="
docker stop "$CONTAINER_ID"
docker rm "$CONTAINER_ID"
docker rmi "$IMAGE_NAME"

echo "Done"
