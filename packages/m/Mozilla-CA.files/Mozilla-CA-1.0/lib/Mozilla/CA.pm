package Mozilla::CA;

use strict;
our $VERSION = '1.0';

sub SSL_ca_file {
    return "/etc/ssl/certs/ca-bundle.crt";
}

1;

__END__

=head1 NAME

Mozilla::CA - Fake version of perl's Mozilla's CA module

=head1 SYNOPSIS

    use IO::Socket::SSL;
    use Mozilla::CA;

    my $host = "www.paypal.com";
    my $client = IO::Socket::SSL->new(
	PeerHost => "$host:443",
	SSL_verify_mode => 0x02,
	SSL_ca_file => Mozilla::CA::SSL_ca_file(),
    )
	|| die "Can't connect: $@";

    $client->verify_hostname($host, "http")
	|| die "hostname verification failure";

=head1 DESCRIPTION

The official perl module Mozilla::CA
provides a copy of Mozilla's bundle of Certificate Authority
certificates in a form that can be consumed by modules and libraries
based on OpenSSL.

The present module simply points to the bundle
we already have in KaarPux.

The module provide a single function:

=over

=item SSL_ca_file()

Returns the absolute path to the Mozilla's CA cert bundle PEM file.

=back

=head1 AUTHOR

Henrik Kaare Poulsen, E<lt>henrik@kaarposoft.dkE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 by Henrik Kaare Poulsen

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.


=cut
