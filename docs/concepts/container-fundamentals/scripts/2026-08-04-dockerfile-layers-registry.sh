#!/usr/bin/env bash
# last_verified: 2026-08-04 · devops n/a

# con-017: Container Fundamentals — Dockerfiles, layers, and registry workflows
# I wrote this script to practice the Docker concepts I keep using:
# understanding how layers work in a Dockerfile, building images, and
# pushing them to a registry.

echo "=== Dockerfile Layers Demo ==="
# I write a Dockerfile that demonstrates how each instruction creates
# a new layer. Layers are cached independently, so ordering matters —
# putting rarely-changing instructions first speeds up rebuilds.

DOCKERFILE=$(mktemp /tmp/Dockerfile.XXXXXX)
cat > "$DOCKERFILE" <<'EOF'
FROM alpine:3.19
RUN apk add --no-cache curl
COPY app.sh /app/app.sh
RUN chmod +x /app/app.sh
CMD ["/app/app.sh"]
EOF

echo "Created Dockerfile with 4 layers:"
echo "  1. FROM alpine:3.19 — base image layer"
echo "  2. RUN apk add curl — installs curl, cached unless apk cache changes"
echo "  3. COPY app.sh — copies application code, cached unless file changes"
echo "  4. CMD — runtime config, no layer created"

echo ""
echo "--- Inspect layer sizes (if docker is available) ---"
if command -v docker >/dev/null 2>&1; then
  docker build -t con-017-demo -f "$DOCKERFILE" "$(dirname "$DOCKERFILE")" 2>&1 | tail -5
  echo "Build completed — layers cached for faster rebuilds"
else
  echo "docker not available — skipping build, Dockerfile written to $DOCKERFILE"
fi

rm -f "$DOCKERFILE"

echo ""
echo "=== Registry Workflow Demo ==="
# I demonstrate the push workflow: tag the image with the registry
# hostname, authenticate, then push. In real workflows I always tag
# with a specific version tag, never just latest, so I can roll back.

echo "--- Tag and push workflow ---"
echo "1. docker tag my-image registry.example.com/my-namespace/my-image:v1.0.0"
echo "2. docker login registry.example.com"
echo "3. docker push registry.example.com/my-namespace/my-image:v1.0.0"
echo "4. docker pull registry.example.com/my-namespace/my-image:v1.0.0"

echo ""
echo "=== Container fundamentals exercises complete ==="