# Following the official Docker quickstart — what tripped me up

I went through the Docker getting-started guide at docs.docker.com/get-started/ again, this time paying closer attention to the parts I'd skimmed before. Here's what worked and what didn't.

## Steps that went smoothly

1. **`docker run docker/getting-started`** — the guide's recommended starting container. It launches a local web app at http://localhost with the tutorial. Ran it with `-d -p 8080:80` since 80 was already in use.
2. **Building the sample image** — the guide walks through a Node.js app Dockerfile. `docker build -t my-app .` built with no issues. The layer caching explanation in the sidebar finally clicked — separate `COPY package.json` before `COPY .` to cache npm install.
3. **Tagging** — `docker tag my-app my-app:v1` worked as expected. I also tried `docker image tag` (same command, different syntax) and confirmed they do the same thing.
4. **Running interactively** — `docker run -it alpine sh` and exploring the filesystem. It's still wild seeing a totally separate OS tree from a single command.

## Where I got stuck

**The getting-started guide assumes Docker Desktop.** I'm running Docker Engine on Linux, so the tutorial's "open the Docker Dashboard" sections were useless. The guide has a "Linux" tab toggle for some pages, but not all. I had to fall back to `docker images`, `docker ps`, `docker logs` for everything the Dashboard would show.

**Docker Compose v2 vs v1 syntax.** The guide uses `docker compose` (v2 plugin) but my muscle memory still types `docker-compose` (v1 standalone). They work the same for basic cases, but `docker compose` has its own help system (`docker compose --help` vs `docker-compose --help`). I kept mixing them up.

**Bind mounts with absolute paths.** The guide's Compose file uses `./app:/app` which Docker resolves relative to the compose file's directory. That worked — but earlier I'd tried `docker run -v ./data:/data` from a different directory and got confused about where `./data` actually lives on the host.

**multi-stage build wasn't explained in the main path.** The guide has a "Multi-stage builds" section buried in the sidebar. I only found it because I was looking for ways to shrink the image. The Node.js example produced a 180 MB image; switching to `node:18-alpine` dropped it to ~50 MB, and a multi-stage build could get it even smaller.

**`docker system df` is useful.** I ran it after building a few images and saw how much space dangling layers were taking. `docker image prune` cleaned up the `<none>` images without the nuclear option of `docker system prune`.

## What I'd try next

I want to understand Docker networking — containers talking to each other by container name on a custom bridge network. Also, I keep meaning to try `docker init` which generates a Dockerfile and Compose file for your project, and Docker Bake for multi-architecture builds.
