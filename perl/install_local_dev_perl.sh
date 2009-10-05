#!/bin/sh

# installs a local copy of the (hopefully) latest development
# version of perl 5

# after running this script, open ~/.profile on your Mac and add:
# export PATH=~/devperl/bin:$PATH
# to the last line of the file

# to use this version, you'll need to refer to perl by its version
# number
# eg: 
# perl5.11.0 --version

perl='perl-5.11.0'

# download
wget http://search.cpan.org/CPAN/authors/id/J/JE/JESSE/$perl.tar.bz2
tar xjf $perl.tar.bz2
cd $perl

# configure and install
perl Configure -de -Dprefix=${HOME}/devperl -Dusethreads -Dusedevel
make
make test
make install

# clean up after yourself
cd ..
rm -rf $perl
rm $perl.tar.bz2

