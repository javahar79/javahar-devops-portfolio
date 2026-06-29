# Docker quickstart — what tripped me up

I went through the official Docker getting-started guide at docs.docker.com/get-started for real this time, building the sample Node.js todo app from scratch. Here's what happened and where I got stuck.

## What I did

1. Pulled the getting-started tutorial image: `docker pull docker/getting-started`
2. Ran it on port 80: `docker run -d -p 80:80 docker/getting-started`
3. Created a directory with a Dockerfile, package.json, and a simple Node.js app
4. Built the image: `docker build -t mytodo .`
5. Ran the container: `docker run -d -p 3000:3000 mytodo`
6. Tagged and pushed to Docker Hub: `docker tag mytodo myname/mytodo:latest` then `docker push`

## Where I got stuck

**Port 80 was already in use.** I forgot I had an nginx container from last week still running. `docker ps` showed the getting-started container running, but when I opened `http://localhost` in the browser, nothing loaded. I ran `docker stop $(docker ps -q)` to kill everything, then re-ran on port 8080. That's when I realized I should check what's listening first with `ss -tlnp | grep 80`.

**docker build failed because of a typo in my Dockerfile.** I wrote `RUN npm intall` instead of `RUN npm install`. The build error said "npm ERR! missing script: intall" — took me a second to spot the typo. The build cache had already pulled the base image layers so the retry was fast, but I definitely felt dumb.

**Tagging tripped me up.** I built with `docker build -t mytodo .` and then tried to `docker push mytodo` directly. Docker Hub said "access denied" because the tag didn't include my Docker ID prefix. I needed `docker tag mytodo myname/mytodo:latest` first, then push with that tag. The guide mentions this but I skimmed past it.

**COPY order killed my cache.** The guide's example Dockerfile had this order:

```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
CMD ["node", "src/index.js"]
```

I put `COPY . .` before `RUN npm install` on my first try. Every code change reinstalled all dependencies. Took me a few rebuilds to realize why it was slow. Once I fixed the order, rebuilds were nearly instant.

**Non-root user.** The guide doesn't mention switching from root. The VS Code Docker extension flagged it with a warning badge. I added `USER node` before the CMD line. Should I also chown the working directory? The node image already has a `node` user, so `USER node` was enough here.

## What I'd try next

I want to try a multi-stage build for the todo app — the node_modules are huge in the final image. I also want to experiment with build args and versioned tags instead of just `latest`, and maybe write a docker-compose.yml so I don't have to remember the long `docker run` flags every time.
