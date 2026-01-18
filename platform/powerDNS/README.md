# PowerDNS API Usage

This guide provides examples of how to interact with the PowerDNS API using `curl`.

## Prerequisites
- Replace `<API_KEY>` with the value from the `pdns-api-key` secret.
- Commands assume usage from within the cluster (referencing the service DNS name). If running locally with port-forwarding, replace `http://pdns-service.powerdns-system.svc.cluster.local:8081` with `http://localhost:8081`.

## 1. List All Zones

Retrieve a list of all DNS zones hosted by the server.

```bash
curl -s -H "X-API-Key: <API_KEY>" \
  http://pdns-service.powerdns-system.svc.cluster.local:8081/api/v1/servers/localhost/zones
```

## 2. Create a New Zone

Create a new native zone named `internal.lan.` with two nameservers.

```bash
curl -X POST \
  -H "X-API-Key: <API_KEY>" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "internal.lan.",
    "kind": "Native",
    "nameservers": ["ns1.internal.lan.", "ns2.internal.lan."]
  }' \
  http://pdns-service.powerdns-system.svc.cluster.local:8081/api/v1/servers/localhost/zones
```

## 3. List All Records in a Zone

Retrieve all DNS records and metadata for the `internal.lan.` zone.

```bash
curl -s -H "X-API-Key: <API_KEY>" \
  http://pdns-service.powerdns-system.svc.cluster.local:8081/api/v1/servers/localhost/zones/internal.lan.
```
