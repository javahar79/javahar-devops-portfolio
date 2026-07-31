#!/usr/bin/env bash
# last_verified: 2026-07-31 · Docker 20.10

set -euo pipefail

# Build the multi-stage Dockerfile with a BuildKit secrets mount.
# Secrets never appear in any image layer or in `docker history`.
#
# Usage:
#   echo "my-api-key" > /tmp/api_key.txt
#   DOCKER_BUILDKIT=1 docker build \
#     --ssh default \
#     --secret id=api_key,src=/tmp/api_key.txt \
#     -f docker/dockerfiles/multi-stage-buildkit-distroless.Dockerfile \
#     -t myapp:buildkit \
#     .

IMAGE_TAG="${1:-myapp:buildkit}"
DOCKERFILE="docker/dockerfiles/multi-stage-buildkit-distroless.Dockerfile"
CONTEXT="docker/dockerfiles"

if [ ! -f "$DOCKERFILE" ]; then
  echo "error: $DOCKERFILE not found" >&2
  exit 1
fi

export DOCKER_BUILDKIT=1

docker build \
  --secret id=api_key,src=/tmp/api_key.txt \
  -t "$IMAGE_TAG" \
  -f "$DOCKERFILE" \
  "$CONTEXT"

echo "built $IMAGE_TAG — verify with: docker history $IMAGE_TAG"
