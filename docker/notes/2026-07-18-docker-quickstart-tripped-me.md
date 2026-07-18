---
last_verified: 2026-07-18
tool_version: n/a
sources:
  - https://medium.com/@nomannayeem/the-one-docker-tutorial-every-beginner-developer-actually-needs-f94a5774da27
  - https://dev.to/_d7eb1c1703182e3ce1782/docker-complete-guide-for-beginners-containerize-your-app-in-2026-57j9
  - https://tech-insider.org/docker-tutorial-beginners-containerization-2026
---

# Docker quickstart — what tripped me up

I followed the official Docker "Get Started" guide to go from zero to a running container with a volume and a Compose stack. Most steps worked, but a few assumptions I made from other tools didn't carry over.

## Steps

1. Installed Docker Engine from the official apt repo.
2. Ran `docker run hello-world` — pulled the image, printed the confirmation message, exited cleanly.
3. Cloned the tutorial's sample app, built the image from the provided Dockerfile, and ran it with `-p 80:80`.
4. Added a named volume so my todo list would survive container restarts.
5. Spun up the app plus a database with `docker compose up`.
6. Tried a bind mount for live code reload during development.

## Got stuck on

- **Code changes didn't show up.** I edited a Python file inside the bind-mounted directory and refreshed the browser — same output. The research flags this explicitly: the Dockerfile → Image → Container chain means code changes require a fresh `docker build -t myapp:latest .` then `docker run`. I rebuilt and the change appeared immediately.

- **`localhost` was wrong inside the app container.** From Compose, my web app tried to reach the database at `localhost:5432` and got connection refused. The research explains that `localhost` inside a container refers to the container itself, not the host or sibling containers. I switched to the service name (`db`) and it connected.

- **Container exited and I didn't know why.** After one rebuild the container stopped instantly. `docker ps -a` showed `Exited (1)` but gave no detail. `docker logs <container-id>` revealed a missing environment variable the app needed on startup. The research calls out this pattern — CMD/ENTRYPOINT process crashes are almost always an app-level config issue, not a Docker issue.

- **Image was 2.1 GB with no `.dockerignore`.** My first build sent `.git`, `__pycache__`, and a local `venv/` into the build context. The research recommends Alpine-based images, multi-stage builds, and a thorough `.dockerignore`. I added a `.dockerignore` and switched to `python:3.12-slim`; the image dropped to ~180 MB.

- **`latest` tag bit me during a rollback.** I pulled `nginx:latest` for a sidecar, tested my change, then reverted my Compose file. The next day `latest` pointed at a newer minor version that broke my config. The research warns that `latest` follows whatever was most recently pushed. I pinned `nginx:1.27-alpine` and the rollback was clean.

- **Everything ran as root.** `docker exec` into the app container dropped me into a root shell. The research flags this as a container-escape risk. I added a non-root `USER` in my Dockerfile and confirmed the process UID inside the container changed.

## What I'd try next

I want to layer in a `.dockerignore` with patterns for Python and Node, pin every base image to a specific minor version, and add a healthcheck to my Compose `depends_on` so the app doesn't start before the database is actually ready.
