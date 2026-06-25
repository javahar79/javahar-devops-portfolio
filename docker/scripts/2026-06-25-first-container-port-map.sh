#!/bin/sh
# Run my first container and map its port end to end
# Using Python's built-in HTTP server so no extra dependencies are needed

IMAGE="py-http-test"
HOST_PORT=9090
CONTAINER_PORT=8000

echo "=== 1. Start container with Python HTTP server ==="
# python:3-alpine is ~45MB — much smaller than nginx for a simple HTTP test
# -w /app sets the working directory; python serves files from there
CID=$(docker run -d \
    -p "$HOST_PORT:$CONTAINER_PORT" \
    --name "$IMAGE" \
    -w /app \
    python:3-alpine \
    python -m http.server "$CONTAINER_PORT")
echo "Container ID: $CID"

echo "=== 2. Verify port mapping with docker port ==="
docker port "$IMAGE"

echo "=== 3. Test HTTP response through the mapped port ==="
# Python's http.server needs a moment to start
sleep 2
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:$HOST_PORT")
echo "HTTP $STATUS from localhost:$HOST_PORT"

if [ "$STATUS" = "200" ]; then
    echo "PASS: Port mapping works end to end"
else
    echo "FAIL: Expected 200, got $STATUS"
fi

echo "=== 4. Check container logs ==="
docker logs "$IMAGE" 2>&1 | tail -3

echo "=== 5. Clean up ==="
docker stop "$IMAGE" > /dev/null 2>&1
docker rm "$IMAGE" > /dev/null 2>&1

echo "Done"
