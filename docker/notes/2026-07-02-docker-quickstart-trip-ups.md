# Docker quickstart — what tripped me up

> Following the official Docker getting-started guide for the first time. What broke, why, and what I'd do differently.

I went through the [Docker getting-started guide](https://docs.docker.com/get-started/) and tried to follow along step by step. Here's where it went sideways.

## Docker Desktop vs CLI

The guide assumes you have Docker Desktop installed. I installed Docker Engine via `apt` on a headless VM, so the tutorial's "Open Docker Desktop" prompts were useless. I had to guess the CLI equivalents for dashboard actions — mostly `docker ps -a` to check running containers instead of looking at a UI.

## Port conflicts the guide doesn't warn about

When I ran the sample app container from step 2, I picked port `3000` to map. Turned out I had something already listening on `3000` from an old Node process. The container started fine but I spent 15 minutes wondering why `curl localhost:3000` returned nothing. `docker logs <container>` showed the app was listening on `3000` internally, but nothing was hitting it. Switched to `8080` and it worked immediately.

## The `docker init` command wasn't available

Step 3 mentions `docker init` to generate a Dockerfile and compose file automatically. I tried it — got `docker: 'init' is not a docker command.` Turns out `docker init` is only in Docker Desktop, not the standalone CLI engine. I had to write the Dockerfile by hand, which was fine, but the guide made it look like a one-command thing.

## Multi-stage builds — the syntax tripped me up

The multi-stage build example used `AS build` in the FROM line and then `COPY --from=build`. I mistyped it as `FROM golang:alpine AS builder` in the first stage and then tried `COPY --from=builder` in the second — which works, but I went back and forth checking if the stage name had to be the same across files. It doesn't, just matching within the same Dockerfile. Felt obvious after I got it right.

## Docker Hub login

`docker push` failed with "authentication required" because I hadn't logged in. The guide mentioned it but I'd skipped that paragraph. Ran `docker login` and it worked. Not really a trip-up, more of a "read the whole step next time" lesson.

## What I'd try next

I want to run through the compose part of the tutorial with a real multi-service setup (app + db) and see how networking works between containers without having to `--link` manually.
