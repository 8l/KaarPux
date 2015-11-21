#!/usr/bin/perl -w
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2012-2015: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

use strict;

use threads;

use Getopt::Long;
use Pod::Usage;
use File::Basename;
use Net::HTTP;
use Net::HTTPS;
use Net::FTP;
use LWP::Simple;
use Sort::Versions;
use Data::Dumper;
use YAML::Tiny;
use List::Util qw[min max];
use Time::HiRes qw(usleep);

use feature "switch";
no if $] >= 5.018, warnings => "experimental::smartmatch";

my $help=0;
my $man=0;
my $debug=0;
my $only_sensitive=0;
my @phases=();
my $no_upstream=0;
my $n_threads=4;
my $n_threads_max=20;
my $n_retry=4;
my $rpm=0;
my $dpkg=0;
my $insane=0;
#$insane=1;

# ============================================================

my $n_ok = 0;
my $n_hold = 0;
my $n_upd = 0;
my $n_upd_kx = 0;
my $n_upd_sec = 0;
my $n_upd_sec_kx = 0;
my $n_maybe = 0;
my $n_unknown = 0;

# ============================================================

my $pkg_inc_script=dirname(__FILE__) . "/kx_version.plinc";
eval `cat $pkg_inc_script` or die $@;


my %package_versions;

my $pkg_version_script=dirname(__FILE__) . "/../../linux/plinc/kx_version.plinc";
eval `cat $pkg_version_script` or die $@;


# ============================================================

sub sanitize {
	my ($ver) = @_;
	my $v = $ver;
	$v =~ tr|a-zA-Z0-9./\-_()|?|cs;
	if ($v eq "") { $v="?"; }
	$v = substr $v, 0, 20;
	return $v;
}


# ============================================================

sub status {
	my ($sensitive, $hold, $ver, $kver, $up) = @_;

	my $ver_pat = qr|^[a-zA-Z0-9._\-]+$|;
	my $has_ver = ( $ver =~ $ver_pat );
	my $has_up = ( $up =~ $ver_pat );

	my $unknown = 0;
	my $pkgok = 0;
	my $ok = 0;

	if ($has_up) {
		if ($has_ver) {
			$ok = ($ver eq $up) ? 1 : versioncmp($ver, $up) + 1;
			$pkgok = ($kver eq $up) ? 1 : versioncmp($kver, $up) + 1;
		} else {
			$pkgok = ($kver eq $up) ? 1 : versioncmp($kver, $up) + 1;
			#$unknown = $pkgok;
		}		
	} else {
		if ($has_ver) {
			$pkgok = ($ver eq $kver) ? 1 : versioncmp($ver, $kver) + 1;
			$unknown = $pkgok;
		} else {
			$unknown = 1;
		}

	}

	return "?" if $unknown;
	return "=" if $ok;
	return "H" if $hold;
	if ($pkgok) {
		return ">" if !$has_ver;
		return "*" if $sensitive;
		return "+";
	} else {
		return "!" if $sensitive;
		return ".";
	}
	return "?";
}

# ============================================================

my $printf_format="%-27s %15s %15s %15s   %1s\n";

# ============================================================

sub parseArgs {
	GetOptions(
		"help|?" => \$help,
		"man" => \$man,
		"debug" => \$debug,
		"only-sensitive" => \$only_sensitive,
		"phase=s@" => \@phases,
		"no-upstream" => \$no_upstream,
		"threads=i" => \$n_threads,
		"rpm" => \$rpm,
		"dpkg" => \$dpkg,
		) or pod2usage(64);
	pod2usage(-exitstatus => 0, -verbose => 1) if $help;
	pod2usage(-exitstatus => 0, -verbose => 2) if $man;
}

# ============================================================

sub processRPM {
	my ($pkg, $value) = @_;
		my $kver=$value->{'kxversion'};
		my $ver; $ver=$value->{'installed'}() or $ver=$kver;
		$ver=$kver if ($ver eq "?");
		$ver=$kver if ($ver eq "???");
		$ver=$kver if ($ver eq "n/a");
		$ver=$kver if ($ver eq "?.?.?");
		chomp $ver;
		return sprintf "%s~%s~0;\n", $pkg, $ver;
}

# ============================================================

sub processDPKG {
	my ($pkg, $value) = @_;
		my $kver=$value->{'kxversion'};
		my $ver; $ver=$value->{'installed'}() or $ver=$kver;
		$ver=$kver if ($ver eq "?");
		$ver=$kver if ($ver eq "???");
		$ver=$kver if ($ver eq "n/a");
		$ver=$kver if ($ver eq "?.?.?");
		chomp $ver;
		return sprintf "ii  %s %s\n", $pkg, $ver;
}

# ============================================================

