# Following the Docker quickstart — what tripped me up

I ran through the official Docker getting-started guide (docs.docker.com/get-started/) section by section. The guide walks through containerizing a sample app, layering images, using volumes, and wiring up multiple containers. Here's where I hit snags and what I learned.

## Part 1: Orientation and `docker run`

The first command was `docker run docker/getting-started` to pull the guide's tutorial image. It downloaded fast but I stared at the terminal for 30 seconds waiting for something else to happen — the image runs a web server on port 80. I had to read ahead to realize I needed `-p 80:80` to actually see anything. The guide mentions this but I skimmed past it thinking `docker run` would be interactive.

## Part 2: Our Application

Building the sample app (`docker build -t docker-101 .`) worked fine. The Dockerfile uses a Node base image and I had no issues there. But when I tried to run the container with `docker run -dp 3000:3000 docker-101`, I got:

```
docker: Error response from daemon: driver failed programming external connectivity on endpoint ...
```

Turns out I still had the getting-started container from Part 1 running on port 80. The error message doesn't say *which* container owns the conflicting port, just that there's a conflict. I had to run `docker ps` to find and `docker rm -f` the old container. After that, port 3000 worked.

## Part 3: Updating the App

The guide has you modify the app source and rebuild. I made my change, ran `docker build -t docker-101 .` again, then `docker run -dp 3000:3000 docker-101` — and hit the same port conflict because the old container was still running. This is the biggest newbie trap: you have to stop and remove the old container before the new one can grab the port. I learned `docker rm -f` is my friend.

Also: rebuilds don't cache well when you change the source early in the Dockerfile. The guide puts `COPY . .` after `RUN npm install` — that's intentional so dependency installs get cached unless package.json changes.

## Part 4: Persisting Data with Volumes

Created a volume with `docker volume create todo-db` and mounted it at `/etc/todos`. This part went smoothly. The trick I almost missed: the mount path must match what the app uses internally. The guide says `/etc/todos` but if I'd picked a different path the data wouldn't have persisted. The volume itself is opaque — you can't browse it easily to check what's inside. `docker volume inspect` shows the mount point on the host but on macOS (Docker Desktop) that path is inside the VM, not directly accessible.

## Part 5: Bind Mounts

Bind mounts let you edit source files on the host and have the changes reflected live in the container. The command was:

```
docker run -dp 3000:3000 -w /app -v "$(pwd):/app" node:18-alpine sh -c "yarn install && yarn run dev"
```

This worked but the `-w /app` sets the container's working directory, and without it the bind mount lands files in the wrong place. I initially omitted `-w` and got a "module not found" error because Node was looking for `node_modules` in `/` instead of `/app`.

## Part 6-7: Multi-Container Apps

The guide introduces Docker Compose for running the app alongside MySQL. Writing the `compose.yml` was straightforward but I forgot to mount the `init.sql` file for MySQL schema initialization. The MySQL container started, the app connected, but the table didn't exist — the error showed as a 500 in the browser with no useful detail. `docker logs todo-mysql` showed nothing helpful either. I had to re-read the MySQL image docs to learn it auto-executes `.sql` files from `/docker-entrypoint-initdb.d/`.

## What I'd try next

Next I want to try multi-stage builds with Python instead of Node to compare image sizes, and experiment with Docker Scout for vulnerability scanning. I also want to understand layer caching better — I think I'm rebuilding layers unnecessarily.
