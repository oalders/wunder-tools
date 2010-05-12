#!/bin/sh

# installs Rakudo Perl directly from GitHub

git clone git://github.com/rakudo/rakudo.git
cd rakudo/
perl Configure.pl --gen-parrot
make && make test && make install
