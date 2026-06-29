#!/bin/sh
# Run nginx and verify the port mapping end to end

IMG="nginx:alpine"
CONTAINER="port-test-nginx"

echo "==> Pulling $IMG..."
docker pull "$IMG" > /dev/null

echo "==> Starting nginx on host port 9090 -> container port 80..."
docker run -d --name "$CONTAINER" -p 9090:80 "$IMG"

sleep 2

echo "==> Checking container is running..."
docker ps --filter "name=$CONTAINER" --format "{{.Names}} {{.Status}}"

echo "==> Testing HTTP response via mapped port..."
curl -s -o /dev/null -w "HTTP %{http_code}" http://localhost:9090
echo

echo "==> Cleaning up..."
docker stop "$CONTAINER" > /dev/null
docker rm "$CONTAINER" > /dev/null
echo "Done."
