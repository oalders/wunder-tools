#!/bin/sh

if [ $# -ne 1 ]; then
     echo 1>&2 "Usage: $0 [www.mydomainname.com]"
     exit 127
fi

# assumes 2 things:
#
# 1) you have already run create_csr.sh www.mydomainname.com
# 2) you are running this script from the same directory

openssl x509 -req -days 365 -in $1.csr -signkey $1.key -out $1.crt
