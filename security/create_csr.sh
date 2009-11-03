#!/bin/sh

if [ $# -ne 1 ]; then
     echo 1>&2 "Usage: $0 [www.mydomainname.com]"
     exit 127
fi

openssl genrsa -out $1.key 2048
openssl req -new -key $1.key -out $1.csr

