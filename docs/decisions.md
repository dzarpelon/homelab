# Decisions

## Current defaults

- Local cluster runtime: Docker Desktop
- Kubernetes substrate: kind
- Cluster topology: 1 control-plane, 2 workers
- Initial edge assumption: map host ports `80` and `443` to the control-plane node

## Open questions

- Whether Docker Desktop networking on this host reliably supports direct host access
  to `80/443` for the kind node container
- Whether later edge traffic should use direct port mappings, `kubectl port-forward`,
  or a local load balancer helper

