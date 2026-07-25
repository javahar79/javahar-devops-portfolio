#!/usr/bin/env bash
# last_verified: 2026-07-25 · docker compose

# Automate the container lifecycle: build, test, and cleanup
# a multi-service stack with Docker Compose.
#
# Prerequisites: docker compose v2+, a docker-compose.yml in the
# current directory with a "web" service exposing port 8000.

set -euo pipefail

MAX_WAIT="${MAX_WAIT:-30}"
URL="http://localhost:8000/health"

echo "=== Building images ==="
docker compose build

echo "=== Starting stack in detached mode ==="
docker compose up -d

echo "=== Waiting for web service ==="
for i in $(seq 1 "$MAX_WAIT"); do
  if curl -sf "$URL" >/dev/null 2>&1; then
    echo "web is healthy after ${i}s"
    break
  fi
  if [ "$i" -eq "$MAX_WAIT" ]; then
    echo "web did not become healthy within ${MAX_WAIT}s"
    docker compose logs --tail=50 web
    exit 1
  fi
  sleep 1
done

echo "=== Smoke test ==="
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL" || true)
if [ "$STATUS" -eq 200 ]; then
  echo "Smoke test passed (HTTP $STATUS)"
else
  echo "Smoke test failed (HTTP $STATUS)"
fi

echo "=== Tearing down ==="
docker compose down -v

echo "=== Removing dangling images ==="
docker image prune -f
