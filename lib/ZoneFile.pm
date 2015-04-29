package ZoneFile;

use strict;
use warnings;
use feature qw( say );

use Moose;

use DateTime;
use Mojo::Template;
use Path::Tiny;

with 'MooseX::Getopt::Dashes';

has domain => (
    is            => 'ro',
    isa           => 'Str',
    required      => 1,
    documentation => 'domain name for record',
);

has is_master => (
    is      => 'ro',
    isa     => 'Bool',
    default => 0,
);

has is_slave => (
    is      => 'ro',
    isa     => 'Bool',
    default => 0,
);

has www => (
    is            => 'ro',
    isa           => 'Str',
    required      => 1,
    documentation => 'IP Address for WWW and bare domain records',
);

sub run {
    my $self   = shift;
    my $record = $self->_render;

    my $zone = path( '/etc/bind/zones', 'db.' . $self->domain );
    $zone->spew( $self->_render );

    my $domain = $self->domain;
    if ( $self->is_master ) {

        my $master = path( '/etc/bind/named.conf.local' );

        my $path = $zone->stringify;

        my $append = <<"EOF";

zone "$domain" {
    type master;
    file "$path";
};
EOF

        $master->append( $append );
    }

    if ( $self->is_slave ) {
        my $slave = <<"EOF";
zone "$domain" {
    type slave;
    masters { 10.0.0.110; 216.15.147.79; };
    file "/var/lib/bind/db.$domain";
};

EOF
        say $slave;
    }
}

sub _render {
    my $self = shift;
    my $now  = DateTime->now;

    return Mojo::Template->new->render(
        <<'EOF', $self->domain, $self->www, $now->ymd( q{} ) . $now->hms( q{} ) );
% my ($domain, $www, $serial) = @_;
$TTL 350
$ORIGIN <%= $domain %>.

@    IN SOA    ns1.wundersolutions.com.    support.wundersolutions.com. (
    <%= $serial %> ; Serial
    10800           ; Refresh
    3600            ; Retry
    604800          ; Expire
    350         ) ; Minimum

        350    IN A        <%= $www %>
        350    IN NS       ns1.wundersolutions.com.
        350    IN NS       ns2.wundersolutions.com.
www     350    IN A        <%= $www %>
EOF
}

__PACKAGE__->meta->make_immutable();
1;
