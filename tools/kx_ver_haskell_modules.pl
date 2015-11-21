#!/usr/bin/perl -w
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2013: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

use strict;
use Getopt::Long;
use File::Basename;
use Pod::Usage;
use File::Basename;
use Cwd;
use Net::HTTP;
use Net::FTP;
use LWP::Simple;
use Sort::Versions;
use Data::Dumper;
use YAML::Tiny;


# ============================================================

my $help=0;
my $man=0;

my $debug=0;
my $n_retry=4;
my $insane=0;

# ============================================================

my $pkg_inc_script=dirname(__FILE__) . "/kx_version.plinc";
eval `cat $pkg_inc_script` or die $@;


# ============================================================

sub parseArgs {
	GetOptions(
		"help|?" => \$help,
		"man" => \$man,
		) or pod2usage(64);
	pod2usage(-exitstatus => 0, -verbose => 1) if $help;
	pod2usage(-exitstatus => 0, -verbose => 2) if $man;
}


# ============================================================

sub readHaskellModules {
	my $f = dirname(__FILE__) . "/../packages/h/haskell_modules.yaml";
	my $yaml = YAML::Tiny->read($f);
	if (!defined $yaml) {
		die "Could not read YAML for haskell modules in [${f}]: ". YAML::Tiny->errstr;
	}

	my $yaml0=$yaml->[0]->{'haskell_modules'};
	return $yaml0;

}

# ============================================================

sub processHaskellModule {

	my ($pkg, $value) = @_;
	chomp $value;

	my ($version, $checksum) = split(/\s+/, $value);

	my $version2 = kxver_scrape_url(undef, "http://hackage.haskell.org/packages/archive/${pkg}/",  qr|>([0-9]+\.[0-9.]*[0-9]+)/<|);

	my $filename = "${pkg}-${version2}.tar.gz";
	my $url = "http://hackage.haskell.org/packages/archive/${pkg}/${version2}/${filename}";

	if (! -r $filename) {
		system("wget ${url} >/dev/null 2>&1") == 0 or die "*** could not download [${url}]\n";
	}

	my  $checksum2 = `sha256sum ${filename} | cut -d' ' -f1`;
	chomp $checksum2;

	if ($version ne $version2) {
		print "    # ${pkg}: ${version} ${checksum}\n";
		print "    ${pkg}: ${version2} ${checksum2}\n";
	} else {
		print "    # ${pkg}: ${version} >>> No update found\n";
		print "    ${pkg}: ${version} ${checksum}\n";
	}
}


# ============================================================

parseArgs;

my $all_modules = readHaskellModules();

my $modules = {};

if ($#ARGV==-1) {
	$modules = $all_modules;
} else {
	foreach (@ARGV) {
		my $m = $all_modules->{$_};
		if (!defined($m)) { die "No such haskell module: [$_]\n"; }
		$modules->{$_} = $m;
	}
}

my $ddir = Cwd::abs_path(dirname(__FILE__) . "/../../downloads");
chdir($ddir);

while ( my ($key, $value) = each($modules) ) {
	processHaskellModule($key, $value);
}


# ============================================================

__END__

=head1 NAME

kx_ver_haskell_modules - KaarPux version wizard for haskell modules

=head1 SYNOPSIS

B<kx_ver_haskell_modules> [ F<module> ... ]

B<kx_version> --help | --man

=head1 DESCRIPTION

B<kx_ver_haskell_modules> is intended to help KaarPux developers update haskell modules.

B<kx_ver_haskell_modules> will:

=over

=item * read F<haskell_modules.yaml>

=item * find the latest version of the source for each module

=item * print updated lines which can be pasted into F<haskell_modules.yaml>

=back


=head1 OPTIONS

=over 8

=item B<--help>

Print help message and exit.

=item B<--man>

Print manual page and exit.

=back


=head1 AUTHOR

KaarPo v/Henrik Kaare Poulsen


=head1 SEE

L<http://kaarpux.kaarposoft.dk>

=cut
