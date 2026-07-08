---
last_verified: 2026-07-07
tool_version: "4.25"
sources:
  - https://tech-insider.org/ie/docker-tutorial-2026/
---

# Docker quickstart — what tripped me up this time

Went through the official Docker getting-started tutorial again. Thought I had the basics down from previous runs but a couple of things still caught me off guard.

## Steps I followed

1. Ran the getting-started container from `docker/getting-started` — went fine.
2. Built and ran the sample todo app with the provided Dockerfile.
3. Added a volume to persist todo data after I lost it on container delete.
4. Tried the multi-container section with `docker compose`.

## Got stuck on

- **`docker compose` vs `docker-compose` again.** I keep forgetting the hyphenated v1 binary is gone. The tutorial examples still use `docker-compose` in some screenshots but my system only has the v2 plugin. `docker compose up` worked once I stopped trying the old form.
- **`.dockerignore` — I keep skipping it.** The guide doesn't mention it and my build context pulled in `node_modules` from a host project. Build was slow and the image had junk files. Added `.dockerignore` with `node_modules` and `.git` and the build dropped from 45s to 8s. Noted prominently for next time.
- **Layer ordering matters more than I thought.** I had `COPY . .` before installing deps again. Every code change re-ran `npm install`. Swapped the order — `COPY package*.json ./` first, then `RUN npm ci`, then `COPY . .`. Way faster rebuilds.
- **Permission denied on bind mount.** The tutorial uses a bind mount for live reload in dev mode. I mounted a host directory and the container couldn't write to it — SELinux context issue on my system. Used `:Z` flag on the mount and it worked. Something I'd want to understand better.

## What I'd try next

I want to experiment with a multi-stage build that strips out build tools completely — keep the runtime image as small as possible. Also want to try `docker scout` for vulnerability scanning on the built image to get a feel for image hygiene.
