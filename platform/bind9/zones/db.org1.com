$ORIGIN org1.com.
$TTL 86400
@   IN  SOA bind9-service.bind9-system.svc.cluster.local. admin.org1.com. (
            2026012001 ; Serial
            3600       ; Refresh
            1800       ; Retry
            604800     ; Expire
            86400 )    ; Minimum
@   IN  NS  bind9-service.bind9-system.svc.cluster.local.