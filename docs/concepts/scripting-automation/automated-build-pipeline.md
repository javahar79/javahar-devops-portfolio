---
last_verified: 2026-08-08
tool_version: n/a
---

# Combining Scripting & Automation with Container Fundamentals

## Purpose

Container images package an application and its dependencies into a single
artifact, while scripting and automation provide the glue that builds, tests,
and deploys those artifacts. This doc outlines one way to wire a shell script
into a containerized build pipeline so that every code change produces a
reproducible image without manual intervention. This is one approach; teams
should adapt the boundaries to their own language ecosystem and registry.

## When to use

This pattern fits small-to-medium services where a single CI job can build the
image, run unit tests inside the container, push the image to a registry, and
update a deployment manifest. It also helps when the build steps are not easily
expressed in the CI system's built-in actions, or when the same build logic
needs to run locally and in CI.

## Prerequisites

- A Dockerfile that builds the application from source.
- A container registry accessible from the CI environment.
- A shell script that orchestrates the build, test, and push steps.

## Steps

1. **Write the build script.** A shell script can invoke `docker build`, run
   unit tests inside the resulting image with `docker run`, and push the image
   to a registry. Keeping the logic in a script makes it versioned alongside
   the application code and runnable locally.
2. **Make the script idempotent.** Use `docker build` with a stable tag
   (for example a Git SHA) so that re-running the script does not create
   duplicate layers or fail because an image already exists.
3. **Add the script to the CI pipeline.** The CI configuration calls the
   script on every push to main. Because the script exits non-zero on any
   failed step, the CI job fails immediately and reports the exact command
   that broke.

## Verify

After wiring the script into CI, confirm the pipeline end-to-end:

1. Push a commit to main and watch the CI job run the script from start to
   finish.
2. Verify the image appears in the registry with the expected tag.
3. Deploy the image to a test environment and confirm the application starts
   and passes its smoke tests.
