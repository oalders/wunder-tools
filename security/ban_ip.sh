#!/bin/sh

# block an IP from all access via iptables
# because I can't be bothered to memorize it 

if [ $# -ne 1 ]; then
     echo 1>&2 "Usage: $0 [192.168.1.5]"
     exit 127
fi

iptables -A INPUT -s $1 -j DROP
