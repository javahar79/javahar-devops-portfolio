---
last_verified: 2026-07-16
tool_version: "n/a"
sources:
  - https://www.jeeviacademy.com/beginner-mistakes-in-docker-and-how-to-avoid-them/
  - https://tech-insider.org/docker-tutorial-beginners-containerization-2026
  - https://medium.com/@andy.a.g/docker-gotchas-that-cost-me-hours-a-developers-field-guide-f86cfb8fa061
  - https://kodekloud.com/blog/docker-tutorial-for-beginners-in-2026-first-steps
---

# Docker quickstart — what tripped me up

I followed the official "Get started" guide on docs.docker.com again, trying to go end-to-end without shortcuts. A few things caught me off guard.

## Steps

1. Ran `docker run docker/getting-started` — worked, opened the tutorial in my browser.
2. Cloned the todo-app repo, built the image from the provided Dockerfile.
3. Started the container, added a few todos, removed the container — todos gone. The guide warned me but I still expected them to survive.
4. Added a named volume, re-ran, this time data persisted.
5. Used `docker compose` to spin up the app + MySQL.
6. Tried a bind mount for live code reload.

## Got stuck on

- **`docker-compose` vs `docker compose`.** The tutorial screenshots show the old hyphenated command but the modern CLI uses `docker compose` (space). `docker-compose --version` returned nothing on my machine. I wasted time assuming Compose wasn't installed.

- **Bind mounts break when UIDs don't match.** I mounted my project directory into the container and the Python process crashed with "permission denied." The container's user didn't match my host UID. The research mentions this as a common pitfall — the fix is to match UIDs or use an entrypoint script. I worked around it by using a named volume for data and only bind-mounting source code.

- **Layer caching — I did it wrong.** My first Dockerfile copied everything (`COPY . .`) before installing dependencies, so every code change triggered a full `pip install`. After reading about layer ordering, I split it: copy `requirements.txt` first, install, then copy the rest. Build times dropped from ~25s to ~5s for tiny edits.

- **`docker system prune` doesn't touch volumes.** I ran `docker system prune -a` to reclaim space, but my disk was still full. `docker volume prune` (or `docker system prune --volumes`) was needed separately. The tech-insider article confirmed this is a common source of confusion.

- **Alpine + glibc surprise.** I tried switching to `python:3.12-alpine` to shrink the image, but my app uses `cryptography` which needs glibc. It crashed with a cryptic error. The research calls this out — Python or Go binaries built against glibc can fail on musl-based Alpine. I switched to `python:3.12-slim` instead.

- **`depends_on` with health checks.** I set up `depends_on: condition: service_healthy` for MySQL, but the app container started before MySQL was actually ready because my healthcheck was wrong. The compose file didn't error — the app just kept crashing with connection refused and restarting. It looked like a Compose bug until I fixed the healthcheck script.

## What I'd try next

I want to run `docker scout cves` on one of my images before pushing to a registry — the tech-insider article says it generates SBOMs automatically now and enterprise compliance is starting to require them. I also want to practice multi-stage builds with a Go binary to get a truly minimal runtime image.
