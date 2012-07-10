#!/bin/sh

# should remove every kernel but the latest
# make sure you reboot first if you've updated the kernel lately

dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\)//")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*//;/[0-9]/!d' | xargs sudo apt-get -y purge