sub processOne {
	my ($pkg, $value) = @_;
		print "Processing package [$pkg]\n" if $debug;
		my $sensitive=$value->{'sensitive'};
		return 0 if ( !$sensitive and $only_sensitive);
		return processRPM($pkg, $value) if $rpm;
		return processDPKG($pkg, $value) if $dpkg;
		my $hold=$value->{'hold'};
		my $kver=$value->{'kxversion'};
		my $ver; $ver=$value->{'installed'}() or $ver="???";
		my $up="???";
		if (!$no_upstream) {
			$up=$value->{'upstream'}() or $up="???";
		}
		chomp $ver; chomp $up;
		my $status = status($sensitive, $hold, $ver, $kver, $up);
		return sprintf $printf_format, $pkg, sanitize($ver), $kver, sanitize($up), $status;
}

# ============================================================

sub processSingleThread {
	my @packages = @_;
	print "Processing [" . ($#packages+1) . "] packages in single thread\n" if $debug;
	foreach my $pkg (@packages){
		my $value = $package_versions{$pkg};
		my $result = processOne($pkg, $value) || '';
		print $result;
		# Update counters
		given (substr($result,-2,1)) {
			when (/=/) { $n_ok++; }
			when (/H/) { $n_hold++; }
			when (/\+/) { $n_upd++; }
			when (/\./) { $n_upd_kx++; }
			when (/\*/) { $n_upd_sec++; }
			when (/!/) { $n_upd_sec_kx++; }
			when (/>/) { $n_maybe++; }
			default    { $n_unknown++; }
		}
	}
}

# ============================================================

sub processMultiThread {
	my ($n_threads, @packages) = @_;
	print "Processing [" . ($#packages+1) . "] packages in [$n_threads] threads\n" if $debug;

	my @print_queue = @packages;
	my @process_queue = @packages;
	my %running_threads = ();
	my %tid_to_pkg = ();
	my %dangling_results = ();

	while ($#print_queue+1>0) {

		print "Top of multithread loop\n" if $debug;

		# Start new threads
		while ( ($#process_queue+1>0) && (keys(%running_threads)<$n_threads) ) {
			my $pkg = shift(@process_queue);
			my $value = $package_versions{$pkg};
			print "Starting thread for [$pkg]\n" if $debug;
			my $thread = threads->create('processOne', $pkg, $value);
			my $tid = $thread->tid();
			$running_threads{$tid} = $thread;
			$tid_to_pkg{$tid} = $pkg;
			print "Started thread [$tid] for [$pkg]\n" if $debug;
		}

		# Wait for at least one thread to finish
		print "Wait for threads\n" if $debug;
		my @joinable = ();
		while ( ! @joinable ) {
			usleep(200*1000);
			@joinable = threads->list(threads::joinable);
		}

		# Join completed threads
		print "Joining [" . ($#joinable+1) . "] threads\n" if $debug;
		foreach my $t (@joinable) {
			my $tid = $t->tid();
			my $p = $tid_to_pkg{$tid};
			print "Joining tid [$tid] for package [$p]\n" if $debug;
			$dangling_results{$p} = $t->join();
			delete $running_threads{$tid};
		}
		print "Remaining threads: [ " . join(', ', sort map { $tid_to_pkg{$_} } keys(%running_threads)) . " ]\n" if $debug;

		# Printing results
		while ( ($#print_queue+1>0) && (exists($dangling_results{$print_queue[0]})) ) {
			my $result;
			$result = $dangling_results{$print_queue[0]};
			# Threads "should" not fail, but if they do, put an "x" as status
			if (defined $result) {
				if ($result) {   # zero means a non-sensitive package under --only-sensitive
					print $result;
					# Update counters
					given (substr($result,-2,1)) {
						when (/=/) { $n_ok++; }
						when (/H/) { $n_hold++; }
						when (/\+/) { $n_upd++; }
						when (/\./) { $n_upd_kx++; }
						when (/\*/) { $n_upd_sec++; }
						when (/!/) { $n_upd_sec_kx++; }
						when (/>/) { $n_maybe++; }
						default    { $n_unknown++; }
					}
				}
			} else {
				print $print_queue[0] . " x\n";
			}

			shift(@print_queue);
		}
	}
}

# ============================================================

sub printStat {
	my ($s, $n, $status) = @_;
	if ($n==0) { return; }
	printf "%3d package%1s %-64s %1s\n", $n, ($n>1) ? "s" : "", $status, $s;
}

# ============================================================

sub packages_from_phase {
	my ($phase_def) = @_;
	my @packages = ();
	my $pp;
	foreach $pp (@$phase_def) {
		my $p = $pp->{'pkg'};
		if (defined($p)) {
			$p =~ s/^PERLMODULE_//;
			push @packages, $p;
		} else {
			$p = $pp->{'parallel'};
			if (defined($p)) {
				push @packages, packages_from_phase($p);
			}
		}
	}
	return @packages;
}


# ============================================================
# ============================================================

parseArgs;

my @packages = ();

if (@phases) {
	my $master=dirname(__FILE__) . "/../master.yaml";
	my $yaml = YAML::Tiny->read($master);
	my $yaml0=$yaml->[0];
	my $top;
	my $found;
	my $phase;
	foreach $phase (@phases) {
		PLOOP: foreach $top (@$yaml0) {
			my $t;
			foreach $t (values $top) {
				my $h;
				foreach $h (@$t) {
					my $p;
					foreach $p (keys $h) {
						next unless ($p eq $phase);
						my $phase_def = $h->{$phase};
						$found = 1;
						push @packages, packages_from_phase($phase_def);
						last PLOOP;
					}
				}
			}
		}
		die "No [${phase}] directive in [${master}]\n" unless $found;
	}
	my %hash   = map { $_, 1 } @packages;
        @packages = keys %hash;
} else {
	@packages = keys %package_versions;
}

if ($#ARGV>=0) {
	my @patterns = @ARGV;
	@patterns = map("(^$_\$)", @patterns);
	my $pattern = join('|', @patterns);
	@packages = grep { /$pattern/ } @packages;
}


if ($only_sensitive) {
	@packages = grep { $package_versions{$_}->{'sensitive'}==1 } @packages;
}

@packages = sort {uc($a) cmp uc($b)} @packages;

print "Processing [" . ($#packages+1) . "] packages\n" if $debug;

printf $printf_format, "PACKAGE", "INSTALLED", "PACKAGED", "UPSTREAM", "=" unless ($rpm||$dpkg);

$n_threads = min($#packages+1, $n_threads);
if ($n_threads>$n_threads_max) {
	print "Limiting number of threads to $n_threads_max\n";
	$n_threads=$n_threads_max;
}

print "Number of threads: [$n_threads]\n" if $debug;

if ($n_threads>1) {
	processMultiThread($n_threads, @packages);
} else {
	processSingleThread(@packages);
}

exit 0 if $rpm;
exit 0 if $dpkg;

print "STATUS\n";
printStat("=", $n_ok, "up-to-date");
printStat("H", $n_hold, "on hold");
printStat("+", $n_upd, "outdated (KaarPux has more recent version)");
printStat(".", $n_upd_kx, "outdated (KaarPux needs update too)");
printStat("*", $n_upd_sec, "[sensitive] outdated (KaarPux has more recent version)");
printStat("!", $n_upd_sec_kx, "[sensitive] outdated (KaarPux needs update too)");
printStat(">", $n_maybe, "may or may not be outdated");
printStat("?", $n_unknown, "has unknown status");

# ============================================================

__END__

=head1 NAME

kx_version - show KaarPux package versions

=head1 SYNOPSIS

B<kx_version> [F<options>] [F<package_pattern>...]

B<kx_version> --help | --man

=head1 DESCRIPTION

B<kx_version> will list the KaarPux packages matched by
F<package_pattern>... (where F<package_pattern> is a perl regexp)

For each package B<kx_version> will list the package name,
the version installed on the system, the version defined by KaarPux,
the version defined upstream, and a status letter.

=head1 OPTIONS

=over 8

=item B<--help>

Print help message and exit.

=item B<--man>

Print manual page and exit.

=item B<--debug>

Show debug messages while processing.

=item B<--only-sensitive>

Only process packages marked as sensitive.

=item B<--phase>=F<phase>

Only process packages included in F<phase>.

=item B<--no-upstream>

Do not check installed version versus upstream; only versus KaarPux.

=item B<--threads>=F<n>

Check versions with this number of threads (default 4).

=item B<--rpm>

Instead of the normal output (documented below), show output similar to
/bin/rpm -qa --qf '%{NAME}~%{VERSION}~%{RELEASE};\n'

=item B<--dpkg>

Instead of the normal output (documented below), show output similar to
/bin/dpkg -l

=back

=head1 OUTPUT

The following columns are output:

=over 10

=item B<PACKAGE>

Package name.

=item B<INSTALLED>

Version installed on the system.

=item B<PACKAGED>

Version defined by KaarPux.

This is the version defined in the subdirectories of the F<kaarpux/master/packages> directory
in the directory tree where B<kx_version> is executed.

To ensure accurate results, the lastest version of KaarPux must be 
present here.

=item B<UPSTREAM>

Version defined upstream.

=item B<=>

Status letter.

=back

=head1 STATUS LETTERS

=over 3

=item B<=>

The installed version us up-to-date.

=item B<*>

The installed version us outdated.
A more recent version has been defined by KaarPux.
The package has been marked as sensitive,
so you should update your installed version as soon as possible.

=item B<+>

The installed version us outdated.
A more recent version has been defined by KaarPux.
You should probably update your installed version when convenient.

=item B<!>

The installed version us outdated.
The package has been marked as sensitive.
You could help the KaarPux project significantly
by providing a patch to install the new upstream version as soon as possible.

=item B<.>

The installed version us outdated.
You could help the KaarPux project
by providing a patch to install the new upstream version,
if an update seems necessary.

=item B<>>

The installed version may or may not be outdated.
However, the version defined by KaarPux is up to date.
So you should upgrade if you have an older version.

=item B<H>

The installed version us outdated.
However, for some reason the package may be "on hold".
Please consult the package documentation before considering an update.

=item B<?>

It could not be confirmed whether the package is outdated or not.

=back

=head1 AUTHOR

KaarPo v/Henrik Kaare Poulsen

=head1 SEE

L<http://kaarpux.kaarposoft.dk>

=cut

