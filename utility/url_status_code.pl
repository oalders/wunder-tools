#!/usr/bin/env perl

=head1 SYNOPSIS

Returns an HTTP status code for a given URL.  Useful for troubleshooting if redirects are 301 vs 302 etc.

=cut

use Modern::Perl;
use WWW::Mechanize;

my $mech = WWW::Mechanize->new( autocheck => 0 );

my $url = shift @ARGV;

if ( !$url ) {
    say "Usage: perl url_status_code.pl http://myurl.com/foo";
    exit(0);
} 
 
$mech->requests_redirectable( [] );
$mech->get( $url );
 
say "status: " . $mech->status;
