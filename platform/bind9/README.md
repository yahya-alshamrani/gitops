# Dynamic DNS Updates (RFC 2136) for Bind9

This guide explains how to perform dynamic DNS updates using `nsupdate` and verify them using `dig`.

## 1. In-Cluster Testing (Recommended)

If you prefer to test from inside the cluster (closer to how real apps will behave), follow these steps.

### Step 1: Launch a Debug Pod
Launch a temporary pod with DNS tools installed:

```bash
kubectl run -it --rm --restart=Never --image=infoblox/dnstools:latest dns-debug -- sh
```

### Step 2: Perform Update from Pod
Once inside the pod, run `nsupdate`. Note that we use the **internal ClusterDNS name** (`bind9-service.bind9-system.svc.cluster.local`).

```bash
# Execute the update using heredoc
nsupdate -y hmac-sha256:ddns-key:<TSIG_KEY> <<EOF
server <DNS_SERVER>
debug yes
zone org1.com
update add dynamic-test.org1.com 60 A 1.2.3.4
show
send
EOF
```

### Step 3: Verify from Pod
Query the server directly to verify:

```bash
dig @${DNS_SERVER} dynamic-test-.org1.com +short
```
