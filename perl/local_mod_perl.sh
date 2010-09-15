#!/bin/sh

# override Ubuntu's mod_perl with one based on your local perl
# you'll find the .so at /usr/lib/apache2/modules/mod_perl.so

# make sure that apxs is available
sudo apt-get install apache2-threaded-dev

cd /tmp
wget http://search.cpan.org/CPAN/authors/id/G/GO/GOZER/mod_perl-2.0.4.tar.gz
tar zxvf mod_perl-2.0.4.tar.gz
cd mod_perl-2.0.4/

perl Makefile.PL MP_APXS=/usr/bin/apxs2
make && make test && make install
