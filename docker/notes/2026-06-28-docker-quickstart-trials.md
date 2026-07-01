# Docker Quickstart — what tripped me up

I followed the official Docker getting-started guide (the "Get Started" tutorial on docs.docker.com) to go through the basics again. Here's what I ran into.

## Step 1: Running a container

The guide starts with `docker run docker/welcome-to-docker`. Simple enough. But the first time I tried it I got a permission error — forgot I hadn't added my user to the `docker` group yet. Ran `sudo usermod -aG docker $USER` and logged out/in.

The guide then shows `docker run -d -p 80:80 docker/getting-started`. On my machine port 80 is already taken by something, so I used `-p 8080:80` instead. That worked. The port mapping order (host:container) still trips me up sometimes.

## Step 2: Writing a Dockerfile

The guide's example Dockerfile for a Node.js app:

```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
CMD ["node", "src/index.js"]
```

I got confused about why they copy `package.json` separately before the rest of the source. Then I read about layer caching — Docker caches each layer, and since `package.json` changes less often than source code, this speeds up rebuilds. Makes sense, but it's not obvious on first read.

## Step 3: Building

`docker build -t my-app .` — no issues here. Tagging with a version (`-t my-app:v1`) is something I keep forgetting to do. The guide mostly uses latest but the docs sidebar mentions tagging for releases.

## Step 4: Using Compose

The Compose section introduced `docker compose up` but the guide's `compose.yaml` references a `Dockerfile` that wasn't clearly in the same directory as their example. I had to place it manually. The `docker compose up --build` flag was useful for forcing a rebuild when the Dockerfile changed.

## Got stuck on

- **Volume mounts in Compose**: The guide uses a bind mount for live reload but I kept getting permission errors in the container. Had to add `user: "1000:1000"` to the Compose service to match my host user ID.
- **Port already allocated**: If a previous container is still running on the same port, `docker run` fails silently-ish (just exits with an error). `docker ps` and `docker rm -f` fix this.
- **Image size**: After building the Node.js image it was 180MB. The guide mentions slim variants in a note but it's easy to miss. Using `node:18-alpine` dropped it to ~50MB.

## What I'd try next

I want to understand multi-stage builds better — the guide only touches on them briefly. Also I'd like to try Docker init and the new Bake feature for building images. Next time I'll focus on Docker Hub push and CI integration.
