---
last_verified: 2026-07-03
tool_version: "4.25"
sources:
  - https://tech-insider.org/docker-tutorial-beginners-containerization-2026
---

# Docker Quickstart — what tripped me up this time

I ran through the official Docker getting-started guide again on docs.docker.com. Even after a few passes, new things tripped me up this time.

## Step 1: Running a container

The guide says `docker run -d -p 80:80 docker/getting-started`. Port 80 was taken again, so I used `-p 8080:80`. Keeps catching me that the host port comes first.

I also tried `docker init` this time instead of writing everything from scratch. The guide doesn't mention it but it's available since Docker 4.25 and scaffolds a Dockerfile, `.dockerignore`, and `compose.yaml` based on your project runtime. Pretty handy — it generated a solid Node.js setup for me. The `.dockerignore` it created automatically excludes `node_modules` and `.git`, which I used to skip manually.

## Step 2: Writing a Dockerfile

I paid close attention to layer ordering this time. Putting `COPY .` before `COPY package.json` invalidates the npm install cache on every code change. I made sure to copy dependency files first, install, then copy the rest.

The example used `node:18-alpine`. Last time Alpine gave me trouble with a native npm package (segfault — musl libc vs glibc issue). This time I used `node:18-slim` instead for a project with native deps. The image was slightly larger (50MB vs 35MB) but no runtime crashes.

## Step 3: Tagging

I tagged my build properly this time: `docker build -t my-app:v1.0.0 .` instead of just `latest`. The research mentions that using `latest` makes builds non-reproducible, so I'm trying to pin versions from now on.

## Step 4: Multi-stage and non-root

The quickstart guide doesn't cover multi-stage builds well, so I tried adding one. Build stage compiles the binary, runtime stage is minimal and runs as a non-root user. I added `USER` directive and didn't run as root inside the container. The research mentioned rootless mode is recommended in 2026 docs, so I also checked `docker info --format '{{.Rootless}}'` to confirm my setup.

## Got stuck on

- **Bind mount `:ro`**: I mounted a config file read-only this time using `:ro` flag. Most tutorials omit this but it's a security best practice.
- **Volume cleanup**: `docker system prune` doesn't touch volumes. I had orphaned volumes from earlier database containers. Had to run `docker volume prune` separately to free space.
- **`compose.yaml` vs `docker-compose.yml`**: I used `docker compose` (v2, no hyphen) which is now the standard. Old tutorials still reference v1 which confused me for a minute.

## What I'd try next

I want to explore Docker Scout for SBOM generation — the research says it's auto-generated now for every image. Also need to practice pushing to a registry with signed tags.
