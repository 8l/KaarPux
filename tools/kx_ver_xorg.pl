#!/usr/bin/perl -w
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2012: Henrik Kaare Poulsen
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
use File::Temp qw/ tempfile /;
use Fcntl;


# ============================================================

my $help=0;
my $man=0;

my $debug=0;
my $n_retry=4;
my $insane=0;

# ============================================================

my $pkg_inc_script=dirname(__FILE__) . "/kx_version.plinc";
eval `cat $pkg_inc_script` or die $@;

my $ddir = Cwd::abs_path(dirname(__FILE__) . "/../../downloads");

# ============================================================

sub parseArgs {
	GetOptions(
		"help|?" => \$help,
		"man" => \$man,
		"debug" => \$debug,
		) or pod2usage(64);
	pod2usage(-exitstatus => 0, -verbose => 1) if $help;
	pod2usage(-exitstatus => 0, -verbose => 2) if $man;
}


# ============================================================

sub processFile {
	my ($ftp, $file) = @_;
	my  $fn = "${ddir}/${file}";
	if (! -r $fn) {
		$ftp->get($file, $fn) || die "*** Unable to download [$file]: $@\n";
	}
	my  $checksum = `sha256sum ${fn} | cut -d' ' -f1`;
	chomp $checksum;
	print "      . $checksum $file\n";

}

# ============================================================

sub processModule {
	my ($ftp, $module) = @_;
	print "  - ${module}_modules: |\n";
	$ftp->cwd($module);
	my %packages = ();
	my @dir = $ftp->ls;
	for (@dir) { 
		next unless /(.*)-([0-9.]+)\.tar\.bz2/;
		my $prev=$packages{$1};
		if ($prev) {
			$packages{$1}=$2 if versioncmp($2, $prev);
		} else {
			$packages{$1}=$2;
		}
	}

	while ( my ($key, $value) = each(%packages) ) {
		processFile $ftp, "${key}-${value}.tar.bz2";
	}
	$ftp->cwd('..');
}


# ============================================================

sub processFTPdir {
	my ($host, $topdir) = @_;
	my $ftp = kxver_ftp_login($host, $topdir);
	$ftp->binary;
	my @dir_list = $ftp->ls;
	foreach (@dir_list) {
		processModule($ftp, $_) unless /test.*/;
	}
	$ftp->quit();
}


# ============================================================

parseArgs;

processFTPdir "ftp.x.org", "pub/individual";


# ============================================================

__END__

=head1 NAME

kx_ver_xorg - KaarPux version wizard for XORG Modules

=head1 SYNOPSIS

B<kx_ver_xorg>

B<kx_version> --help | --man

=head1 DESCRIPTION

B<kx_ver_xorg> is intended to help KaarPux developers update XORG Modules.

B<kx_ver_xorg> will connect to the ftp.x.org server and download the relevant
individual files, and print lines which can be pasted into
the various F<xorg-XXX.yaml> files

=head1 OPTIONS

=over 8

=item B<--help>

Print help message and exit.

=item B<--man>

Print manual page and exit.

=item B<--debug>

Show debug messages while processing.

=back


=head1 AUTHOR

KaarPo v/Henrik Kaare Poulsen


=head1 SEE

L<http://kaarpux.kaarposoft.dk>

=cut
