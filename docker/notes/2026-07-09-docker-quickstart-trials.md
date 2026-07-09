---
last_verified: 2026-07-09
tool_version: n/a
sources:
  - https://www.jeeviacademy.com/beginner-mistakes-in-docker-and-how-to-avoid-them
  - https://tech-insider.org/docker-tutorial-beginners-containerization-2026
---

# Docker quickstart — what tripped me up

I followed the official Docker getting-started tutorial again, focused on avoiding the `latest` tag and keeping images minimal.

## Steps I followed

1. Read through the beginner mistakes the research flagged — biggest takeaway was treating images and containers as the same thing.
2. Wrote a minimal `Dockerfile` with a pinned `python:3.12-alpine3.20` tag and a non-root user.
3. Built it with an explicit version tag (`hello-python:0.1.0`) instead of `latest`.
4. Ran it with `-p 8082:8000`, tested the port mapping with `curl`, then cleaned up.

## Got stuck on

- **Port already in use.** My first try used 8080, but something was already listening. After checking with `lsof -i :8080`, I switched to 8082. Should check for free ports before running.
- **Alpine's `addgroup` flags differ from Debian's.** `python:3.12-alpine3.20` uses BusyBox's `adduser`, which takes `-S` (system) instead of `--system`. I accidentally used the Debian flags at first and got errors. Quick read of `addgroup --help` fixed it.
- **`http.server` serves an empty directory.** Since I didn't copy any files into `/app`, the container ran but `curl` returned an empty directory listing. That's correct behavior, but if I expected a specific page I'd need to add content.

## What I'd try next

I want to try mounting a host directory as a volume so the HTTP server serves real files, and experiment with Docker Scout to inspect the image's SBOM.

<!-- L2 — first-person scratch notes, following quickstart -->
