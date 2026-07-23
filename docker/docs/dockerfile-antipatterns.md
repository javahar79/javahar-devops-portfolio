---
last_verified: 2026-07-23
tool_version: "n/a"
sources:
  - https://tech-insider.org/ie/docker-tutorial-2026/
  - https://docs.docker.com/build/building/best-practices/
  - https://www.makeuseof.com/beginner-docker-mistakes-made-took-homelab-offline-how-fixed/
  - https://dev.to/devopsaitoolkit/7-dockerfile-mistakes-that-are-quietly-costing-you-5a5n
---

# Dockerfile antipatterns I ran into

## Purpose

A few Dockerfile patterns that look fine on first read but cause real problems once a project grows. Each one here is something I either wrote wrong myself or had to debug in a teammate's PR.

## Layer-cache ordering

If `COPY . .` runs before `RUN pip install`, every source change invalidates the dependency cache and forces a full reinstall. A better order is to copy the dependency manifest first, install, then copy the rest:

```dockerfile
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
```

The docs suggest treating layer order as a dependency graph — install what changes least first.

## Trusting the `:latest` tag

`FROM python:latest` pulls whatever the `latest` tag points to today, which might be a new major version tomorrow. That broke a build when Python 3.13 released and `latest` moved off 3.12. Pinning to `python:3.12-slim` gives a known base and predictable rebuilds.

## Running as root

Containers running as root are a container-escape risk if an attacker gets a foothold. Adding a non-root user early in the Dockerfile is straightforward:

```dockerfile
RUN addgroup --system --gid 1001 appuser && \
    adduser --system --uid 1001 --ingroup appuser --no-create-home appuser
USER appuser
```

## Skipping `.dockerignore`

Without a `.dockerignore`, the build context includes `node_modules`, `.git`, and local secrets. The build sends all of that to the daemon, slowing every build. A minimal `.dockerignore`:

```
node_modules
.git
*.md
.env
```

## No HEALTHCHECK

Docker only knows the container process is running, not that the app serves traffic. Without a `HEALTHCHECK`, a stalled app keeps the container alive but unreachable. Something like this catches that:

```dockerfile
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:5000/health || exit 1
```

## No resource limits

A container with no memory or CPU limit can starve the host. Throttling or OOM kills can take down other critical services. Using `--memory` and `--cpus` at run time (or `deploy.resources` in Compose) avoids this, but the Dockerfile can't enforce limits — it's a runtime concern that's easy to forget.

## Unbounded log growth

By default there's no log cap. A chatty app can fill gigabytes on the host. This one isn't a Dockerfile fix either — it needs a `--log-opt max-size=10m --log-opt max-file=3` on the run command or daemon config.

## Verify

The quickest check is to build the image and look at the layer history:

```bash
docker history <image>
```

Each `COPY` before a `RUN` that installs dependencies is a red flag for a missed cache opportunity.
