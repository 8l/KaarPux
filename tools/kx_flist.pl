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
use Pod::Usage;
use File::Basename;
use File::Find;
use Cwd qw(abs_path);

$| = 1;

my $help=0;
my $man=0;
my $debug = 0;

my $no_ldd = 0;

# ============================================================
# INPUT / OUTPUT DIRECTORIES

my $bdir = abs_path( dirname(__FILE__) . "/../../" );
my $fdir = abs_path( dirname(__FILE__) . "/../../flist" );
my $ddir = abs_path( dirname(__FILE__) . "/../../dependencies" );


# ============================================================
# FILES TO IGNORE

# There are two reasons to ignore some apparent dependencies:
# 1) Some files are written by many packages
#	e.g /var/log/... or /var/cache...
# 2) Some files are read by packages, without really signifying a hard dependency
# 	e.g /etc

my @ignore = (
	qr|^/var/log|,
	qr|^/var/cache|,
	qr|^/share/mime|,
	qr|^/share/fonts/.*dir$|,
	qr|^/share/fonts/.*scale$|,
	qr|^/share/.*cache$|,
	qr|^/lib/.*cache$|,
	qr|^/opt/kaarpux/|,
	qr|^/opt/share/.*cache$|,
	qr|^/opt/lib/.*cache$|,
	qr|^/lib/.*/perllocal.pod$|,
	qr|^/lib/python.*/site-packages/.*pth$|,
	qr|^/share/glib.*/schemas/gschemas.compiled$|,
	qr|^/share/info/dir$|,
	qr|^/share/gtk-doc|,
);


# ============================================================
# DIRECTORIES TO SEARCH FOR LDD

my @dirs = (
	'/bin',
	'/lib',
	'/libexec',
	'/usr/local/bin',
	'/usr/local/lib',
	'/usr/local/libexec',
	'/opt/bin',
	'/opt/lib',
	'/opt/libexec',
);


# ============================================================
# LDD PATTERNS

# http://linux.die.net/man/1/ldd
my $ldd_pattern = qr|^\s*\S+ => (\S+) \(0x[a-f0-9]+\)$|;
my $notfound_pattern = qr|^\s*(\S+) => not found$|;

# http://www.trilithium.com/johan/2005/08/linux-gate/
my $linux_gate_pattern = qr:^\s*linux-(gate)|(vdso)\.so:;

# http://www.cs.virginia.edu/~dww4s/articles/ld_linux.html
my $ld_linux_pattern = qr|^\s*\S*ld-linux\S*\.so|;

my $ld_statically_linked_pattern = qr|^\s*statically linked$|;


# ============================================================

sub process_build_times {
	my $filename;

	$filename = "${ddir}/build_times.txt";
	print "Listing build times into [$filename]\n";
	open (my $of, ">${filename}") or die "Cannot open output file [$filename]: $!\n";
	print "\tOutput file [$filename] opened\n" if $debug;

	$filename = "${bdir}/build.log";
	open (my $if, "<${filename}") or die "Cannot open input file [$filename]: $!\n";

	my $phase = "unknown";
	while (<$if>) {
		chomp;
		if (/KX_BLD_STRT/) {
			$_ =~ m|\[(.*)\]|;
			$phase=$1;
		} elsif (/KX_BLD_STEP/) {
			$_ =~ m|^.*: (.*)$|;
			$phase=$1;
		} elsif (/KX_PKG_DONE/) {
			$_ =~ m|^.*KX_PKG_DONE \[(.*)\] took \[(.*)\].*$|;
			print $of "${phase}_$1\t$2\n";
		}
	}

	close $if;
	close $of;
}


# ============================================================

my %installed = ();

