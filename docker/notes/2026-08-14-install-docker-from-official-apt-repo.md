---
last_verified: 2026-08-14
tool_version: n/a
sources: []
---

# Installing Docker from the official apt repo

I installed Docker Engine on Ubuntu from the official apt repository — not the distro's `docker.io` package. The official repo gives you the engine packages directly and is what the docs point to.

## What I ran

First I fetched Docker's GPG key, saved it under `/etc/apt/keyrings`, and added the `deb` line for my release codename pointing at the official repo. Then a plain `apt update` and install:

```bash
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
```

Next I started the service and added my user to the `docker` group so I don't need sudo on every command:

```bash
sudo systemctl enable --now docker
sudo usermod -aG docker "$USER"
```

## The moment of truth

```bash
docker run hello-world
```

First run pulls the tiny image, the container prints the welcome message explaining how Docker works step by step, and it exits cleanly. It worked first try.

## What tripped me up

`docker run hello-world` failed with a permission error until I was in the `docker` group. The group doesn't apply until you log out and back in (or open a new shell) — I kept getting "permission denied" and thought the install was broken.

I'll dig into the basic CLI next: pulling, running, listing, and inspecting containers.
