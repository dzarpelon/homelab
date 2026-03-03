# Local Networking Notes

## Purpose

Track host networking assumptions before introducing ingress, API gateways, or DNS.

## Checks

- Verify ports `80` and `443` are free on the Mac before you test ingress paths
- Confirm Docker Desktop can expose `Service.type=LoadBalancer` addresses
- Record whether north-south traffic works without MetalLB on this machine

## Validation commands

```bash
make ports
docker ps
kubectl get nodes -o wide
kubectl get svc -A
```

## Notes to capture

- Any conflicting local services already bound to `80/443`
- Whether browser and `curl` traffic can reach workloads through `LoadBalancer`
  services later
- Any Docker Desktop limitations or workarounds needed on this host