sub process_rw {
	my $filename;

	$filename = "${ddir}/installed_files.txt";
	print "Listing installed files into [$filename]\n";
	open (my $if, ">${filename}") or die "Cannot open output file [$filename]: $!\n";
	print "\tOutput file [$filename] opened\n" if $debug;

	$filename = "${ddir}/build_depends.txt";
	open (my $df, ">${filename}") or die "Cannot open output file [$filename]: $!\n";
	print "\tOutput file [$filename] opened\n" if $debug;

	$filename = "${ddir}/why_depends.txt";
	open (my $wf, ">${filename}") or die "Cannot open output file [$filename]: $!\n";
	print "\tOutput file [$filename] opened\n" if $debug;


	my @files = `ls -1rt *.rw 2>/dev/null`;
	if ($#files==-1) {
		print "\tNo rw files found\n";
		return;
	}
	print "\t[$#files] ";
	print "\n" if $debug;

	foreach $filename (@files) {
		chomp $filename;
		if ($debug) {
			print ("\t$filename\n") ;
		} else {
			print ".";
		}

		my $pkg = $filename;
		$pkg =~ s/_BUILD2?\.rw$//;
		$pkg =~ s/_TEST2?\.rw$//;
		$pkg =~ s/_INSTALL2?\.rw$//;
		$pkg =~ s/\.rw$//;
		my %deps = ();

		open (my $f, "<${filename}") or die "Cannot open input file [$filename]: $!\n";

		my $skip=0;

		F: while (<$f>) {
			chomp;
			my ($rw, $path) = split(/\t/, $_, 2);
			# skip over malformed lines
			next unless $path;
			$path =~ s:^/opt/kaarpux/[^/]+/:/opt/:;
			next F if -d $path;
			#print "$path\n" if ! -e $path;
			foreach my $qr (@ignore) { next F if $path =~ $qr; }
			# skip over reading libraries in /bin/ldconfig
			if ($skip) {
				next F if ( ($rw eq "R") && ($path =~ m:/lib/:) );
				$skip=0;
			}
			if ($rw eq "W") {
				print $if "$path\t$pkg\n" if -e $path;
				$installed{$path} = $pkg;
			} elsif ($rw eq "D") {
				delete $installed{$path};
			} elsif ($rw eq "R") {
				my $dep = $installed{$path};
				if (!defined($dep)) {
					$dep="UNKNOWN";
					if ($pkg =~ /^bootstrap/) {
						$dep = ($path =~ m:^/tools: ? "TOOLS" : "HOST");
					}
				}
				if ($dep ne $pkg) {
					print $wf "$pkg\t$dep\t$path\n";
					print $df "$pkg\t$dep\n" unless $deps{$pkg."%".$dep};
					$deps{$pkg."%".$dep} = 1;
				}
				$skip = ($path eq "/bin/ldconfig");
			}
		}
		close($f);
	}

	print "\n" unless $debug;
	
	close($wf);
	close($df);
	close($if);
}


# ============================================================

my $ldd_warning_file;
my $ldd_depends = {};

sub process_ldd_file {

	my $err;

	my $fn = $File::Find::name;

	return unless (-f);

	unless (-x && -r) {
		$err = "INFO: skipping [$fn]: not readable or not executable\n";
		print $ldd_warning_file $err;
		if ($debug) {
			print "\n", $err;
		} else {
			print ":";
		}
		return;
	}

	$fn = Cwd::abs_path($fn) ;

	my $rc = open(my $fh, "<", $fn);
	unless ($rc) {
		$err = "WARNING: open [$fn] failed: $!";
		print $ldd_warning_file $err;
		if ($debug) {
			print $err;
		} else {
			print "O";
		}
		return;
	}

	my $magic;
	my $count = read($fh, $magic, 4);
	close($fh);
	unless ($magic eq "\x7fELF") {
		$err = "INFO: skipping [$fn]: not an ELF file\n";
		print $ldd_warning_file $err;
		print $ldd_warning_file `file $fn 2>&1`;
		if ($debug) {
			print $err;
		} else {
			print "-";
		}
		return;
	}

	my $pkg = $installed{$fn};
	unless ($pkg) {
		$err = "ERROR: who installed [$fn]?\n";
		print $ldd_warning_file $err;
		if ($debug) {
			print $err;
		} else {
			print "x";
		}
		return;
	}

	my @lines = `ldd $fn 2>&1`;
	if ($?) {
		$err = "WARNING: ldd failed for [$fn]: $?\n";
		print $ldd_warning_file $err;
		print $ldd_warning_file @lines;
		print $ldd_warning_file `file $fn 2>&1`;
		if ($debug) {
			print $err;
			print @lines;
		} else {
			print "?";
		}
		return;
	}

	if ($debug) {
		print "Processing [$fn]\n";
		print @lines;
	} else {
		print ".";
	}

	# At this point we should have
	# $fn = the path name of the file we are examining
	# @lines = output of ldd for that file
	# So here comes the real processing

	$ldd_depends->{$pkg} = {} unless $ldd_depends->{$pkg};
	for my $line (@lines) {
		next if ( $line =~ $linux_gate_pattern );
		next if ( $line =~ $ld_linux_pattern );
		next if ( $line =~ $ld_statically_linked_pattern );
		if ( $line =~ $notfound_pattern ) {
			$err = "ERROR [$fn]: $line";
			print $ldd_warning_file $err;
			if ($debug) {
				print $err;
			} else {
				print "*";
			}
		} elsif ( $line =~ $ldd_pattern ) {
			my $canon = Cwd::abs_path($1);
			my $pkg2 = $installed{$canon};
			unless ($pkg2) {
				$err = "ERROR: who installed [$canon] for [$fn] in [$pkg]?\n";
				print $ldd_warning_file $err;
				if ($debug) {
					print $err;
				} else {
					print "X";
				}
				return;
			}
			unless ($pkg eq $pkg2) {
			$ldd_depends->{$pkg}->{$pkg2} = 1;
			}
		} else {
			$err = "ERROR [$fn]: $line";
			print $ldd_warning_file $err;
			if ($debug) {
				print $err;
			} else {
				print "*";
			}
		}
	}

}


