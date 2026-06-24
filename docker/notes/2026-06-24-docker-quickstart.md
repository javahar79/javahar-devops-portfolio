# Following the official Docker quickstart — what tripped me up

I went through the official Docker getting-started guide at docs.docker.com/get-started. I'd used Docker before but never followed their official tutorial end-to-end. Here's what happened.

## Steps I ran

1. **Pulled the getting-started image** to see the tutorial app locally:
   ```bash
   docker run -d -p 80:80 docker/getting-started
   ```
   The `-d` flag felt obvious now — I'd forgotten it my first time and the container ate my terminal.

2. **Built the sample app** from a Dockerfile in the tutorial repo. I cloned their example-node-app and ran:
   ```bash
   docker build -t todo-app .
   ```
   The build cached layers nicely on the second run — only the `COPY` layer rebuilt when I changed source files.

3. **Added a bind mount for live development**:
   ```bash
   docker run -dp 3000:3000 -v "$(pwd):/app" todo-app
   ```
   Worked but the container logs showed permission warnings because my host UID didn't match the container's node user.

4. **Tagged and pushed to Docker Hub**:
   ```bash
   docker tag todo-app myuser/todo-app:v1
   docker push myuser/todo-app:v1
   ```
   I got a `denied` error until I ran `docker login`.

5. **Used Docker Compose** to run the app with MySQL. The `docker-compose.yml` from the tutorial wired everything together — I just ran `docker compose up -d`.

## Where I got stuck

**Volume permissions.** The node image runs as a non-root user (UID 1000). My host UID was different, so the container couldn't write to the mounted directory. The tutorial mentions this in a note but I'd skimmed it. I ended up using a named volume instead of a bind mount for the persistent data — that worked without permission issues because Docker manages named volume ownership.

**Container networking.** The tutorial uses `docker network create` to set up a custom bridge network between the app and MySQL. I skipped that step and tried running both containers on the default bridge. They couldn't talk to each other. Went back, created a custom network with `docker network create todo-app`, and attached both containers with `--network todo-app`. Then the app resolved `mysql` as a hostname.

**Image size.** After building, `docker images` showed the node image at over 1 GB. The tutorial didn't mention multi-stage builds or slim images. I had to research alpine variants on my own.

## What I'd try next

I want to rewrite the todo app's Dockerfile as a multi-stage build using `node:alpine` as the runtime base to shrink the image. Also want to experiment with `docker init` which the CLI suggested as a way to auto-generate Dockerfiles — curious if it produces good defaults.
