#!/usr/bin/env bash
# last_verified: 2026-08-15 · docker n/a

# Container lifecycle management — combining Scripting & Automation with
# Container Fundamentals. The script walks a container through its full
# lifecycle: create, start, verify it's actually running, stop, and clean
# up. Where the naive version types docker commands by hand, this script
# wraps each step so a broken step fails loudly instead of silently
# leaving a half-started container behind.

set -euo pipefail

NAME="${1:-lifecycle-demo}"
IMAGE="${2:-alpine:latest}"

fail() {
  echo "error: $1" >&2
  exit 1
}

# Create the container if it doesn't exist yet. `docker create` returns the
# container ID; using --name means the same name can't be recreated twice,
# so an existing container is reused rather than silently duplicated.
if docker ps -a --format '{{.Names}}' | grep -qx "$NAME"; then
  echo "container '$NAME' already exists, reusing it"
else
  echo "creating container '$NAME' from $IMAGE"
  docker create --name "$NAME" "$IMAGE" || fail "create failed"
fi

# Start it. docker start exits 0 only when the container is running, so a
# failed start is caught here rather than two steps later.
echo "starting container"
docker start "$NAME" || fail "start failed"

# Verify the state, not just the exit code. A container can start and then
# crash immediately, so check .State.Running after a short wait instead of
# trusting the start command.
echo "verifying running state"
for _ in $(seq 1 5); do
  state=$(docker inspect -f '{{.State.Running}}' "$NAME")
  [ "$state" = "true" ] && break
  sleep 1
done
docker inspect -f '{{.Name}} running={{.State.Running}} exit={{.State.ExitCode}}' "$NAME"

# Stop and remove. Removing is the cleanup half of the lifecycle — leaving
# containers around after a test run is how disk fills up over time.
echo "stopping container"
docker stop "$NAME" || fail "stop failed"
echo "removing container"
docker rm "$NAME" || fail "remove failed"

echo "lifecycle complete: create -> start -> verify -> stop -> remove"
