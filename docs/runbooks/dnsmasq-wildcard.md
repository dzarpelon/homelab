# dnsmasq Wildcard Runbook

## Goal

Resolve all local lab hostnames under `*.lab.test` to the Mac loopback address
without interfering with the employer-managed DNS stack.

## Working design

- Corporate `dnscrypt-proxy` continues to own `127.0.0.1:53`
- `dnsmasq` serves only lab DNS on `127.0.0.1:53535`
- macOS uses a scoped resolver for `lab.test`
- `*.lab.test` resolves to `127.0.0.1`

This avoids:

- competing for `127.0.0.1:53`
- adding a `lo0` alias such as `127.0.0.2`
- `.local` / mDNS ambiguity on macOS

## dnsmasq configuration

File:

```text
/opt/homebrew/etc/dnsmasq.conf
```

Required directives:

```conf
listen-address=127.0.0.1
bind-interfaces
port=53535
address=/lab.test/127.0.0.1
```

## macOS scoped resolver

File:

```text
/etc/resolver/lab.test
```

Contents:

```conf
nameserver 127.0.0.1
port 53535
```

## Validation

Direct query to `dnsmasq`:

```bash
dig @127.0.0.1 -p 53535 api.lab.test
```

Expected result:

- `status: NOERROR`
- `api.lab.test` returns `127.0.0.1`

System resolver path:

```bash
dscacheutil -q host -a name api.lab.test
```

Expected result:

- `name: api.lab.test`
- `ip_address: 127.0.0.1`

## Operational notes

- `dnsmasq` should be run through Homebrew services
- `dnscrypt-proxy` should be left untouched on this IBM-managed host
- If the edge entrypoint later moves off loopback, update only the
  `address=/lab.test/<target-ip>` line
