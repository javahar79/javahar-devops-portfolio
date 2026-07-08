---
last_verified: 2026-07-08
tool_version: "4.25"
sources:
  - https://www.byteverse.fyi/blog/docker-for-beginners-2026-guide
  - https://tech-insider.org/ie/docker-tutorial-2026/
---

# Docker quickstart — what tripped me up this time

I went through the official Docker getting-started guide again, but paid more attention to the gotchas the research mentioned. A few things caught me.

## Steps I followed

1. Ran through the `docker init` scaffolding to see what it generates — neat, but it's opinionated about project structure.
2. Built a small Python web app with a tagged multi-stage Dockerfile (no `latest` anywhere).
3. Added a non-root user in the runtime stage and ran the container as that user.
4. Tried to reach a database container from the app using `localhost` — failed. Used the Compose service name instead and it worked.
5. Ran into a port conflict on 5000 (macOS AirPlay). Mapped a different host port.

## Got stuck on

- **localhost inside a container doesn't mean localhost on my machine.** I knew this in theory but when the Python app couldn't reach Postgres at `localhost:5432`, it took me a minute to remember: inside the container, `localhost` is the container's own network namespace. The database was in a separate container. Fix was easy once I swapped to the service name (`db:5432`).
- **Port 5000 was taken.** macOS uses port 5000 for AirPlay Receiver. Docker errored with "port is already allocated". I mapped `-p 5001:8000` instead and moved on.
- **No `.dockerignore`.** I didn't create one at first and my build context included a `.git` directory and some large assets. The build was slow and the image was bloated. Adding a minimal `.dockerignore` with `node_modules`, `.git`, and `*.md` fixed it.
- **`latest` tag is a trap.** The tutorial examples use `python:3.11-slim` which is explicit, but some blog posts I cross-referenced used `python:latest`. After reading the research about `latest` being a moving target, I stuck with pinned tags throughout.

## What I'd try next

I want to try passing secrets at runtime instead of baking them into the image — the research flagged `ENV MY_SECRET=...` in Dockerfiles as a bad practice. Also want to practice with Docker Scout for image analysis since it ships with Docker Desktop now.

<!-- L2 — first-person scratch notes, under 800 words -->
