# last_verified: 2026-07-31 · Docker 20.10

# Purpose: multi-stage Dockerfile for a Go HTTP service that
# demonstrates BuildKit cache mounts, a distroless runtime stage,
# a non-root user, and a HEALTHCHECK.
# This is one pattern; the docs also suggest skipping the distroless
# stage in favour of alpine or scratch if CGO dependencies allow it.

# ---- build stage ----
FROM golang:1.24-alpine AS builder

# BuildKit cache mount keeps the module download layer warm
# across rebuilds so only changed source files recompile.
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    go mod download

WORKDIR /src
COPY main.go go.mod ./

RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    CGO_ENABLED=0 go build -ldflags="-s -w" -o /app/bin/server

# ---- runtime stage ----
FROM gcr.io/distroless/static-debian12:nonroot

COPY --from=builder /app/bin/server /server

# The nonroot user (uid 65532) is baked into the distroless base.
# Verify with: docker run --rm <image> id
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
    CMD ["/server", "healthcheck"] || exit 1

EXPOSE 8080
ENTRYPOINT ["/server"]
