---
last_verified: 2026-07-04
tool_version: "4.25"
sources:
  - https://tech-insider.org/docker-tutorial-beginners-containerization-2026
  - https://ones.com/blog/10-common-mistakes-when-starting-docker-projects-and-how-to-avoid-them
---

# Docker quickstart — what tripped me up

Followed the official Docker getting-started guide again. Ran into a few things that weren't obvious from the tutorial text.

## Steps I followed

1. Pulled `docker/getting-started` image and ran it — that part was smooth.
2. Built the todo-app image from the provided Dockerfile.
3. Ran the container, added a few todos, then removed the container — poof, todos gone. The guide mentions this but I didn't really *feel* it until I saw my data disappear.
4. Added a named volume (`todo-data`) and re-ran. Data persisted this time.
5. Tried the multi-container section with MySQL + app.

## Got stuck on

- **Volume persistence click didn't land.** I knew volumes exist but the tutorial walks you through losing data first on purpose. That actually worked well as a teaching moment.
- **Bind mounts vs named volumes.** The guide uses bind mounts for dev (hot-reload) but I mixed them up and used a bind mount where a named volume was needed for the database. Container wouldn't start — MySQL complained about permissions. Fixed by switching to a named volume.
- **Docker Compose v2 syntax.** The guide's `docker-compose` CLI didn't work on my system — had to use `docker compose` (no hyphen). Spent a few minutes wondering why the command wasn't found.
- **Layer caching caught me.** I had `COPY .` before `COPY package.json` in my practice Dockerfile, so every code change re-ran `npm install`. The guide's Dockerfile didn't order layers optimally, and I followed it blindly. Moved `package.json` copy before the source copy and builds got way faster.

## What I'd try next

I want to practice multi-stage builds with a small Go app — keep the build stage fat and the runtime slim. Also want to try `docker init` to see what scaffolding it generates; the research mentioned it's available since Docker 4.25.
