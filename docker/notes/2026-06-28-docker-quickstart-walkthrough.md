# Docker quickstart — following the official guide

I went through the official Docker getting-started tutorial at docs.docker.com/get-started/ again, this time taking it slow and making sure I understood each step before moving on. The previous times I rushed and missed details.

## Setting up

I already had Docker Desktop running. `docker version` showed 24.0.x. The guide recommends running the tutorial image first:

```
docker run -d -p 80:80 docker/getting-started
```

I added the `-d` flag right away because without it the container locks your terminal. First time I ran this I forgot `-p` and couldn't see anything. This time I used both flags from the start and the tutorial page loaded at `http://localhost`.

## Building the sample app

The sample is a Node.js todo app. The Dockerfile:

```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
CMD ["node", "src/index.js"]
```

I built it with `docker build -t todo-app .`. The build cached `npm install` because I hadn't changed `package.json` — only the source files after `COPY . .` triggered a fresh layer.

## The port conflict trap

Running the built image: `docker run -dp 3000:3000 todo-app`. Got:

```
docker: Error response from daemon: driver failed programming external connectivity on endpoint ...
```

The getting-started container from step one was still holding port 80. Docker gave no hint about which container was the culprit. I had to run `docker ps`, find the old container, and `docker rm -f` it. Then the new container started fine on 3000.

## Volumes — the gotcha I missed before

The guide adds a MySQL container for persistence. The volume mount:

```
docker run -d --network todo-app --network-alias mysql -v todo-mysql-data:/var/lib/mysql ...
```

I'd always read `-v` as "verbose" from other CLI tools. Took me a while to internalize it as "volume" in Docker. The named volume `todo-mysql-data` persists across container restarts. Without it, MySQL loses all data when the container stops.

## Bind mounts for live reload

Bind mounts let you edit code without rebuilding. The guide uses it to serve the Node app with `nodemon`:

```
docker run -dp 3000:3000 -w /app -v "$(pwd):/app" node:18-alpine sh -c "yarn install && yarn run dev"
```

The `-w /app` flag sets the working directory. I forgot it my first attempt and got "module not found" errors because Node was looking for `node_modules` at `/` instead of `/app`.

## Multi-stage builds

The guide doesn't cover multi-stage builds in detail but I tried one anyway after reading the "Use multi-stage builds" best practice page. A Go app:

```dockerfile
FROM golang:1.22 AS build
WORKDIR /src
COPY main.go .
RUN go build -o /app

FROM alpine:3.19
COPY --from=build /app /app
CMD ["/app"]
```

The final image dropped from 300MB to 12MB. That convinced me multi-stage is worth doing every time.

## What I'd try next

I want to experiment with layer caching strategies — specifically reordering COPY instructions to keep infrequently-changing dependencies in earlier layers. I also want to try Docker Scout for finding vulnerabilities in base images.
