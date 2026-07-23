#!/usr/bin/env bash
# last_verified: 2026-07-23 · docker 27.x

# Purpose: Wire resource limits, health checks, and volume cleanup into a Docker workflow
# Prerequisites: Docker Engine 24+
# Usage: ./docker-workflow-limits-healthcheck-cleanup.sh

# This is one way to set limits — the docs also suggest --memory-reservation
# for soft limits, but I stuck with --memory for now since it's clearer.

set -euo pipefail

CLEANUP_ONLY="${1:-}"

if [ "$CLEANUP_ONLY" = "cleanup" ]; then
    echo "=== Cleanup: removing containers and volume ==="
    docker rm -f web db 2>/dev/null || true
    docker volume rm app-data 2>/dev/null || true
    docker container prune --force --filter "until=24h" 2>/dev/null || true
    docker volume prune --force 2>/dev/null || true
    echo "Done"
    exit 0
fi

# --- Step 1: Create a named volume ---
echo "=== Creating named volume ==="
docker volume create app-data

# --- Step 2: Run web container with limits + health check ---
echo ""
echo "=== Starting web container (nginx) ==="
docker run -d \
    --name web \
    --memory="256m" \
    --cpus="0.5" \
    --health-cmd="curl -sf http://localhost/ || exit 1" \
    --health-interval=10s \
    --health-retries=3 \
    --health-start-period=5s \
    -p 8080:80 \
    nginx:alpine

# --- Step 3: Run db container with limits + health check ---
echo "=== Starting db container (postgres) ==="
docker run -d \
    --name db \
    --memory="512m" \
    --cpus="1.0" \
    --health-cmd="pg_isready -U postgres || exit 1" \
    --health-interval=5s \
    --health-retries=5 \
    -v app-data:/var/lib/postgresql/data \
    -e POSTGRES_PASSWORD=secret \
    postgres:16-alpine

# --- Step 4: Verify health ---
echo ""
echo "=== Checking health status ==="
sleep 3
for c in web db; do
    status=$(docker inspect --format='{{.State.Health.Status}}' "$c" 2>/dev/null || echo "no health")
    echo "  $c health: $status"
done

# --- Step 5: Verify resource limits ---
echo ""
echo "=== Resource limits applied ==="
docker stats --no-stream --format "table {{.Name}}\t{{.MemUsage}}\t{{.CPUPerc}}" web db

# --- Step 6: Volume cleanup (dangling) ---
echo ""
echo "=== Pruning unused volumes ==="
docker volume prune --force

echo ""
echo "=== Containers running with limits + health checks ==="
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
