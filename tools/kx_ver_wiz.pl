#!/usr/bin/perl -w
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2012-2014: Henrik Kaare Poulsen
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
use Net::HTTPS;
use Net::FTP;
use LWP::Simple;
use Sort::Versions;
use Data::Dumper;
use YAML::Tiny;
use File::Temp qw/ tempdir /;
use List::Util qw[min max];
use Time::HiRes qw(usleep);

my $KX_TOP;

# ============================================================

my $help=0;
my $man=0;
my $debug=0;
my $n_retry=4;
my $specific_version;
my $force=0;
my $diff='';
my $insane=0;



# ============================================================

my $pkg_inc_script=dirname(__FILE__) . "/kx_version.plinc";
eval `cat $pkg_inc_script` or die $@;


my %package_versions;

my $pkg_version_script=dirname(__FILE__) . "/../../linux/plinc/kx_version.plinc";
eval `cat $pkg_version_script` or die $@;

# ============================================================

sub parseArgs {
	GetOptions(
		"help|?" => \$help,
		"man" => \$man,
		"debug" => \$debug,
		"version=s" => \$specific_version,
		"force" => \$force,
		"diff=s" => \$diff,
		) or pod2usage(64);
	pod2usage(-exitstatus => 0, -verbose => 1) if $help;
	pod2usage(-exitstatus => 0, -verbose => 2) if $man;
}


# ============================================================

sub processUpdate {
	my ($pkg, $ver, $up) = @_;

	my $p0 = substr($pkg, 0, 1);
	$p0 =~ tr/A-Z/a-z/;
	my $pkgref = kxver_pkg_ref_from_name($pkg);

	my $pkg_ver = $package_versions{$pkg};

	my ($ifile, $iurl) = $pkg_ver->{'wiz_url'}($pkg_ver, $pkg, $ver);
	print "Installed tarball [$iurl]\n";

	my ($ufile, $uurl) = $pkg_ver->{'wiz_url'}($pkg_ver, $pkg, $up);
	print "Upstream tarball  [$uurl]\n";

	my $tdir = tempdir("ver_wiz_${pkg}_XXXXXX");
	print "Tempdir  [$tdir]\n";

	my $idir = "$tdir/$ver";
	mkdir($idir);
	my $udir = "$tdir/$up";
	mkdir($udir);

	my $here = getcwd;
	my $ddir = Cwd::abs_path(dirname(__FILE__) . "/../../downloads");

	my $common_script = Cwd::abs_path(dirname(__FILE__)) . "/../shinc/common_functions.shinc";

	print "Downloading ...\n";
	chdir($ddir);
	if (-r $ifile) {
		print "[${ifile}] already found in [${ddir}]\n";
	} else {
		system("wget --output-document='${ifile}' ${iurl}") == 0 or die "*** could not download [${iurl}]\n";
	}
	if (-r $ufile) {
		print "[${ufile}] already found in [${ddir}]\n";
	} else {
		system("wget --output-document='${ufile}' ${uurl}")  == 0 or die "*** could not download [${uurl}]\n";
	}

	my $verify = $pkg_ver->{'verify'};
	if ($verify) {
		print "Verifying ...\n";
		my $sfile;
		my $surl;
		if ($verify eq "tar.xz.sign") {
			$surl = $uurl;
			$surl =~ s/.xz$/.sign/;
			$sfile = $ufile;
			$sfile =~ s/.xz$/.sign/;
		} else {
			$surl = "$uurl.$verify";
			$sfile = "$ufile.$verify";
		}
		if (-r $sfile) {
			print "[${sfile}] already found in [${ddir}]\n";
		} else {
			system("wget --output-document='${sfile}' ${surl}")  == 0 or die "*** could not download [${surl}]\n";
		}
		system(". ${common_script}; KX_BASE=$KX_TOP/../../linux kx_verify $verify $ufile $sfile") == 0 or die "*** could not verify [${ufile}] with [${sfile}]\n";
	}

	chdir($here);

	print "Unpacking ...\n";
	system(". ${common_script}; kx_untar '${idir}' '${ddir}/${ifile}'") == 0 or die "*** could not unpack [${ifile}]\n";
	system(". ${common_script}; kx_untar '${udir}' '${ddir}/${ufile}'") == 0 or die "*** could not unpack [${ufile}]\n";

	my $dfile = "";
	my $wiz_can_diff = $pkg_ver->{'wiz_can_diff'};
	if ($wiz_can_diff) {
		$dfile = "${tdir}/diff_files.txt";
		print "Computing differences ...\n\n";
		system("diff -rqwB -I Copyright ${idir}/* ${udir}/* | sed -e 's:${idir}/::' -e 's:${udir}/::' > ${dfile}") == 0 or die "*** could not execute [diff|sed>]\n";
		my $u=`find ${udir} -type f | wc -l`;
		my $c=`cat ${dfile} | wc -l`;
		chomp $c; chomp $u;
		print "[$c] of [$u] files changed from [$ver] to [$up]\n";

	}

	print "\nYAML info ------------------------------\n\n";
	print "  version: $up\n";
	my $checksum = `sha256sum ${ddir}/${ufile} | cut -d' ' -f1`;
	chomp $checksum;
	print "  checksum: ${checksum}\n";

	print "\nsed command ------------------------------\n\n";
	if ($pkg_ver->{'wiz_sed'}) {
		$pkg_ver->{'wiz_sed'}($up, $checksum);
	} else {
		print 'sed -e s\'/^\([[:space:]]\+version:[[:space:]]*\).*$/\1' . $up .
			'/\' -e s\'/^\([[:space:]]\+checksum:[[:space:]]*\)[0-9a-f]\+[[:space:]]*$/\1' . $checksum . '/\' ' . 
		        "-i master/packages/${p0}/${pkg}.yaml\n";
	}

	my $wiz_yaml = $pkg_ver->{'wiz_yaml'};
	if ($wiz_yaml) { 
		print "\nAdditional YAML info ------------------------------\n\n";
		&$wiz_yaml($pkg, $up, $udir, $ufile, $uurl);
	}


	print "\n------------------------------\n\n";

	system("grep -F patch $KX_TOP/../../master/packages/${p0}/${pkg}.yaml");
	print "\n";

	my @pages = ();

	my @uuglob = glob("${udir}/*");
	my $uudir = $uuglob[0];

	foreach (('news', 'changelog', 'source', 'www', 'url')) {
		my $x = $pkg_ver->{$_};
		if ($x) {
			$x = kxver_replace_version($x, $pkgref, $up);
			if (!(($x =~ "^http")||($x =~ "^ftp"))) {
				$x = "./${uudir}/$x";
				if (!(-e $x)) {
					print "$_ file [$x] not found\n";
					next;
				}
			}
			print "$_: [$x]\n";
			push(@pages, $x);
		} else {
			print "No [$_] information in yaml file\n";
		}
	}

	if ($dfile) {
		push(@pages, $dfile);
	}

	if (@pages) {
		print "Invoking firefox in background to show important files ...\n";
		system("firefox @{pages} &") == 0 or die "*** could not execute [firefox]\n";
	} else {
		print "No important files to show. You may want to update the version: definition in the yaml file\n";
	}

	if ($diff) {

		if ($wiz_can_diff) {
			print "Invoking [$diff] in background to show differences\n";
			system("$diff ${idir}/* ${udir}/* &") == 0 or die "*** could not execute [$diff]\n";
			print "\n";
		} else {
			print "Can not show differences.\n";
		}
	}
}

