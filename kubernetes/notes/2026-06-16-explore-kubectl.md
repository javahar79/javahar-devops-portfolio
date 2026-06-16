# 2026-06-16 — poking around kubectl

I installed kind and created a local cluster. The first thing I did was run `kubectl` with no args to see the help output. There are a lot of subcommands.

Ran `kubectl get nodes` — it shows one node called `dev-cluster-control-plane` with status `Ready`. Good.

`kubectl get pods --all-namespaces` showed the system pods: `coredns` and `kindnet`. They were all running.

Tried `kubectl api-resources` — that lists all resource types the cluster knows about. There are way more than I expected. I'll focus on pods, services, deployments, and namespaces for now.

`kubectl explain pod` gives detailed documentation for any resource. Super useful.

I notice kubectl uses `kubeconfig` to find the cluster — mine was automatically set up by kind at `~/.kube/config`. The `kubectl config current-context` command confirmed I'm talking to the right cluster.
