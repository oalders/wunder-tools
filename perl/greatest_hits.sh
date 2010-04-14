#!/usr/bin/perl

# This is a set of modules I like to have available in every Perl install.
#
# Installs are broken out into several commands for layout/clarity.

cpan App::cpanminus
cpanm --self-upgrade

# Modules required by CPAN installer
cpanm --skip-installed YAML::Syck CPAN Archive::Zip Archive::Tar CPAN::SQLite CPAN::Reporter

cpanm --skip-installed Perl::Critic Test::Perl::Critic
cpanm --skip-installed Number::Bytes::Human
cpanm --skip-installed DBI
cpanm --skip-installed Bundle::CPAN
cpanm --skip-installed Modern::Perl CGI Data::Dump WWW::Mechanize::Cached
cpanm --skip-installed Catalyst::Devel Catalyst::Runtime Catalyst::Model::DBIC::Schema Catalyst::View::TT 
cpanm --skip-installed Net::Twitter