# ============================================================

sub process_ldd {
	print "Processing libraries\n";

	my $filename = "${ddir}/ldd_warnings.txt";
	open ($ldd_warning_file, ">${filename}") or die "Cannot open warning file [$filename]: $!\n";

	$ldd_depends = {};
	for my $dir (@dirs) {
		print "Processing [$dir]\n";
		find(\&process_ldd_file, ("$dir"));
		print "\n";
	}
	close($ldd_warning_file);

	$filename = "${ddir}/ldd_dependencies.txt";
	print "Listing ldd dependencies into [$filename]\n";
	open (my $f, ">${filename}") or die "Cannot open output file [$filename]: $!\n";
	print "\tOutput file [$filename] opened\n" if $debug;

	while ( my ($key, $value) = each(%$ldd_depends) ) {
		foreach (keys %$value) {
			print $f  "$key\t$_\n";
		}
	}
	close($f);

}


# ============================================================

sub parseArgs {
	GetOptions(
		"help|?" => \$help,
		"man" => \$man,
		"debug" => \$debug,
		"no-ldd" => \$no_ldd,
		) or pod2usage(64);
	pod2usage(-exitstatus => 0, -verbose => 1) if $help;
	pod2usage(-exitstatus => 0, -verbose => 2) if $man;
}


# ============================================================
# ============================================================


parseArgs;

print "Using directory [${fdir}] as input\n";
chdir($fdir);

print "Using directory [${ddir}] as output\n";
-d $ddir or mkdir($ddir);

process_build_times;
process_rw;
process_ldd unless $no_ldd;

print "Done\n";


# ============================================================
# ============================================================


__END__

=head1 NAME

kx_flist - Process list of packages installed by KaarPux

=head1 SYNOPSIS

B<kx_flist> [--debug] [--no-ldd]

B<kx_flist> --help | --man

=head1 DESCRIPTION

B<kx_flist> will process the F<flist> subdirectory.
The original contents of this directory was created
by systemtap during KaarPux installation,
if F<KX_SYSTEMTAP="yes"> was choosen.

Output files are created in the F<dependencies> subdirectory
(which is created if it does not exist).

B<kx_flist> will process F<flist/*.rw> files to 
create a table of files installed into F<files_installed.txt>.

B<kx_flist> will also detect dependencies between packages
and create F<build_dependencies.txt>.

For further information, the file F<why_depends.txt> is also created,
showing which file triggered a dependency.

Finally B<kx_flist> will process installed binaries and libraries,
and use B<ldd> to identify dependencies, which are written to
F<ldd_dependencies.txt>.

During the last step, errors, warnings, and info
is written to F<ldd_warnings.txt>.

Note that if you later intend to use F<kx_unused_packages>,
you should pass B<kx_flist> the B<--no-ldd> flag,
to avoid all library files being accessed.
B<kx_flist> can be run later without the B<--no-ldd> flag
to get the list of dependencies.

The files in the F<dependencies> subdirectory
can be further analyzed with B<kx_dependencies>

B<kx_flist> will also process the F<build.log> file,
and create a table of build times into F<build_times.txt>.

=head1 OPTIONS

=over 8

=item B<--no-ldd>

Do not identify dependencies with B<ldd>.

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

