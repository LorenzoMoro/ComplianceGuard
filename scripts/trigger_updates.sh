#!/bin/bash

LTIMEv4=0
LTIMEv6=0

while true    
do
   ATIMEv4=`stat -c %Z ../ps.openaccessitalia.org-main/storage/download/ipv4.txt`
   ATIMEv6=`stat -c %Z ../ps.openaccessitalia.org-main/storage/download/ipv6.txt`

   if [[ "$ATIMEv4" != "$LTIMEv4" || "$ATIMEv6" != "$LTIMEv6" ]]
   then    
       ./push_networks.sh
       LTIMEv4=$ATIMEv4
       LTIMEv6=$ATIMEv6
   fi
   sleep 5
done
