---
last_verified: 2026-07-17
tool_version: n/a
---

# Networking Basics — quick primer

> First-day notes on Networking Basics. What it is, why it matters, and the key ideas to know.

## What is it?

I think of networking as the postal system for data. Every device on a network has an address, data gets split into small packets, and routers decide where each packet goes. When I load a webpage, my request gets broken into envelopes, routed across multiple networks, and reassembled on the other side. Understanding this helps me figure out why a container can't reach a database or why `curl localhost` works from one pod but not another.

## Why does it matter for DevOps?

Every DevOps task involves networking. Containers talk to each other, load balancers distribute traffic, firewalls block ports, DNS resolves names to IPs, and cloud security groups control access. When a service can't reach a database or a health check fails, the root cause is almost always a networking issue. Without fundamentals, I'm guessing at firewall rules and IP addresses instead of diagnosing the actual problem.

## Key terminology

- **IP address** — A device's unique identifier on a network. Example: `192.168.1.10` for a host on a local network.
- **Port** — A number identifying a specific service on a device. Example: port 80 for HTTP, 443 for HTTPS, 22 for SSH.
- **DNS** — Translates human-readable names to IP addresses. Example: `google.com` resolves to an IP so I don't have to remember numbers.
- **Firewall** — Controls which traffic is allowed or blocked. Example: `ufw allow 22` opens the SSH port.
- **Load balancer** — Distributes traffic across multiple servers. Example: An AWS ALB sending requests to three EC2 instances.
- **Subnet** — A segmented portion of a larger network. Example: `10.0.1.0/24` contains 254 usable IP addresses.
- **NAT** — Maps private IPs to a public one. Example: My home router uses NAT so all devices share one public IP.
- **TCP vs UDP** — TCP guarantees ordered delivery; UDP is faster but can drop packets. Example: SSH uses TCP; DNS queries often use UDP.

## A concrete example

```bash
TARGET="8.8.8.8"
traceroute "$TARGET"            # see the path packets take across networks
nc -zv "$TARGET" 53             # check if DNS port 53 is reachable
ss -tulpn | grep :80            # show what's listening on port 80 locally
```

This script demonstrates three core networking tools I use when debugging: `traceroute` maps the network path, `nc` (netcat) probes whether a port is open, and `ss` shows local socket state. Together they help me answer "is the network path clear and is something actually listening?"

## How this connects to what's next

Networking knowledge applies directly to Docker networks, Kubernetes Services, Ingress controllers, and cloud load balancers. Once I know what a port is, I can map container ports, debug "connection refused" errors, and design service meshes with confidence.
