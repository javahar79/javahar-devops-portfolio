# last_verified: 2026-08-08 · Docker 29.7.2
# Best-practice reference: https://www.bioquro.com/2026/05/docker-best-practices-for-production.html

# Two-stage Go HTTP service: compiler + module cache in the builder,
# statically-linked binary in a distroless non-root runtime. Zero build
# tooling is copied to the final image (Docker 29.7.2 / BuildKit v0.32.2).

# ── build stage ────────────────────────────────────────────────────
# golang:1.26-alpine matches the Go 1.26.5 runtime shipped with Docker 29.7.2.
FROM golang:1.26-alpine AS builder

WORKDIR /src

# Layer ordering — least-changed to most-changed:
#   base image → module download → source copy → compile.
# go.mod is copied and downloaded before main.go so that source edits
# do not invalidate the module layer. BuildKit cache mount on
# /go/pkg/mod keeps downloaded modules warm across rebuilds.
COPY go.mod ./

RUN --mount=type=cache,target=/go/pkg/mod \
    go mod download

COPY main.go ./

# CGO_ENABLED=0 produces a statically-linked binary (no glibc dependency).
# -ldflags="-s -w" strips the symbol table and DWARF debug info to shrink
# the binary. Cache mount on /root/.cache/go-build keeps compiled packages
# warm across rebuilds.
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    CGO_ENABLED=0 go build -ldflags="-s -w" -o /app/bin/server

# ── runtime stage ──────────────────────────────────────────────────
# distroless/static-debian12:nonroot ships only the binary and the
# nonroot user (uid 65532). No shell, no package manager, no attack
# surface — the distroless guarantee of zero extra attack surface.
FROM gcr.io/distroless/static-debian12:nonroot

COPY --from=builder /app/bin/server /server

# Exec-form probe calls the binary's healthcheck subcommand, which performs
# an HTTP GET to /healthz. start-period gives the process time to bind the
# port before the first probe. No || exit 1 — exec-form already propagates
# the non-zero exit code correctly.
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD ["/server", "healthcheck"]

# Exec-form CMD routes SIGTERM/SIGINT directly to the Go process. Shell form
# ("CMD server") wraps in /bin/sh -c, which breaks graceful shutdown in
# Kubernetes and other orchestrators that rely on signal propagation.
EXPOSE 8080
CMD ["/server"]
