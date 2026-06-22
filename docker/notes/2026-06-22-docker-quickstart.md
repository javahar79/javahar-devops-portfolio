# Docker quickstart — what tripped me up

Followed the [official Docker quickstart](https://docs.docker.com/get-started/) to get my first container running. The tutorial takes you through building a simple image, running a container, and publishing a port. Here's what worked and what didn't.

## Steps I followed

1. Installed Docker Desktop (already had it from a previous attempt, but `docker --version` confirmed it was working).
2. Ran `docker run hello-world` — the classic smoke test. Worked first try.
3. Created a Dockerfile for a simple Node.js app (the tutorial's example). Used `docker build -t test-app .` to build it.
4. Ran `docker run -d -p 8080:8080 test-app` to start it in detached mode with port mapping.

## Where I got stuck

**Port conflicts.** The tutorial picks port 80 for the example, but I already had something running on 80. Took me a few tries to realize I should just pick a different host port. Changed to `-p 8080:80` and it worked.

**Detached mode confusion.** Ran it without `-d` the first time, and the terminal just hung with logs scrolling. Ctrl+C killed the container. The tutorial mentions `-d` in a note but the main code block doesn't use it. Easy to miss.

**Container naming.** I forgot `--name` on my first run, so I got a random name like `happy_boyd`. Harder to reference later. `docker ps` showed me the name, but I had to look it up.

## What I learned

- `docker build -t <name> .` builds and tags in one step
- `-d` is your friend for long-running containers
- Always `--name` your containers or you'll regret it
- Port mapping is `host:container` — this keeps tripping me up

## What I'd try next

Next I want to try mounting a volume so I can edit files without rebuilding the image. Also curious about multi-stage builds for keeping images small.
