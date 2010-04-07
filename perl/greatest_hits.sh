#!/usr/bin/perl

# This is a set of modules I like to have available in every Perl install.
#
# Installs are broken out into several commands for layout/clarity.

cpan App::cpanminus

# Modules required by CPAN installer
cpanm YAML::Syck CPAN Archive::Zip Archive::Tar CPAN::SQLite CPAN::Reporter

cpanm Perl::Critic Test::Perl::Critic
cpanm Number::Bytes::Human
cpanm Template::Plugin::DateTime::Format
cpanm DBI
cpanm Bundle::CPAN
cpanm Modern::Perl CGI Data::Dump WWW::Mechanize::Cached
cpanm Catalyst::Devel Catalyst::Runtime Net::Twitter
