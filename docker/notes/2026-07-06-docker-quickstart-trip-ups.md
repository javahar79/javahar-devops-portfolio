---
last_verified: 2026-07-06
tool_version: 27.x
sources:
  - https://tech-insider.org/ie/docker-tutorial-2026/
  - https://www.byteverse.fyi/blog/docker-for-beginners-2026-guide
---

# Docker quickstart — what tripped me up

I followed the official Docker getting-started guide today. On the surface it's clean, but a few things bit me that the guide glosses over.

## `latest` tag bit me on the first build

The quickstart says `FROM python:3.11-slim`. I tried `FROM python:latest` first since that felt like "the default." Big mistake — `latest` pulled Python 3.13 within hours of the guide being written and some dependency installs broke. Pinning to `python:3.11-slim` fixed it. I'll use explicit tags from now on.

## Forgot a `.dockerignore` — context ballooned

My first `docker build` took ~40 seconds. Turned out `node_modules/` and `.git/` were getting copied into the build context because I had no `.dockerignore`. Adding one dropped the build to under 5 seconds. The guide mentions it in a note box but it's easy to skip when you're in flow.

## Container runs as root by default

I ran the container, started a Node dev server, and only later noticed the process inside was root. The quickstart doesn't mention this. I added a `USER app` instruction after creating a non-root user — the official docs explain the pattern but the quickstart itself doesn't show it.

## `docker compose` vs the old hyphenated version

I instinctively typed `docker-compose up` and got "command not found." The hyphenated v1 binary is retired in 2026; the two-word `docker compose` is the only way now. The quickstart uses the two-word form but doesn't warn about the old habit.

## Layer cache ordering caught me

I had `COPY . .` before `COPY package.json .` — every source edit invalidated the node_modules cache. Reordered to copy `package.json` first, run `npm install`, then copy the rest. Builds are now 10× faster for small changes.

## What I'd try next

I want to try the multi-stage build pattern from the docs and then wire up a compose file with a database service. The guide covers basics well but the footguns only show up when you actually type the commands.
