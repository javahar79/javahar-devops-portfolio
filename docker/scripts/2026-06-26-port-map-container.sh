#!/bin/sh
# Trying nginx on port 8080 to verify port mapping end to end
# The tutorial used -p 80:80 but 80 was taken, so using 8080 instead

echo "Pulling nginx:alpine..."
docker pull nginx:alpine

echo "Starting nginx on host port 8080 -> container port 80..."
docker run -d --name nginx-test -p 8080:80 nginx:alpine

echo "Waiting for container to start..."
sleep 2

echo "Testing with curl..."
curl -s -o /dev/null -w "Status: %{http_code}\n" http://localhost:8080/

echo "Container logs:"
docker logs nginx-test

echo "Cleaning up..."
docker stop nginx-test
docker rm nginx-test
