---
last_verified: 2026-07-25
tool_version: "n/a"
sources:
  - https://dev.to/_d7eb1c1703182e3ce1782/docker-tutorial-for-beginners-2026-from-zero-to-running-containers-5gh2
  - https://ones.com/blog/10-common-mistakes-when-starting-docker-projects-and-how-to-avoid-them/
---

# Multi-stage vs distroless vs Alpine: comparing three Docker image optimization approaches

## Purpose

Compare three strategies for reducing Docker image size and attack surface: multi-stage builds, distroless images, and Alpine-based images. Each approach makes a different trade-off between simplicity, security, and compatibility.

## When to use

- Multi-stage builds: when the build needs a full SDK (Node, Go, Python) but the runtime only needs the compiled artifact.
- Distroless images: when the runtime needs only the binary and its immediate shared libraries, with no shell or package manager.
- Alpine-based images: when a small footprint is needed but the app still relies on glibc-linked binaries or needs a package manager for quick debugging.

## Prerequisites

- Docker Engine installed
- Basic familiarity with Dockerfile syntax
- A sample application to containerize (any language with a compiled artifact or script)

## Multi-stage builds

A multi-stage build uses two or more `FROM` instructions. The first stage (builder) contains the full SDK and compiles the artifact. The second stage (runtime) copies only the compiled output into a minimal base image.

```dockerfile
# builder stage
FROM python:slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# runtime stage
FROM python:slim
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY . .
CMD ["python", "app.py"]
```

The runtime image contains only what the app needs to run. The builder stage is discarded after the build, so build-time tools and intermediate layers do not appear in the final image.

## Distroless images

Distroless images strip the image down to the application and its runtime dependencies. There is no shell, no package manager, and no standard library utilities. The image contains only what the app requires to execute.

```dockerfile
FROM gcr.io/distroless/python3
WORKDIR /app
COPY --from=builder /app /app
CMD ["app.py"]
```

This approach reduces the attack surface significantly. An attacker who gains execution inside the container has no shell to drop into and no package manager to download tools. The trade-off is that debugging becomes harder because `docker exec` into a distroless container yields no shell.

## Alpine-based images

Alpine Linux uses musl libc and BusyBox, producing a small base image. It includes a package manager (`apk`) and a shell, which makes debugging and quick patches easier than distroless.

```dockerfile
FROM python:alpine
WORKDIR /app
COPY requirements.txt .
RUN apk add --no-cache build-base && \
    pip install --no-cache-dir -r requirements.txt && \
    apk del build-base
COPY . .
CMD ["python", "app.py"]
```

The catch is compatibility. Binaries compiled against glibc can fail on Alpine's musl libc. If the application or one of its dependencies expects glibc, Alpine can introduce subtle runtime errors.

## Choosing the right approach

| Approach | Typical image size | Shell available | Debuggability | Best for |
|----------|-------------------|-----------------|---------------|----------|
| Multi-stage | Moderate | Yes | Easy | Apps needing a build SDK |
| Distroless | Smallest | No | Hard | Production microservices |
| Alpine | Small | Yes | Easy | Simple services and CLIs |

One way to pick is to start with Alpine for development ease, then migrate to distroless once the app is stable. Multi-stage is a complementary technique: you can combine it with either distroless or Alpine to keep build tools out of the final image.

## Verify

Check the final image size with `docker images`. Compare the sizes of the same application built with each approach:

```bash
docker build -t app:multi -f Dockerfile.multi .
docker build -t app:distroless -f Dockerfile.distroless .
docker images app:multi app:distroless
```

Inspect the layer history to confirm no build-stage dependencies leaked into the runtime image:

```bash
docker history app:distroless
```

## References

- Docker tutorial covering multi-stage builds and Alpine patterns [source: https://dev.to/_d7eb1c1703182e3ce1782/docker-tutorial-for-beginners-2026-from-zero-to-running-containers-5gh2]
- Beginner mistakes guide covering layer caching and distroless-style optimization [source: https://ones.com/blog/10-common-mistakes-when-starting-docker-projects-and-how-to-avoid-them/]
