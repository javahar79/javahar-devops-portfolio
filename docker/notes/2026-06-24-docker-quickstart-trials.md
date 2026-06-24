# Following the official Docker quickstart — what tripped me up

I went through the official getting-started guide at docs.docker.com/get-started/ for a third pass, this time paying close attention to the areas that gave me trouble before. I used the tutorial todo-list app this time instead of just running hello-world or nginx.

## What I did

1. **Cloned the tutorial repo** from `docker/getting-started-app` — the guide links to a GitHub template.
2. **Built the image** with `docker build -t todo-app .` — worked first try.
3. **Ran it** with port mapping: `docker run -d -p 3000:3000 todo-app`.
4. **Opened the browser** at localhost:3000 and the todo app loaded. Added a few items, checked them off.
5. **Added a volume** for persistence: `docker run -d -p 3000:3000 -v todo-data:/app/todos todo-app`. This time the todos survived container restarts.
6. **Used a bind mount** for live-reload during dev: `docker run -d -p 3000:3000 -v "$(pwd):/app" todo-app`.
7. **Tagged and pushed** to Docker Hub: `docker tag todo-app myuser/todo-app:v1` then `docker push myuser/todo-app:v1`.

## What tripped me up

**The tutorial app wouldn't start with MySQL via Compose at first.** The guide has a section about multi-container apps with a MySQL backend. I ran `docker compose up -d` and the app container crashed immediately. Turned out I needed to set the `MYSQL_HOST` environment variable — the app expects `mysql` as the hostname, not `localhost`. The guide mentions this in a box I'd skipped.

**Bind mount permissions again.** When I mounted my local directory into the container, the node process inside couldn't write to it because the mounted volume was owned by root on my host. I had to check `docker inspect` to see what user the container ran as. The image uses `node` user (UID 1000), so I `chown`-ed the project directory.

**`docker push` failed until I created the repo on Docker Hub first.** The error message just says "denied" — it doesn't tell you to create the repository in the Hub UI. Had to tab over to hub.docker.com, create `todo-app`, then retry.

**The tutorial skips explaining layer caching.** I rebuilt the image a few times and noticed the second build was almost instant. Docker caches each layer and invalidates only when the context or the Dockerfile instruction changes. I had to reorder my `COPY` statements to put `package.json` before the source code so `npm install` could be cached.

## What I'd try next

I want to experiment with Docker's native networking — creating custom bridge networks and connecting containers by name without Compose. Also want to try multi-stage builds with compiled languages like Go to see how small I can get the final image.

