---
last_verified: 2026-09-14
tool_version: n/a
sources: []
---

# Kustomize — quick primer

> First-day notes for someone who's never used Kustomize. Personal voice, plain language.

## What is it?

Kustomize is a template-free way to customize Kubernetes manifests. Instead of Go templates like Helm, you keep plain YAML and layer patches on top. Think CSS for Kubernetes configs — a base style, then overrides per environment.

It's built into `kubectl` since v1.14, so `kubectl apply -k` works out of the box.

## What does it do?

Give Kustomize a directory of YAML files (your "base"), then create overlay directories that reference the base and apply patches. Want a different image tag for staging? Write a small patch. The `kustomize build` command merges everything into a single YAML stream you can pipe to `kubectl apply`.

## Why does it exist?

Before Kustomize, you either copy-pasted YAML across environments (which drifts) or used Helm templates (which adds abstraction). Kustomize keeps base manifests as plain YAML and expresses differences as overlays.

## Key terminology

- **Base** — Shared Kubernetes YAML files. Example: a directory with `deployment.yaml` and `service.yaml`.
- **Overlay** — A directory referencing a base and applying patches. Example: `overlays/staging/` changes replica count.
- **Kustomization** — The `kustomization.yaml` file listing bases, patches, and transformations.
- **Build** — The `kustomize build` command that combines base + overlays into final YAML.

## A tiny example

```yaml
# overlays/staging/kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - ../base
patches:
  - target:
      kind: Deployment
      name: my-app
    patch: |
      - op: replace
        path: /spec/replicas
        value: 3
```

Run `kustomize build overlays/staging/` to see the merged output.

## What I'll cover next

After this primer I want to build my first kustomization.yaml from scratch — create a base Deployment and overlay an environment variant.
