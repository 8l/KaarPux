#!/usr/bin/perl -w
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2012: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

use strict;

use DB_File;
use File::Find;
use File::Spec;
use Cwd;
use Getopt::Long;
use Pod::Usage;

my $help = 0;
my $man = 0;
my $debug = 0;
my $reverse = 0;
my $regex = 0;
my $dot = 0;

my $db;
my %db_hash;

my $rev_db;
my %rev_db_hash;

# ============================================================
# DIRECTORIES TO SEARCH
# ============================================================

my @dirs = (
	'/bin', '/lib', '/libexec',
	'/usr/local/bin', '/usr/local/lib',
	'/usr/local/libexec', '/opt/bin', '/opt/lib', '/opt/libexec' );


# ============================================================
# LDD PATTERNS
# ============================================================

# http://linux.die.net/man/1/ldd
my $ldd_pattern = qr|^\s*\S+ => (\S+) \(0x[a-f0-9]+\)$|;
my $notfound_pattern = qr|^\s*(\S+) => not found$|;

# http://www.trilithium.com/johan/2005/08/linux-gate/
my $linux_gate_pattern = qr:^\s*linux-(gate)|(vdso)\.so:;

# http://www.cs.virginia.edu/~dww4s/articles/ld_linux.html
my $ld_linux_pattern = qr|^\s*\S*ld-linux\S*\.so|;

my $ld_statically_linked_pattern = qr|^\s*statically linked$|;


# ============================================================
# POPULATE DATABASES
# ============================================================

