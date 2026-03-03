# Validation Notes

Use this file as the running evidence log for Issue 1.

## Environment snapshot

- Date: March 3rd 2026
- macOS version: arwin Diegos-MacBook-Pro-2.local 25.3.0 Darwin Kernel Version 25.3.0
- Docker Desktop version: client=29.2.1 server=29.2.1
- kind version: 0.31.0
- kubectl version: v1.34.1

## Cluster validation

- Active kube context: docker-desktop
- Docker Desktop cluster detected: yes
- Three nodes Ready: yes
```
NAME                    STATUS   ROLES           AGE    VERSION
desktop-control-plane   Ready    control-plane   5d8h   v1.35.1
desktop-worker          Ready    <none>          5d8h   v1.35.1
desktop-worker2         Ready    <none>          5d8h   v1.35.1
```
- `LoadBalancer` support observed: yes
```
kubectl get svc -A

NAMESPACE         NAME                      TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)                                                                            AGE
birdwatcher-app   backend                   ClusterIP      10.96.250.11    <none>        80/TCP                                                                             5d8h
birdwatcher-app   frontend                  LoadBalancer   10.96.240.84    172.18.0.4    6060:31559/TCP                                                                     5d8h
consul            consul-connect-injector   ClusterIP      10.96.106.247   <none>        443/TCP                                                                            4d8h
consul            consul-dns                ClusterIP      10.96.116.249   <none>        53/TCP,53/UDP                                                                      4d8h
consul            consul-ingress-gateway    ClusterIP      10.96.5.44      <none>        8080/TCP,8443/TCP                                                                  4d8h
consul            consul-server             ClusterIP      None            <none>        8500/TCP,8502/TCP,8301/TCP,8301/UDP,8302/TCP,8302/UDP,8300/TCP,8600/TCP,8600/UDP   4d8h
consul            consul-ui                 LoadBalancer   10.96.112.224   172.18.0.3    8500:31035/TCP                                                                     4d8h
consul            prometheus-server         ClusterIP      10.96.168.23    <none>        80/TCP                                                                             4d8h
default           kubernetes                ClusterIP      10.96.0.1       <none>        443/TCP                                                                            5d8h
kube-system       kube-dns                  ClusterIP      10.96.0.10      <none>        53/UDP,53/TCP,9153/TCP                                                             5d8h
```
- Host ports `80/443` available: yes
```
 make ports  
bash scripts/check-ports.sh
Port 80 is available.
Port 443 is available.
```
- Any Docker Desktop constraints observed: none

## Follow-up items
