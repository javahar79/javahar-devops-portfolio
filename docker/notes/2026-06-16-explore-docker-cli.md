# Docker CLI — what's there

I installed Docker and ran `docker --help` to see what commands I'd be using. Here's what I learned.

## Commands I'll use most

- `docker run` — start a container from an image
- `docker ps` — list running containers (`-a` shows stopped ones too)
- `docker images` — list images I've pulled
- `docker pull` — download an image without running it
- `docker rm` — remove a stopped container
- `docker rmi` — remove an image
- `docker system prune` — clean up unused containers, images, and cache

## What I tried

Ran `docker run -it ubuntu bash` to get an interactive shell inside a container. It dropped me into a terminal as root. Ran `ls`, checked `cat /etc/os-release`, then `exit` to leave.

After that I ran `docker ps -a` and saw the exited container listed. Cleaned it up with `docker rm <container-id>`.

Tried `docker run --rm -it ubuntu bash` — the `--rm` flag auto-deletes the container after I exit. Neat.

## What surprised me

Containers start in under a second. `docker --help` is well organized into management commands and subcommands. I didn't expect `docker system prune` to free up so much space so quickly.

## Next

Learn how to build my own image with a Dockerfile instead of always pulling from Docker Hub.
