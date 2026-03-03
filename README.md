# Homelab GitOps Lab

This repository tracks the hands-on work for the `GitOps Lab` project.

The current focus is Sprint 1, Issue 1: validate the local Docker Desktop
Kubernetes cluster using the `kind` provisioner before layering Consul, Vault,
and GitOps tooling on top.

## Current scope

- Validate the existing 3-node Docker Desktop cluster
- Validate Docker Desktop and host port assumptions
- Capture environment and networking notes for future sprints

## Quick start

```bash
make prereqs
make ports
make env
make create
make verify
```

The repo does not destroy the Docker Desktop-managed cluster. If you need to
reset it, do that intentionally from Docker Desktop itself.

## Repository layout

- `docs/`: runbooks and operating notes
- `infra/kind/`: cluster validation helpers for the Docker Desktop-managed cluster
- `scripts/`: local validation helpers
- `platform/`: reserved for platform components in later sprints
- `apps/`: reserved for app onboarding in later sprints
