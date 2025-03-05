#!/bin/bash
source="../../../../ps.openaccessitalia.org-main/storage/settings/bgp.csv"
AS=`sed -n '1p;2p;' $source|grep AS|cut -d, -f2`
NEI=`sed -n '1p;2p;' $source|grep NEI|cut -d, -f2`
CONF="AS $AS
fib-update no

group "ComplianceGuard" {
        remote-as $AS
        announce IPv6 unicast
        announce IPv4 unicast
        neighbor $NEI
}
allow to ibgp
"

echo "$CONF" >/etc/bgpd.conf
echo "Restarting service"
systemctl restart openbgpd
echo "Done"
