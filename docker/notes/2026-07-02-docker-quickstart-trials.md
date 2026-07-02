# Docker Quickstart — what tripped me up (round 5)

I went through the official Docker get-started guide again — the multi-service tutorial this time, not just the basic "run a container" part. The guide has you build a voting app with multiple services (Python, Redis, Postgres, Node, .NET). Here's what I hit.

## Step 1: Cloning and building the example app

The guide points to `docker/getting-started-app` on GitHub. I cloned it, ran `docker compose up`, and it pulled all the images — but then immediately crashed because port `5000` was already in use from a previous experiment. The guide doesn't mention checking for port conflicts. I used `docker compose down` to clean up, changed the host port in `compose.yaml` from `5000:5000` to `5001:5000`, and it started fine.

## Step 2: Multi-service networking

The voting app has a frontend, a backend, a message queue (Redis), and a database (Postgres). Docker Compose creates a default network and all services can reach each other by service name. I didn't realize that's automatic — I thought I'd need to define `networks:` manually. The guide briefly mentions it but doesn't explain the magic; I figured it out by running `docker network ls` and inspecting the network Compose created.

## Step 3: Volume mounts with services

The guide's `compose.yaml` for the voting app binds `./app` to `/app` in the Python container for hot reload. On my first `docker compose up`, the Python container kept restarting with a `permissions denied` error on the mounted volume. Adding `user: "${UID:-1000}"` to the service in Compose fixed it. The guide doesn't mention this — they assume you're running as `root` or have different host UID mapping.

## Step 4: Viewing the result

After everything was running, hitting `http://localhost:5001` showed the voting app. But the `.NET` voting-result service was on port `5002` by default and I'd forgotten to check — spent a minute wondering why one page worked and the other didn't. The guide tells you to look for the result page on a different port, but in small print.

## Got stuck on

- **Dangling containers after Ctrl+C**: When I stopped Compose with Ctrl+C, some containers stayed alive. `docker compose down --volumes --remove-orphans` is my go-to now.
- **Image tagging across services**: Each service in Compose gets an auto-generated image tag. When I wanted to push specific images, I had to tag manually. The guide doesn't do image publishing.
- **Logs are noisy with multiple services**: `docker compose logs` shows everything interleaved. `docker compose logs <service>` is much cleaner for debugging one service.

## What I'd try next

I want to understand Docker's BuildKit better — the guide uses it by default now but I don't know what it's doing differently. Also interested in health checks in Compose and how to orchestrate startup order when one service depends on another's readiness, not just its container running.
