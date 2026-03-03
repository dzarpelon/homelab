# Homelab GitOps Lab

This repository tracks the hands-on work for the `GitOps Lab` project.

The current focus is Sprint 1, Issue 1: validate the local kind cluster
foundation on macOS before layering Consul, Vault, and GitOps tooling on top.

## Current scope

- Provision a reproducible 3-node kind cluster
- Validate Docker Desktop and host port assumptions
- Capture environment and networking notes for future sprints

## Quick start

```bash
make prereqs
make env
make create
make verify
```

If you need to tear down the lab:

```bash
make delete
```

## Repository layout

- `docs/`: runbooks and operating notes
- `infra/kind/`: cluster config and helper scripts
- `scripts/`: local validation helpers
- `platform/`: reserved for platform components in later sprints
- `apps/`: reserved for app onboarding in later sprints

