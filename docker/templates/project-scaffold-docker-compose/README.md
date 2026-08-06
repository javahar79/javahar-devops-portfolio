---
last_verified: 2026-08-06
tool_version: n/a
sources:
  - https://www.derricklin.net/devops-exercises/topics/cicd
  - https://www.clouddevopshub.com/blog/15-ci-cd-concepts-every-devops-engineer-must-master-in-2026-complete-guide
---

# Project scaffold: Docker + Compose for multi-service production

## Purpose

A production-grade Docker Compose scaffold for a multi-service application with a web tier, database, cache, and reverse proxy. The scaffold demonstrates resource limits, health checks, non-root container execution, and persistent volumes.

## When to use

Use this scaffold when starting a new project that requires containerized services with Docker Compose. It is suitable for local development, staging, and as a starting point for production deployments on a Docker Swarm or Kubernetes cluster.

## Prerequisites

- Docker Engine 24+ and Docker Compose v2
- At least 4 GB of available RAM for running all services
- A `.env` file with `POSTGRES_PASSWORD` and `REDIS_PASSWORD` values for secret injection

## Steps

1. Copy the scaffold directory into the project root: `cp -r docker/templates/project-scaffold-docker-compose/* .`
2. Create a `.env` file with database and cache credentials.
3. Build and start the stack: `docker compose up --build -d`
4. Verify all services are healthy: `docker compose ps`
5. Access the application at `http://localhost` and the database at `localhost:5432`.

## Verify

1. Confirm all four services are running: `docker compose ps` should show `web`, `db`, `cache`, and `nginx` with status `running`.
2. Check the web service health endpoint: `curl -f http://localhost/health`.
3. Inspect resource usage: `docker compose stats` should show memory and CPU within the defined limits.
4. Test database connectivity from the web container: `docker compose exec web sh -c "wget -qO- http://db:5432"`.

## Common errors

- **Port conflict on 80 or 5432**: Another service is already bound to the port. Stop the conflicting service or change the port mapping in `docker-compose.yml`.
- **Missing `.env` file**: The database and cache services fail to start without credentials. Create a `.env` file before running `docker compose up`.
- **Build fails with `npm ci` error**: The `package.json` or `package-lock.json` is missing from the build context. Ensure both files exist in the project root.

## References

- [CI/CD exercises — derricklin.net](https://www.derricklin.net/devops-exercises/topics/cicd)
- [15 CI/CD concepts every DevOps engineer must master — CloudDevOpsHub](https://www.clouddevopshub.com/blog/15-ci-cd-concepts-every-devops-engineer-must-master-in-2026-complete-guide)