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

## DNS interaction

- This host already runs `dnscrypt-proxy` on `127.0.0.1:53`
- Local wildcard lab DNS therefore runs through `dnsmasq` on `127.0.0.1:53535`
- macOS should scope `*.lab.test` to `/etc/resolver/lab.test`
