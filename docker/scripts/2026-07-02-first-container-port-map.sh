#!/bin/sh
# Run an nginx container and map port 8080 on the host to port 80 in the container.
# I keep forgetting which side of -p is host and which is container.

docker run -d --name my-nginx -p 8080:80 nginx:alpine

# Verify it's running
docker ps --filter name=my-nginx

# Make a request to confirm port mapping works
curl -s -o /dev/null -w "%{http_code}" http://localhost:8080
echo ""

# Clean up
docker stop my-nginx
docker rm my-nginx
