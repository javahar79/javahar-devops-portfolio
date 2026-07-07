---
last_verified: 2026-07-07
tool_version: "4.25"
sources:
  - https://tech-insider.org/docker-tutorial-beginners-containerization-2026
  - https://www.xda-developers.com/made-these-biggest-docker-mistakes
---

# Docker quickstart — what tripped me up

I went through the official Docker getting-started guide again, trying to actually follow it top to bottom instead of skimming. Here's what went wrong and what I learned.

## Steps I followed

1. Ran `docker run docker/getting-started` — the tutorial image with instructions. Worked first try.
2. Built the todo-app image from the Dockerfile in the tutorial repo.
3. Ran it, added some todos, deleted the container. Todos gone. The guide warns you, but losing data still stung.
4. Added a named volume and re-ran. This time the todos survived `docker rm`.
5. Set up the MySQL + app multi-container setup with `docker compose`.
6. Tried bind mounts for live reload during development.

## Got stuck on

- **`docker-compose` vs `docker compose`.** The tutorial shows `docker-compose` (with hyphen) but my Docker 4.25 needs `docker compose` (no hyphen). My system didn't even have the old binary. Spent a few minutes blaming the guide before I realised the CLI syntax changed.

- **Bind mounts and file permissions.** I bind-mounted a local directory into the MySQL container and the process refused to start — it couldn't write to the mounted host directory. The container's `mysql` user (uid 999) didn't match my host uid. I fixed it by using a named volume for the database data instead of a bind mount. The official guide uses bind mounts only for app code (hot reload), not for database persistence, and now I see why.

- **Layer ordering slowed builds.** I wrote `COPY . .` before installing dependencies, so every code change triggered a full `pip install`. The tutorial's example Dockerfile isn't optimised for layer caching. I rearranged: copy `requirements.txt` first, run `pip install`, then copy the rest. Builds dropped from 30s to under 5s for small changes.

- **Leaving containers running.** After the tutorial I had three or four stopped containers I forgot about. `docker ps -a` showed them all. `docker system prune -a` cleaned everything up but I didn't realise `--volumes` was needed separately until I checked disk usage — the volumes were still there. The research mentioned this as a common beginner mistake [source: xda-developers.com].

## What I'd try next

I want to practice multi-stage builds with a compiled language (Go would be good — static binary, tiny runtime image) and add a HEALTHCHECK to the Dockerfile. The research called out HEALTHCHECK as something beginners skip, and my todo-app container wouldn't have told me if the Python process froze while the container stayed "up".
