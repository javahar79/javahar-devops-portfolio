#!/bin/sh
# Run a container and verify port mapping end to end
# Using nginx:alpine because it's small (~23MB) and serves HTTP on port 80

set -e

IMAGE="nginx:alpine"
NAME="port-test"
HOST_PORT=8080
CONTAINER_PORT=80

echo "=== Pulling $IMAGE ==="
docker pull "$IMAGE" --quiet

echo "=== Starting container ==="
# -d  detached mode
# --rm remove container when stopped
CID=$(docker run -d \
    --name "$NAME" \
    -p "$HOST_PORT:$CONTAINER_PORT" \
    "$IMAGE")
echo "Container ID: $(echo "$CID" | cut -c1-12)"

echo "=== Checking port mapping ==="
docker port "$NAME"

echo "=== Testing HTTP access ==="
# nginx starts fast but curl immediately to be safe
sleep 1
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:$HOST_PORT")
echo "HTTP $HTTP_CODE from localhost:$HOST_PORT"

if [ "$HTTP_CODE" = "200" ]; then
    echo "SUCCESS: Port mapping works"
else
    echo "FAIL: Expected 200, got $HTTP_CODE"
    exit 1
fi

echo "=== Container logs ==="
docker logs "$NAME" 2>&1 | tail -3

echo "=== Cleaning up ==="
docker stop "$NAME" > /dev/null
echo "Done"
