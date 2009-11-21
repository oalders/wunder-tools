#!/bin/sh

# install and configure pdns_recursor on Ubuntu
# should be run as root ie: 
#
# sudo sh pdns_recursor
#
# Please note that running this script will replace everything in your /etc/resolv.conf with 
# nameserver 127.0.0.1
#
# The external nameservers you'd like to use for lookups can be managed on a per-interface basis in
# /etc/network/interfaces
#
# So, if you'd like to use OpenDNS on eth0, you might add something like this:
#  
# The primary network interface
# auto eth0
# iface eth0 inet static
#        address xxx.xxx.xxx.xxx 
#        netmask xxx.xxx.xxx.xxx 
#        network xxx.xxx.xxx.xxx 
#        broadcast xxx.xxx.xxx.xxx 
#        gateway xxx.xxx.xxx.xxx 
#        # dns-* options are implemented by the resolvconf package, if installed
#        dns-nameservers 208.67.222.222 208.67.220.220 
#        dns-search mydomainnamehere.com

apt-get install pdns-recursor resolvconf
echo "nameserver 127.0.0.1" >> /etc/resolvconf/resolv.conf.d/base 
resolvconf -u
