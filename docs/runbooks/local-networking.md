# Local Networking Notes

## Purpose

Track host networking assumptions before introducing ingress, API gateways, or DNS.

## Checks

- Verify ports `80` and `443` are free on the Mac before cluster creation
- Confirm the kind control-plane node can bind those host ports
- Record whether Docker Desktop exposes those ports reliably on this machine

## Validation commands

```bash
make ports
docker ps
kubectl get nodes -o wide
```

## Notes to capture

- Any conflicting local services already bound to `80/443`
- Whether browser and `curl` traffic can reach workloads through mapped ports later
- Any Docker Desktop limitations or workarounds needed on this host

