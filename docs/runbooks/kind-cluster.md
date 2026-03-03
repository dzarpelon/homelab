# Docker Desktop kind Provisioner Runbook

## Goal

Validate the existing Docker Desktop Kubernetes cluster running with the
`kind` provisioner.

## Prerequisites

Run:

```bash
make prereqs
make ports
```

## Confirm the cluster context

Run:

```bash
make create
```

This does not create a cluster. It verifies that:

- Docker Desktop is reachable
- the active kube context is `docker-desktop`
- at least 3 nodes exist

## Validate the cluster

Run:

```bash
make verify
```

Expected outcomes:

- `kubectl cluster-info` returns control-plane endpoints
- `kubectl get nodes` shows at least 3 Ready nodes
- `kubectl get pods -A` returns without API errors

## Resetting the cluster

Do not use this repo to destroy the Docker Desktop-managed cluster.
If you intentionally need a reset, do it from Docker Desktop settings.
