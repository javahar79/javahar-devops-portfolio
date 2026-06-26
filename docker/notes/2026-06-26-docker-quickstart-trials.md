# Docker Quickstart — what tripped me up

> Following the official Docker getting-started guide. Here's what worked and where things broke.

## Steps I followed

I started with `docker run docker/whalesay cowsay hi` like the quickstart shows. That worked fine — it pulled the image and printed a whale. Then the tutorial had me create a Dockerfile for a simple Node.js app. I created the file and ran:

```bash
docker build -t my-node-app .
```

That failed at first because I had a typo in the Dockerfile — I wrote `NODE_ENV` as `NODE_ENV` but then a later line referenced `NODE_ENV` wrong. Docker's build output showed the exact line, which helped track it down.

The next step was running the container with port mapping:

```bash
docker run -p 80:80 my-node-app
```

Port 80 on my machine was already in use, so I had to switch to `-p 8080:80`. That worked. I saw the Node app responding on localhost:8080.

## Got stuck on

- **Volume mounts** — the `-v` syntax tripped me up. The pattern is `host-path:container-path` but I put them in the wrong order the first time. Docker creates a directory if the host path doesn't exist, so I ended up with an empty folder on the host and nothing mounted inside the container.

- **docker buildx** — I tried `docker buildx build -t my-app .` and the image didn't show up in `docker images`. I didn't realize `buildx` outputs to a cache by default unless you pass `--load`. The build succeeds but the image isn't available locally.

- **Container names** — I ran `docker run --name myapp my-node-app` and then forgot to remove it before re-running. Got a conflict error. Had to `docker rm myapp` first.

- **Detached mode** — The quickstart shows `-d` in some examples but not others. I ran without `-d` the first time and my terminal was stuck attached to the container logs. Ctrl+C stopped the container, which surprised me — I expected it to keep running in the background.

## What I'd try next

I want to try Docker Compose for multi-service apps so I can define the ports and volumes in a file instead of typing long `docker run` commands. I also want to experiment with multi-stage builds to see how much smaller I can make the final images.
