---
last_verified: 2026-08-23
tool_version: n/a
---

# Followed the official Jenkins quickstart and wrote up what tripped me up

I worked through the official Jenkins quickstart this morning. The docs walk you through installing Jenkins, unlocking it, installing plugins, and creating your first pipeline. Most of it worked, but a couple of things surprised me.

## What I did

I started by installing Jenkins on a fresh Ubuntu VM. The docs told me to run `sudo apt install jenkins` and then start the service with `sudo systemctl start jenkins`. That part was straightforward. Java was pulled in as a dependency, which I appreciated.

Next, I opened the Jenkins UI on port 8080 in my browser. Jenkins showed the unlock screen and told me to grab the initial admin password from `/var/lib/jenkins/secrets/initialAdminPassword`. I ran `sudo cat` on that file, pasted the password, and clicked Continue.

The plugin installation screen came up next. I selected "Install suggested plugins" and waited. Some plugins took longer than others, and one timed out. The UI didn't make it obvious that I could retry just the failed ones — I thought I had to start over. After a refresh, the remaining plugins finished installing.

Then I created the first admin user. The form asked for a username, password, full name, and email address. I filled those in, clicked "Save and Finish", and Jenkins dropped me into the dashboard.

## What tripped me up

The first surprise was the initial admin password location. I expected it in a more obvious place, like the console output or a setup wizard prompt. Finding it in a file under `/var/lib/jenkins/` felt like I was already supposed to know Jenkins internals.

The second issue was the plugin timeout. One plugin failed to download, and the UI just showed a generic "failed" label without explaining why. I tried refreshing the page and Jenkins picked up where it left off, but that wasn't documented anywhere I could see.

The third thing was the pipeline syntax. The docs showed a declarative pipeline example, but when I pasted it into the Pipeline configuration screen, Jenkins complained about an indentation error. I had to switch to the "Pipeline Syntax" helper to generate the correct script step, which was a nice tool but not mentioned in the quickstart.

## What I'd try next

I want to create a real Jenkinsfile in a Git repo and configure a multibranch pipeline. I also want to explore the "Blue Ocean" UI to see if it makes pipeline visualization less painful.
