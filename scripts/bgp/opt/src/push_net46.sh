#!/bin/bash
bgpctl network flush
cat ../../../../ps.openaccessitalia.org-main/storage/download/ipv4.txt|while read ip;do bgpctl network add $ip community NO_EXPORT community BLACKHOLE; done
cat ../../../../ps.openaccessitalia.org-main/storage/download/ipv6.txt|while read ip;do bgpctl network add $ip community NO_EXPORT community BLACKHOLE; done
