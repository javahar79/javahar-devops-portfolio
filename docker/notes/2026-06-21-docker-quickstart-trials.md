# Docker quickstart — what tripped me up

I followed the official Docker quickstart to get a container running. Here's
what actually happened vs. what I expected.

## Following the quickstart

I started with `docker run hello-world`. That worked fine — pulled the image,
ran it, printed the "Hello from Docker!" message. Good sign.

Next I tried `docker run -it ubuntu bash`. That pulled ubuntu:latest and
dropped me into a shell. I was surprised it worked with no `--rm` — the
container stuck around after I exited. Had to `docker ps -a` to find it and
`docker rm` it.

## Got stuck on

1. **Container name collisions.** I ran `docker run ubuntu echo hi` twice and
   the second one failed because I'd used `--name ubuntu` on the first. Didn't
   realize container names have to be globally unique until Docker told me.
2. **Port mapping syntax.** The `-p 8080:80` syntax felt backwards at first.
   Host:container makes sense now but I kept writing it as `-p 80:8080`.
3. **Detached vs. foreground.** I started an nginx container with `-d` and
   couldn't figure out why `docker logs` showed nothing for a few seconds.
   The container was just still starting up — I was too impatient.

## What I'd try next

I want to chain a few commands together — build an image from a Dockerfile,
run it with port mapping, exec into it to poke around, then clean up
everything. The quickstart covers each piece in isolation but I'd like to
see the whole loop end to end.
