# Docker quickstart — what tripped me up

Followed the official Docker quickstart at docs.docker.com/get-started. Here's what worked and what didn't.

## What I did

1. Created a `Dockerfile` in an empty directory with `FROM python:3.12-slim`, `WORKDIR /app`, `COPY . .`, `CMD ["python", "app.py"]`.
2. Wrote a tiny `app.py` that prints "hello from Docker".
3. Ran `docker build -t hello-docker .` — it built successfully.
4. Ran `docker run hello-docker` — saw "hello from Docker" printed.

Then the tutorial had me push to Docker Hub. Created an account, ran `docker login`, got a credential helper prompt I wasn't expecting. Typed my password directly in the terminal — felt wrong. Found out later you're supposed to use a PAT (personal access token), not your account password. The quickstart doesn't mention this until later.

## Got stuck on

- **`docker build` failed with "Cannot connect to the Docker daemon"** — I'd forgotten to start Docker Desktop. On Linux it's `sudo systemctl start docker`. Took me a minute to realize because the install script ran fine but the daemon wasn't running.
- **`docker tag` syntax** — I kept mixing up the order. `docker tag source target` not the other way around. Tagged my image as `docker tag hello-docker myuser/hello-docker:v1` before pushing.
- **Container exited immediately** — the first Python app printed and stopped. I was confused because I expected it to hang like a server. The tutorial explained that containers stop when their main process exits. Makes sense.

## What I'd try next

The tutorial moves to Docker Compose next — I'd like to try running both a web app and a database with one command. Also need to understand volumes so my data persists between container restarts.

## Commands I ran

```bash
docker build -t hello-docker .
docker tag hello-docker myuser/hello-docker:v1
docker push myuser/hello-docker:v1
docker run --rm hello-docker
docker ps -a
docker logs <container-id>
```
