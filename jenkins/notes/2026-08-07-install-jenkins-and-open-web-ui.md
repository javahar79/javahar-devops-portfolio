---
last_verified: 2026-08-07
tool_version: n/a
---

# Install Jenkins and open the web UI for the first time

I installed Jenkins on Ubuntu for the first time today. I added the official Jenkins repository, installed the package, and let it pull in Java as a dependency.

After install, I started the service with `sudo systemctl start jenkins` and enabled it. Then I pointed my browser at `http://localhost:8080`.

Jenkins asked for the initial admin password on first visit. I grabbed it from `/var/lib/jenkins/secrets/initialAdminPassword`, pasted it in, and accepted the suggested plugins. After the plugin install finished, I created my first admin user and landed on the dashboard.

## What I noticed

The UI feels old-school. Table layouts, sidebar menus, dense information. It works, but it's not going to win any design awards.

## What I'd try next

I want to create a Freestyle job, add a shell build step, and run it to see the console output.
