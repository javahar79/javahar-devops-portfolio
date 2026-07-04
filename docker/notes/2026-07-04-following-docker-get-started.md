---
last_verified: 2026-07-04
tool_version: n/a
---

# Following the official Docker get-started guide -- what tripped me up

I worked through the official Docker getting-started tutorial again, this time focusing on the multi-container and networking modules I'd only skimmed before. Earlier passes got me comfortable with `docker run`, `build`, and basic port mapping, but the later modules were still fuzzy.

## Steps that worked

**Module 1 -- Orientation and setup.** Straightforward. `docker run docker/getting-started -d -p 80:80` pulled the tutorial image and started the learning app. Old hat by now.

**Module 2 -- Containerizing an app.** The tutorial walks through writing a Dockerfile for a Node.js app. I followed along with a Python script instead since I'm more comfortable with Python. The key insight that finally stuck: copying `requirements.txt` before the rest of the source means Docker caches the `pip install` layer -- only re-runs it when dependencies change. That alone saves minutes on rebuilds.

**Module 3 -- Sharing the app on Docker Hub.** `docker tag` then `docker push` to my Docker Hub namespace. First time I actually did the push end to end. The image was public by default, which is fine for learning.

**Module 5 -- Multi-container apps.** This is where the tutorial leveled up. Breaking the app into a container plus a database container with Compose felt like real workflow. Writing a `docker-compose.yml` that wires the two together made the architecture visible in one file.

## Where I got stuck

**Module 4 -- Persisting data with volumes.** The tutorial explains named volumes vs bind mounts, but I tripped on the syntax. `docker volume create` to make a named volume, then reference it in `docker run -v my-volume:/data`. But the tutorial also uses `--mount type=bind,source=/path,target=/app` which is more verbose. I kept mixing which flag takes a named volume vs a bind mount. The rule I settled on: `-v` for simple cases, `--mount` when I need extra options like `readonly`.

**Module 6 -- Networking.** Creating a custom bridge network with `docker network create my-network` and then referencing containers by name was the aha moment. But the tutorial glosses over how DNS resolution works inside Docker's network -- containers on the same user-defined network resolve each other by container name automatically. I had to figure that out by trial and error.

**Volumes with Compose.** The top-level `volumes:` block declares named volumes, then services reference them. I accidentally declared a bind mount as a named volume and got a confusing error about "invalid mount config for type 'volume'".

## What I'd try next

I want to understand Docker health checks in a Compose file -- having the app wait for the database to be ready before starting. Also, I want to try multi-stage builds with a compiled language like Go to see how small I can get the final image.
