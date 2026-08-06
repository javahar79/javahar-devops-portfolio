---
last_verified: 2026-08-06
tool_version: n/a
sources:
  - https://majesticops.com/blog/devops-roadmap-for-beginners
---

# Install Jenkins and open the web UI for the first time

I just installed Jenkins on my machine for the first time. Here's what happened.

I followed the official Jenkins documentation to install it via the package manager on Linux. The install pulled in Java as a dependency since Jenkins runs on the JVM. I started the Jenkins service and then opened the web UI in my browser at `http://localhost:8080`.

The first time I visited the UI, Jenkins asked me to unlock it with an initial admin password. I found that password in a file on disk that Jenkins created during installation. After entering the password, I went through the setup wizard — it suggested installing a set of recommended plugins, which I accepted.

Once the plugins installed, Jenkins asked me to create the first admin user. I filled in a username and password, and then I was inside the Jenkins dashboard.

The dashboard showed a list of jobs (empty at first) and some system information. I could see the build queue, node status, and a sidebar with links to manage Jenkins, create new jobs, and view plugins.

## What I noticed

The UI is functional but feels a bit dated compared to modern web apps. The layout is table-based and the navigation is menu-driven. It works, but it's not sleek.

## What I'd try next

I want to create my first pipeline job and write a Jenkinsfile to see how the pipeline editor works in the UI.