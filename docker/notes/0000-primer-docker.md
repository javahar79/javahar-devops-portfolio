# Docker — quick primer

> First-day notes for someone who's never used Docker. Personal voice, plain language.

## What is it?

Docker is a tool for running applications in isolated environments called containers. Think of it like a lightweight virtual machine — but instead of virtualizing a whole OS, Docker shares your computer's existing operating system kernel and just isolates the app and its dependencies. A container starts in seconds, not minutes.

## What does it do?

Docker lets you package an application with everything it needs — code, system libraries, config files, environment variables — into a single blob called an image. You run that image as a container, and it behaves the same way no matter where you run it: your laptop, a coworker's machine, a test server, or a cloud VM.

## Why does it exist?

The classic problem before Docker was "it works on my machine." You'd set up your app locally, all tests pass, then deploy to a server and it blows up because a library version is different or a config path doesn't exist. Docker eliminates that by bundling the entire runtime environment with the app. Operations teams love it because they don't need to manually install dependencies — they just run the image.

## Key terminology

- **Image** — A read-only template with instructions for creating a container. Think of it like a class in OOP. Example: `docker pull python:3.11` downloads a Python image you can spawn containers from.
- **Container** — A runnable instance of an image. Example: `docker run python:3.11 python --version` starts a container that prints the Python version and exits.
- **Dockerfile** — A text file with step-by-step instructions to build an image. Example: `FROM python:3.11` then `COPY app.py /app/` then `CMD ["python", "/app/app.py"]`.
- **Registry** — A server that stores and distributes images. Docker Hub is the default public registry. Example: `docker push myuser/myapp:latest` uploads an image.
- **Volume** — Persistent storage that survives container restarts and removals. Example: `docker run -v mydata:/data app` mounts a volume at `/data` inside the container.
- **Port mapping** — Maps a port on your host machine to a port inside the container. Example: `docker run -p 8080:80 nginx` makes Nginx accessible at http://localhost:8080.

## A tiny example

```bash
docker run hello-world
```

This downloads a tiny 13 KB test image and runs it. The container prints a welcome message and exits. It's the Docker equivalent of printing "Hello, World."

## What I'll cover next

Now that I have a feel for what Docker is, I want to install it properly on my machine, run my own containers with custom images, and get comfortable with the CLI commands I'll use every day.
