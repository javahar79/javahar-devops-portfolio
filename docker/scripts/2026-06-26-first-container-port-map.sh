#!/bin/sh
# Run nginx and expose port 8080 to verify end-to-end port mapping
# Using nginx:alpine because it's a tiny image (~23MB) with a known default page

IMAGE="nginx:alpine"
CONTAINER_NAME="port-test-nginx"
HOST_PORT=8080
CONTAINER_PORT=80

echo "=== Step 1: Pull $IMAGE (if not cached) ==="
docker pull "$IMAGE" --quiet

echo "=== Step 2: Start nginx container with port mapping ==="
# -d runs detached, --rm cleans up on stop
CID=$(docker run -d \
    --name "$CONTAINER_NAME" \
    -p "$HOST_PORT:$CONTAINER_PORT" \
    "$IMAGE")
echo "Container started: $(echo "$CID" | cut -c1-12)"

echo "=== Step 3: Verify the port mapping ==="
docker port "$CONTAINER_NAME"

echo "=== Step 4: Hit nginx through the mapped port ==="
# nginx starts almost instantly, but give it 1s to be safe
sleep 1
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:$HOST_PORT")
echo "HTTP $HTTP_CODE from localhost:$HOST_PORT"

if [ "$HTTP_CODE" = "200" ]; then
    echo "PASS: Port mapping works end to end"
else
    echo "FAIL: Expected 200, got $HTTP_CODE"
fi

echo "=== Step 5: Quick log check ==="
docker logs "$CONTAINER_NAME" 2>&1 | tail -2

echo "=== Step 6: Clean up ==="
docker stop "$CONTAINER_NAME" > /dev/null
echo "Done"
