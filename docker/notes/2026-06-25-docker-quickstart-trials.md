# Docker quickstart — what tripped me up

> Following the official Docker quickstart, here's what worked and where I got stuck.

## Starting point

I already had Docker installed (from the install script earlier), so I skipped straight to `docker run hello-world`. That worked without issues — the container pulled the image from Docker Hub and ran. Good sign.

## The `docker run` basics

Running `docker run -it ubuntu bash` pulled the ubuntu image and dropped me into a shell. That part was smooth. What tripped me up: exiting the container (just `exit`) stops it. I assumed it would keep running in the background like a service. Nope — you need `-d` for detached mode.

## Where I got stuck

### 1. Container names

I ran `docker run -d nginx` without naming it and got back a random hash. Then tried to refer to it in `docker logs` — typed the first few chars, Docker matched it. But `docker stop` complained about ambiguous reference when two containers started with the same prefix. Fix: always use `--name` or clean up old containers.

### 2. Port mapping syntax

The quickstart shows `-p 8080:80` but I tried `-p 8080:80/tcp` and it also worked. The `/tcp` is optional, default. What confused me: `-p 8080:80` means host:container, not the other way around. I kept thinking host came second because of how port forwarding docs usually read.

### 3. Volume mounts with $PWD

The tutorial uses `-v $PWD:/app` but on my first try I used a relative path without `$PWD` and Docker created a named volume instead of a bind mount. The difference matters when you want real-time file sync.

### 4. Dockerfile build context

My first Dockerfile failed because it tried to `COPY .. /app` — the parent directory was outside the build context. The error message says "Forbidden path outside the build context" but I didn't see it at first because it scrolled past. Always run `docker build` from the directory your Dockerfile references.

## What I'd try next

Next I want to run a multi-container setup with Compose and add health checks. The quickstart skips those but they're essential for real use.
