#!/usr/bin/env bash
# last_verified: 2026-08-12 · devops n/a

# con-057: Container Fundamentals + Networking Basics — container networking patterns
# This script walks through the three networking modes a container can use and
# the one flag that matters most for service discovery: joining a shared network.
# It combines the container lifecycle (run/inspect) with basic networking
# concepts (interfaces, DNS, port mapping).

DOCKER_OK=1
command -v docker >/dev/null 2>&1 || DOCKER_OK=0

run_docker() {
  # If docker isn't available here, print what the command would do so the
  # pattern still demonstrates the concept.
  if [ "$DOCKER_OK" -eq 1 ]; then
    docker "$@"
  else
    echo "  (docker unavailable — would run: docker $*)"
  fi
}

echo "=== Container networking patterns ==="

echo ""
echo "--- Pattern 1: Bridge network (the default) ---"
# Every container gets its own virtual interface and an IP on the host's
# docker bridge (docker0). Outbound traffic is NAT'd through the host — the
# container can reach the internet, but nothing reaches the container unless
# a port is published.
run_docker network inspect bridge --format '{{.Name}} {{.Driver}}' 2>/dev/null \
  || echo "  bridge network exists (default, driver=bridge)"

echo ""
echo "--- Pattern 2: Host network (no isolation) ---"
# With --network host the container shares the host's network namespace and
# binds ports directly on the host IP. Fast and simple, but there is no
# network isolation between the container and the host processes.
echo "  run_docker run --rm --network host alpine ip addr"
echo "  -> shows the host interfaces, not a container-only eth0"

echo ""
echo "--- Pattern 3: None network (fully isolated) ---"
# With --network none the container gets only its loopback interface — no
# external connectivity at all. Useful for containers doing pure local
# computation that must not touch the network.
echo "  run_docker run --rm --network none alpine ip addr"
echo "  -> only 'lo' is present, no eth0"

echo ""
echo "--- Publishing a port: -p host:container ---"
# Port publishing maps host traffic onto an otherwise-unreachable bridge
# container. The container process still listens on its own port inside its
# namespace; docker forwards host xxxx -> container 80 for us.
echo "  run_docker run -d -p 8080:80 --name web nginx"
echo "  -> curl localhost:8080 reaches nginx inside the container"

echo ""
echo "--- Service discovery: sharing one user-defined network ---"
# Containers on separate default-bridge networks can't reach each other by
# name. Putting them on one user-defined network gives each a container-name
# DNS record, which is the pattern multi-container apps rely on.
NET="demo-net"
run_docker network create "$NET" 2>/dev/null || echo "  network '$NET' already present"
echo "  run_docker run -d --name api --network $NET myapp"
echo "  run_docker run -d --name web --network $NET nginx"
echo "  -> 'web' can resolve and reach 'api' by name on the shared network"
run_docker network rm "$NET" 2>/dev/null || true

echo ""
echo "=== Networking patterns complete ==="