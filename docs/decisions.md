# Decisions

## Current defaults

- Local cluster runtime: Docker Desktop
- Kubernetes substrate: Docker Desktop Kubernetes using the `kind` provisioner
- Cluster topology target: 1 control-plane, 2 workers
- Initial edge assumption: use Docker Desktop's local load balancer support
  for `Service.type=LoadBalancer` instead of installing MetalLB
- Local wildcard DNS domain: `lab.test`
- Local wildcard DNS implementation: `dnsmasq` on `127.0.0.1:53535`
- macOS domain scoping: `/etc/resolver/lab.test`

## Open questions

- Whether Docker Desktop networking on this host reliably exposes `LoadBalancer`
  services on the Mac without extra components
- Whether later edge traffic should use native `LoadBalancer` services, specific
  host aliases, or fallback tools like `kubectl port-forward`

## DNS rationale

- `lab.local` was dropped in favor of `lab.test` to avoid `.local` / mDNS
  ambiguity on macOS
- `dnscrypt-proxy` is already bound to `127.0.0.1:53` on this IBM-managed host,
  so `dnsmasq` must not compete for that socket
- Running `dnsmasq` on `127.0.0.1:53535` plus a scoped resolver keeps the lab DNS
  isolated without interfering with the employer-managed DNS stack