# ============================================================

$KX_TOP = Cwd::abs_path(dirname(__FILE__));

parseArgs;

if ($#ARGV != 0 ) {
	die "*** Please specify one package name as argument\n";
}

my $pkg = $ARGV[0];

my $pkg_ver = $package_versions{$pkg};
if (!$pkg_ver) {
	die "*** Package [$pkg] not found\n";
}

my $ver=$pkg_ver->{'kxversion'};
my $up=$specific_version;

unless ($up) {
	print "Checking upstream version for package [$pkg] ...\n";

	$up=$pkg_ver->{'upstream'}();
	print "Package [$pkg]: defined [$ver]; upstream [$up]\n";
	unless ($force) {
		if (versioncmp($ver, $up) >= 0 ) {
			print "No update seems necessary for package [$pkg]\n";
			exit 0;
		}
	}

}
processUpdate($pkg, $ver, $up);

# ============================================================

__END__

=head1 NAME

kx_ver_wiz - KaarPux package version wizard

=head1 SYNOPSIS

B<kx_ver_wiz> [F<options>] F<package>

B<kx_version> --help | --man

=head1 DESCRIPTION

B<kx_ver_wiz> is intended to help KaarPux developers update packages.

B<kx_ver_wiz> will:

=over

=item * try to identify the latest version of the specified F<package>

=item * download the current and latest version of the source

=item * show the sha256 checksum for the latest version

=item * show how many files have changed

=item * launch B<firefox> to show release notes, and other relevant info

=item * optionally launch a tool to show differences between the two versions


=back


=head1 OPTIONS

=over 8

=item B<--help>

Print help message and exit.

=item B<--man>

Print manual page and exit.

=item B<--debug>

Show debug messages while processing.

=item B<--version>=F<version>

Do not check for the latest version upstream, but update to the specified F<version>

=item B<--diff>=F<command>

Invoke the specified F<command> to show differences between versions

=item B<--force>

Force processing of package, even if it does not seem to need updating

=back


=head1 BUGS

B<kx_ver_wiz> does not yet work with all KaarPux packages.


=head1 AUTHOR

KaarPo v/Henrik Kaare Poulsen


=head1 SEE

L<http://kaarpux.kaarposoft.dk>

=cut
