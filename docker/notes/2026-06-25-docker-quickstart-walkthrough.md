# Working through the Docker getting-started guide

I went through the official getting-started guide at docs.docker.com/get-started/ again — this time I followed every section from 01 through 07 in order. The guide containerizes a Node.js todo app and walks through images, containers, volumes, and multi-container setups.

## What I ran

**Part 1 — `docker init`.** This interactive command generates a Dockerfile and compose.yml by asking about your app's language and dependencies. I answered `node` and it produced a working Dockerfile with a multi-stage build. The output is decent but verbose — it adds comments for every line.

**Part 2 — Build and run.** `docker build -t getting-started .` then `docker run -dp 3000:3000 getting-started`. Opened localhost:3000 and the app loaded.

**Part 3 — Update the app.** Changed the placeholder text in the source, rebuilt, and ran a new container. Forgot to stop the old one first — got a port conflict. Had to `docker ps` to find the old container and `docker rm -f` it.

**Part 4 — Volumes for persistence.** `docker run -dp 3000:3000 -v todo-db:/etc/todos getting-started`. The todos survived container restarts this time. Without the volume, every new container started with a clean database.

**Part 5 — Bind mounts for live reload.** `docker run -dp 3000:3000 -w /app -v "$(pwd):/app" node:18-alpine sh -c "yarn install && yarn run dev"`. This mounts the working directory into the container so code changes reflect immediately without rebuilding.

**Part 6 — Multi-container with Compose.** Wrote a `compose.yml` file with the app service and a MySQL service. The guide uses a separate `init.sql` file to create the database schema on MySQL's first startup.

**Part 7 — `docker compose up -d`.** Everything started together. `docker compose logs -f` showed both services coming up.

## What tripped me up

**`docker init` chose wrong defaults.** It asked about the platform and when I said `javascript`, it tried to set up a JavaScript project with a different template. The correct answer was `node`. The generated Dockerfile also pinned Node 18 even though 22 is current — I had to edit it.

**Port conflicts aren't handled gracefully.** Docker just says "port is already allocated" with no hint about which container owns the port. I learned to always run `docker ps` before `docker run -p` to check for conflicts.

**The MySQL container took three tries to configure.** The guide's Part 6 has you create an `init.sql` file for the schema. I forgot to mount it into the container the first time, so MySQL started but the app couldn't find the `todos` table. The second time I mounted it wrong. Third try I checked the compose docs and used `./db/init.sql:/docker-entrypoint-initdb.d/init.sql` which MySQL auto-executes.

**Compose watch vs bind mounts.** Part 5 uses bind mounts. Part 6 mentions `docker compose watch` as an alternative. Compose watch only syncs changed files instead of the whole volume, which is faster for large projects. But it requires Docker Compose v2.23+.

## What I'd try next

I want to go deeper on Docker Scout for image vulnerability scanning and try multi-stage builds with compiled languages to shrink image sizes. Also curious about Docker Bake for multi-architecture builds — the guide only briefly mentions it.
