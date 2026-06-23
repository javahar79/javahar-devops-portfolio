# Following the Docker quickstart — second pass

I'd already run through the Docker getting-started guide before, but I wanted to follow it again more carefully and catch the details I glossed over the first time. This time I used the multi-service compose example instead of just the single-container tutorial.

## Steps I followed

1. **Ran `docker run -d -p 80:80 docker/getting-started`** to spin up the tutorial app. The `-d` flag this time — I remembered from last time not to forget detached mode.
2. **Opened http://localhost:80** in the browser. The tutorial page loaded with step-by-step instructions.
3. **Built the sample app** from the provided Dockerfile:
   ```bash
   docker build -t getting-started-app .
   ```
4. **Added a volume mount** to make live-reload work:
   ```bash
   docker run -d -p 3000:3000 -v "$(pwd):/app" getting-started-app
   ```
   This time I understood why the volume path needed to be absolute — Docker resolves host paths relative to... something that isn't the current directory in all contexts.
5. **Tagged and pushed to Docker Hub** to see the full workflow:
   ```bash
   docker tag getting-started-app myuser/getting-started-app:0.1
   docker push myuser/getting-started-app:0.1
   ```
6. **Tried the multi-container todo app** with the provided `docker-compose.yml`. Ran `docker compose up -d` and got MySQL + the app running behind an nginx reverse proxy.

## Where I got stuck

**Volume mounts and permissions.** The tutorial app runs as a non-root user inside the container, but the bind-mounted directory on my host was owned by my user. The container process couldn't write to it. I had to tweak permissions on the host directory — `chmod 777` felt wrong but worked. The tutorial mentions this in a warning box I'd skipped.

**Compose networking.** When I ran `docker compose up -d`, both services started but the app couldn't reach MySQL at first. I'd forgotten that Compose creates a default network and services resolve by service name — I was trying to use `localhost:3306` instead of `mysql:3306` in the connection string.

**`docker push` authentication.** I'd never pushed to Docker Hub before. Got a `denied: requested access to the resource is denied` error. Had to run `docker login` first. The CLI prompt is straightforward but the error message isn't helpful.

## What I learned

- Volume mounts are great for development workflow — edit a file locally, see it reflected in the container instantly
- Docker Compose handles networking for you — just reference service names
- Tagging uses `:` as a separator between image name and version tag — `image:tag`
- Always `docker login` before pushing, even to public repos

## What I'd try next

I want to try building a custom multi-stage Dockerfile that keeps the final image small — removing build dependencies after the artifact is copied. Also want to experiment with Docker networks directly instead of relying on Compose defaults.
