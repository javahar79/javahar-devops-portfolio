---
last_verified: 2026-07-27
tool_version: n/a
sources: []
---

# Networking Basics — quick primer

> First-day notes on how computers talk to each other. The ideas behind every connection a DevOps tool ever makes.

## What is it?

Networking is the set of rules and hardware that lets separate computers send data back and forth. It happens at every layer — a process on your laptop talking to a database on a cloud server, a Git client pushing code to GitHub, a Kubernetes node fetching a container image from a registry. The same basics apply at every distance. The Internet itself is just a massive network of networks, and the Internet Protocol (IP) is the addressing scheme that makes it all routable.

I didn't appreciate how much networking showed up in my daily work until I started debugging why a health check was failing and got a TCP timeout. I had no idea what a timeout even meant or why a "refused connection" and a "timed out connection" were different errors. That confusion cost hours. A grounding in the basics of ports, protocols, and how a request travels from source to destination fixes that.

## Why does it matter for DevOps?

DevOps automation is all about connections: Git over HTTPS, SSH to remote hosts, HTTP to a deployment API, TCP to a database, DNS to resolve a hostname. Every pipeline step depends on the network being configured correctly. Firewalls, security groups, and service meshes are network controls. Load balancers and ingress controllers are network shapes. When a service can't reach another — or reach it slowly — the problem is in the network layer. Knowing the vocabulary lets you read logs that say "connection refused" and know immediately it means "nothing is listening on that port" rather than "the server crashed."

## Key terminology

- **IP address** — a unique numeric label for a device on a network. Example: `192.168.1.10` is a private IPv4 address assigned to a machine on a local network.
- **Port** — a number that identifies a specific service on a machine, like an apartment number in a building. Example: port `443` means HTTPS, port `22` means SSH.
- **Hostname** — a human-readable label that maps to an IP address via DNS. Example: `kubernetes.default.svc.cluster.local` resolves to a control-plane IP inside a cluster.
- **DNS** — the system that translates hostnames to IP addresses. Example: typing `github.com` in a browser triggers a DNS lookup that returns GitHub's IP before any HTTP request is sent.
- **Protocol** — the agreed-upon format for transmitting data. Example: TCP guarantees delivery and ordering; UDP trades reliability for speed and is used for streaming or DNS lookups.
- **TCP vs. UDP** — TCP is connection-oriented and reliable (used for SSH, HTTP, database connections); UDP is connectionless and fast (used for DNS queries, video streaming). Example: a `git pull` uses TCP over SSH; a DNS resolution for `api.example.com` typically uses UDP.
- **Firewall** — a rule set that controls which network traffic is allowed. Example: AWS Security Groups block all inbound traffic except port 22 (SSH) and 443 (HTTPS) by default.
- **Router** — a device that forwards traffic between networks. Example: your home router connects your local network to your ISP, which connects to the broader Internet.
- **Load balancer** — a system that distributes incoming traffic across multiple backend servers. Example: an Nginx load balancer routes traffic between three application pods running on different nodes.
- **Subnet** — a subdivision of a larger network, used to group related hosts. Example: in AWS, a VPC typically has separate public and private subnets so databases never get public IPs.

## A concrete example

Run these in a Linux terminal to see networking basics in action:

```bash
# Resolve a hostname and see its IP address
host kubernetes.default.svc.cluster.local

# Check your own machine's network interfaces and IPs
ip addr show | grep "inet "

# Test whether a specific port on a host is reachable
# (ssh on port 22 of localhost, with a 3-second timeout)
timeout 3 bash -c '</dev/tcp/localhost/22' && echo "open" || echo "closed"

# List open connections on your machine
ss -tunlp | head -20

# Trace the route packets take to a destination
tracepath -n kubernetes.default.svc.cluster.local
```

These commands expose DNS resolution (`host`), interface configuration (`ip addr`), TCP connectivity testing (`/dev/tcp`), active listening sockets (`ss`), and how packets navigate a network (`tracepath`). This is the diagnostic surface you use when a service can't reach another service.

## How this connects to what's next

Kubernetes networking — Service objects, Ingress controllers, NetworkPolicies, and CNI plugins — is just these same primitives organized declaratively in YAML. Security groups, VPC peering, and private subnets in Terraform apply these rules at the infrastructure layer. Every tool that connects two things relies on this foundation being solid.
