#!/bin/bash
# last_verified: 2026-07-07 · Docker 4.25

# Build the image with a tag so we can reference it easily
docker build -t hello-server -f ../dockerfiles/2026-07-07-tagged-nonroot.Dockerfile .

# Run it — map host port 9090 to container port 8080
# Using --rm so the container cleans itself up after stop
docker run -d --name hello-demo -p 9090:8080 --rm hello-server

# Give it a second to start, then test the endpoint
sleep 1
curl -s http://localhost:9090

echo ""
echo "--- logs ---"
docker logs hello-demo

# Stop removes the container automatically because of --rm
docker stop hello-demo
