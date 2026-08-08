---
last_verified: 2026-08-08
tool_version: n/a
sources:
  - https://www.techitsoft.com/gitops-complete-guide-2026/
  - https://alihaidry-devops.website/blog/paktech-gitops-pipeline
  - https://dev.to/kolyaiks/building-a-complete-gitops-pipeline-on-aws-eks-with-argocd-terraform-and-helm-5950
  - https://github.com/javed97/gitops-argocd-eks
---

# Integrating CI with GitOps

## Purpose

GitOps shifts the deployment control plane from the CI system to the Git
repository. This doc describes one way to connect a CI pipeline (GitHub Actions)
to a GitOps controller (ArgoCD or Flux) so that a single commit can flow from
code change to running workload without the CI system ever touching the cluster
directly. This is one common pattern; teams should adjust it to their own
repository layout and review gates.

## When to use

This pattern fits teams that already use Git as the source of truth for
infrastructure and application configs, and want to eliminate long-lived cluster
credentials from CI systems. It also helps when multiple environments share the
same deployment pipeline but require different approval gates.

## Prerequisites

- A Kubernetes cluster reachable by a GitOps controller (ArgoCD or Flux).
- A Git repository containing the desired manifests or Helm charts.
- A CI system capable of building container images and committing back to Git.

## Steps

1. **CI builds the artifact.** The CI pipeline runs on every push to main,
   builds the container image, pushes it to a registry, and records the image
   tag in a version file or Helm values file inside the Git repository.
2. **CI commits the tag bump back to Git.** The pipeline creates a new commit
   (or opens a pull request) that updates the image tag in the GitOps repo.
   Because the CI system never accesses the cluster, its blast radius is limited
   to the container registry and the Git repository.
3. **GitOps controller detects the change.** ArgoCD or Flux watches the Git
   repository for new commits. When it sees the updated tag, it compares the
   declared state in Git with the running state in the cluster.
4. **Controller reconciles the cluster.** The GitOps tool applies the change
   according to its sync policy. ArgoCD can be configured with automated sync,
   self-heal, and prune options; Flux uses its source-controller and
   kustomize-controller to achieve the same effect.

## Verify

After wiring the pipeline, confirm the end-to-end flow:

1. Push a new image tag to the GitOps repository and watch the GitOps UI or
   CLI report a new sync.
2. Run `kubectl get pods` and confirm the new tag is running.
3. Introduce a deliberate mismatch between the Git tag and the available image
   and verify the GitOps controller reports an `OutOfSync` state.
