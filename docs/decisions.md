# Decisions

## Current defaults

- Local cluster runtime: Docker Desktop
- Kubernetes substrate: Docker Desktop Kubernetes using the `kind` provisioner
- Cluster topology target: 1 control-plane, 2 workers
- Initial edge assumption: use Docker Desktop's local load balancer support
  for `Service.type=LoadBalancer` instead of installing MetalLB

## Open questions

- Whether Docker Desktop networking on this host reliably exposes `LoadBalancer`
  services on the Mac without extra components
- Whether later edge traffic should use native `LoadBalancer` services, specific
  host aliases, or fallback tools like `kubectl port-forward`
