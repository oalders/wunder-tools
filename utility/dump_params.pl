#!/usr/bin/perl

use Modern::Perl;

=head1 SYNOSPSIS

Pretty-prints an URL GET request so you can more easily make sense of it.

perl dump_params.pl "f=q&source=s_q&hl=en&geocode=&q=toronto,+on&sll=43.670478,-79.404086&sspn=0.01088,0.018218&ie=UTF8&hq=&hnear=Toronto,+Toronto+Division,+Ontario&z=10" 

=cut

use CGI::Simple qw(-debug1);
use Data::Dump qw( dump );

my $q = CGI::Simple->new;

say dump { $q->Vars };