sub process_file {

	my $fn = $File::Find::name;

	return unless (-f);

	unless (-x && -r) {
		if ($debug) {
			print "*** skipping [$fn]: not readable or not executable\n";
		} else {
			print ":";
		}
		return;
	}

	$fn = Cwd::abs_path($fn) ;

	return if $db_hash{$fn};

	my $rc = open(my $fh, "<", $fn);
	unless ($rc) {
		print "*** open [$fn] failed: $!";
		return;
	}

	my $magic;
	my $count = read($fh, $magic, 4);
	close($fh);
	unless ($magic eq "\x7fELF") {
		if ($debug) {
			print "*** skipping [$fn]: not an ELF file\n";
		} else {
			print "-";
		}
		return;
	}

	my @lines = `ldd $fn 2>&1`;
	if ($?) {
		if ($debug) {
			print "*** ldd failed for [$fn]: $?\n";
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

	for my $line (@lines) {
		next if ( $line =~ $linux_gate_pattern );
		next if ( $line =~ $ld_linux_pattern );
		next if ( $line =~ $ld_statically_linked_pattern );
		if ( $line =~ $notfound_pattern ) {
			unless ($debug) { print "\n"; }
			print "*** [$fn]: $line";
			$db_hash{$fn} = $1;
			$rev_db_hash{$1} = $fn;
		} elsif ( $line =~ $ldd_pattern ) {
			my $canon = Cwd::abs_path($1);
			$db_hash{$fn} = $canon;
			$rev_db_hash{$canon} = $fn;
		} else {
			unless ($debug) { print "\n"; }
			print "*** [$fn]: $line";
		}
	}
}

sub populate_db {
	print "Creating databases\n";
	for my $dir (@dirs) {
		print "Processing [$dir]\n";
		find(\&process_file, ($dir));
		print "\n";
	}
	print "Databases have been created\n";
}


# ============================================================
# GET DEPENDENCIES
# ============================================================

sub add_deps {
	my ($db, $deps, $lib) = @_;
	my @to_list = $db->get_dup($lib);
	return unless @to_list;
	$deps->{$lib} = \@to_list;
	for my $to (@to_list) {
		add_deps($db, $deps, $to) unless $deps->{$to};
	}
}

sub get_deps {
	my ($db, $args) = @_;
	my %deps = ();
	for my $lib (@$args) {
		add_deps($db, \%deps, $lib);
	}
	unless (keys %deps) {
		print "*** No ELF dependencies found\n";
		exit 1;
	}
	return %deps;
}


# ============================================================
# PRINT DEPENDENCIES
# ============================================================

sub print_deps {
	my ($deps, $args, $dir) = @_;
	for my $lib (@$args) {
		for my $to (@{$deps->{$lib}}) { print "$lib $dir $to\n"; }
	}
	#print "==========\n";
	my @keys = (keys %$deps);
	my %rest;
	@rest{ @keys } = @keys;
	delete @rest{ @$args };
	for my $lib (keys %rest) {
		for my $to (@{$deps->{$lib}}) { print "$lib $dir $to\n"; }
	}
}

sub print_dot {
	my ($deps, $args, $rev) = @_;
	print "digraph LDD {\n";
	print "node [shape=box fontname=Helvetica];\n";
	for my $node (@$args) {
		print qq("$node" [ style=filled fillcolor=lightgray ]\n);
	}
	my %nodes = ();
	@nodes{ keys %$deps } = keys %$deps;
	for my $v (values %$deps) {
		@nodes{ @$v } = @$v;
	}
	for my $node (keys %nodes) {
		my $fill= ($node =~ m|^/|) ? "" : "style=filled fillcolor=lightsalmon";
		my ($volume,$directories,$file) = File::Spec->splitpath( $node );
		my $shape = ($node =~ m|/s?bin/|) ? "shape=ellipse" : "";
		print qq("$node" [ label="$file" $shape $fill];\n);
	}
	for my $lib (keys %$deps) {
		for my $to (@{$deps->{$lib}}) { 
			$rev? print qq("$to" -> "$lib"\n) : print qq("$lib" -> "$to";\n);
		}
	}
	print "}\n";
}


# ************************************************************
# MAIN
# ************************************************************


# ============================================================
# PARSE ARGUMENTS
# ============================================================

GetOptions(
	"help|?" => \$help,
	"man" => \$man,
	"debug" => \$debug,
	"reverse" => \$reverse,
	"regex" => \$regex,
	"dot" => \$dot,
	) or pod2usage(64);
pod2usage(-exitstatus => 0, -verbose => 1) if $help;
pod2usage(-exitstatus => 0, -verbose => 2) if $man;


# ============================================================
# OPEN DATABASES
# ============================================================

$DB_BTREE->{'flags'} = R_DUP;

$db = tie %db_hash, "DB_File", "ldd.db", O_RDWR|O_CREAT, 0666, $DB_BTREE or die "Cannot open [ldd.db]: $!\n";
$rev_db = tie %rev_db_hash, "DB_File", "ldd_rev.db", O_RDWR|O_CREAT, 0666, $DB_BTREE or die "Cannot open [ldd_rev.db]: $!\n";

if (scalar keys %db_hash == 0) { populate_db(); }

if ( $#ARGV < 0 ) {
	print("Database [ldd.db] has " . (scalar keys %db_hash) . " entries\n");
	system("ls -lh ldd.db");
	print("Database [ldd_rev.db] has " . (scalar keys %rev_db_hash) . " entries\n");
	system("ls -lh ldd_rev.db");
} else {

	# ============================================================
	# MAIN PROCESSING
	# ============================================================

	my $mydb = $reverse ? $rev_db : $db; 
	my %mydb_hash = $reverse ? %rev_db_hash : %db_hash; 
	my @args;
	if ($regex) {
		for my $arg (@ARGV) {
			push(@args, grep {/$arg/} keys %mydb_hash);
		}
		unless (@args) {
			print "*** No matching ELF files found\n";
			exit 1;
		}
	} else {
		for my $arg (@ARGV) {
			push(@args, Cwd::abs_path($arg));
		}
		unless (@args) {
			print "*** No such files found\n";
			exit 1;
		}
	}
	#print "ARGS: @args\n";
	my %deps = get_deps($mydb, \@args);
	if ($dot) {
		print_dot(\%deps, \@args, $reverse);
	} else {
		my $dir = $reverse ? "<=" : "=>";
		print_deps(\%deps, \@args, $dir);
	}
}


# ============================================================
# CLOSE DATABASES
# ============================================================

undef $db;
untie %db_hash;

undef $rev_db;
untie %rev_db_hash;


# ************************************************************
# DOCUMENTATION
# ************************************************************

__END__


=head1 NAME

kx_ldd - analyse ELF file dependencies

=head1 SYNOPSIS

B<kx_ldd> [F<options>] [F<filename>...]

B<kx_ldd> --help | --man


=head1 DESCRIPTION

B<kx_ldd> lists dependencies between ELF executables and libraries.


=head1 OPTIONS

=over 8

=item B<--help>

Print help message and exit.

=item B<--man>

Print manual page and exit.

=item B<--debug>

Show debug messages while processing.

=item B<--reverse>

Show binaries / executables which need (are dependent on)
[F<filename>...].

=item B<--regex>

Interpret each [F<filename>...] as a perl regex.

=item B<--dot>

Create output in GraphWiz dot format.

=back


=head1 OVERVIEW

B<kx_ldd> will list the ELF libraries on which the [F<filename>...]
depends. (This is similar to the Linux B<ldd> command, although
absolute, resolved path names will be shown).

Then B<kx_ldd> will recursively list dependencies for those libraries.

If B<--reverse> is specified, B<kx_ldd> will list the libraries and
binaries which need (are dependent on) [F<filename>...].

Then B<kx_ldd> will recursively list dependent libraries and binaries.


=head1 RESOLVING DEPENDENCIES

B<kx_ldd> uses the Linux B<ldd> command to resolve dependencies.


=head1 INITIALIZATION

When B<kx_ldd> is run, it first creates two databases in the current
working directory: F<ldd.db> and F<ldd_rev.db>.

On subsequent runs, if the databases are found in the current working
directory they will not be recreated.

The two databases will contain forward and reverse dependencies.

The databases are created by traversing a number of standard locations
for ELF binaries and libraries.


=head1 PATH NAMES

ELF files contain references to ELF libraries. Those references
are resolved into path names. If the path points to a symbolic link,
B<kx_ldd> will recursively follow the symbolic link until it finds
a regular file. The name of this regular file will be used by B<kx_ldd>.
All pathnames in B<kx_ldd> are absolute (except for unresolved
references; see below).

This means, that the [F<filename>...] specified on the command line
when B<--regex> is specified must refer to the resolved regular file.

When B<--regex> is not specified, B<kx_ldd> will try to resolve
the given [F<filename>...] to regular files.


=head1 UNRESOLVED REFERENCES

References which can not be resolved by the Linux B<ldd> command
(i.e. B<ldd> returns "not found") are stored in the databases
using the relative path name, i.e. usually just the filename.

For B<--dot> output, the nodes corresponding to unresolved references
are marked in red.


=head1 EXAMPLES

Which libraries does B<awk> depend on?
B<./kx_ldd.pl $(which awk)>

Which libraries are using B<libpulse>?
B<./kx_ldd.pl -reverse -regex '^/lib/libpulse'>


=head1 AUTHOR

KaarPo v/Henrik Kaare Poulsen


=head1 SEE

L<http://kaarpux.kaarposoft.dk>

=cut

