# Following the official Docker quickstart

I went through the Docker getting-started guide at docs.docker.com/get-started/. Here's what worked and what tripped me up.

## Steps I followed

1. **Ran `docker run hello-world`** to verify Docker was installed. It worked — same as the primer example. The welcome message explains how Docker works step by step.
2. **Built a simple image** from a Dockerfile. I created a `Dockerfile` with `FROM alpine:latest` and `CMD ["echo", "hello"]`. Ran `docker build -t hello-alpine .` and it built in seconds.
3. **Tagged and ran the image**: `docker run hello-alpine` printed "hello". Then I tagged it with a version: `docker tag hello-alpine hello-alpine:0.1`.
4. **Ran a container interactively**: `docker run -it alpine sh` dropped me into a shell inside the container. Ran `ls`, `cat /etc/os-release` — felt like SSH-ing into a tiny machine.
5. **Exposed a port**: Ran `docker run -d -p 8080:80 nginx:alpine` and opened http://localhost:8080. The Nginx welcome page appeared.
6. **Used volumes**: `docker run -v mydata:/data alpine touch /data/test.txt` — the file persisted after the container exited. Verified with `docker run -v mydata:/data alpine ls /data`.
7. **Cleaned up**: `docker stop`, `docker rm`, and `docker rmi` to remove containers and images.

## Where I got stuck

**Tag syntax confused me at first.** I ran `docker tag hello-alpine:latest` without the second argument and got an error. The syntax is `docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]` — you need both. I eventually figured it out by reading `docker tag --help`.

**Port already in use.** I already had something running on 8080 from a previous test. `docker: Error response from daemon: driver failed programming external connectivity on endpoint`. Had to run `docker ps` to find the old container, stop it, then retry.

**Volume paths are weird.** I tried `docker run -v ./data:/data alpine` expecting a relative path to work. It did — but Docker resolves relative host paths to... somewhere. I switched to absolute paths to be safe.

**`docker system prune` is aggressive.** I ran it to free space and it deleted all stopped containers, unused networks, and dangling images. Lost a container I was still referencing in notes.

## What I'd try next

I want to understand Docker networking better — how containers talk to each other by name. Also want to try docker-compose with multiple services so I don't have to run five separate `docker run` commands for a stack.
