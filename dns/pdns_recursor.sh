#!/bin/sh

# install and configure pdns_recursor on Ubuntu
# should be run as root

apt-get install pdns-recursor resolvconf
echo "nameserver 127.0.0.1" >> /etc/resolvconf/resolv.conf.d/base 
resolvconf -u
