#!/usr/bin/perl -w
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2013-204: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

#
# Analyse KaarPux package dependencies
#
# See documentation at the bottom of this file,
# or run kx_dependencies --man
#

use strict;

use Getopt::Long;
use Pod::Usage;
use File::Basename;
use Cwd qw(abs_path);


# ============================================================
# GLOBALS
# ============================================================

# Globals set by command line options

my @original_args=@ARGV;
my $help = 0;
my $man = 0;
my $debug = 0;
my $dot = 0;
my $parallel = 0;
my $n_depends = 1;
my $n_required = 1;
my $ignore_bootstrap = -1;
my $merge_bootstrap = -1;
my @merge_files = ();
my $show_build = 1;
my $show_ldd = 1;
my $reduce = 0;
my $raw = 0;
my $regex = 0;
my $only_named = 0;


# The dependencies directory
my $ddir = abs_path( dirname(__FILE__) . "/../../dependencies" );


# PACKAGES TO INCLUDE
# hash(package_name -> 1)
my $packages = {};


# ALL PACKAGE NAMES TO MERGE
# hash(package_name -> merge_name)
my $merges = {};


# ALL DEPENDENCIES
# hash(package_name -> hash(package_name -> 1))
my $build_depends_on = {};
my $ldd_depends_on = {};
my $build_required_by = {};
my $ldd_required_by = {};


# REQUESTED DEPENDENCIES
# hash(package_name -> hash(package_name -> 1))
my $final_build_depends_on = {};
my $final_ldd_depends_on = {};
my $final_build_required_by = {};
my $final_ldd_required_by = {};


# ============================================================
# READ MERGE FILES
# ============================================================

sub read_merge_files {
	for my $fn (@merge_files) {
		open (my $f, $fn) or die "Cannot open file [$fn]: $!\n";
		my $tag = "UNKNOWN";
		while (<$f>) {
			chomp;
			if ( m|^\s+| ) { 
				s/^\s*(.*)\s*$/$1/;
				$merges->{$_} = $tag;
			} else {
				s/^\s*(.*)\s*$/$1/;
				$tag = $_;
			}
		}
		close($f);
	}
}


# ============================================================
# READ DEPENDENCY FILES
# ============================================================

sub read_depends {
	my ($fn, $depends_on, $required_by) = @_;
	open (my $f, $fn) or die "Cannot open file [$fn]: $!\n";
	while (<$f>) {
		chomp;
		my @from_to = split "\t";
		my $from = $from_to[0];
		my $to = $from_to[1];
		if ($ignore_bootstrap>0) {
			next if ($from =~ m/^bootstrap_[0-${ignore_bootstrap}]_/); 
			next if ($to =~ m/^bootstrap_[0-${ignore_bootstrap}]_/); 
		}
		if ($merge_bootstrap>0) {
			my $tag = $merge_bootstrap>=8
				? "BOOTSTRAP"
				: "BOOSTRAP-1-${merge_bootstrap}";
		        $from =~ s|^bootstrap_[0-${merge_bootstrap}]_.*|${tag}|;
		        $to =~ s|^bootstrap_[0-${merge_bootstrap}]_.*|${tag}|;
		}
		unless ($raw) {
                        $from =~ s|^linux_||;
                        $from =~ s|^opt_||;
                        $from =~ s|^bootstrap_[0-9]_||;
                        $to =~ s|^linux_||;
                        $to =~ s|^opt_||;
                        $to =~ s|^bootstrap_[0-9]_||;
		}

		my $f = $merges->{$from}; $from=$f if $f;
		my $t = $merges->{$to}; $to=$t if $t;

		$depends_on->{$from} = {} unless $depends_on->{$from};
		$required_by->{$to} = {} unless $required_by->{$to};
		$depends_on->{$from}->{$to} = 1 unless ($from eq $to);
		$required_by->{$to}->{$from} = 1 unless ($from eq $to);
	}

}


# ============================================================
# PROCESS PACKAGES ON COMMAND-LINE 
# ============================================================

sub process_cmdline_packages {
	if ($regex) {
		for my $arg (@ARGV) {
			my @args = ();
			push(@args, grep {/$arg/} keys %$build_depends_on);
			push(@args, grep {/$arg/} keys %$build_required_by);
			push(@args, grep {/$arg/} keys %$ldd_depends_on);
			push(@args, grep {/$arg/} keys %$ldd_required_by);
			die "No package matching [$arg]" unless @args;
			for my $arg (@args) { $packages->{$arg}=1; }
		}
	} else {
		for my $arg (@ARGV) {
			if (
				! $build_depends_on->{$arg} &&
				! $build_required_by->{$arg} &&
				! $ldd_depends_on->{$arg} &&
				! $ldd_required_by->{$arg}
			) {
				die "No such package: [$arg]";
			}
			$packages->{$arg}=1;
		}
	}
}


# ============================================================
# PROCESS DEPENDS-ON OR REQUIRED-BY
# ============================================================

sub mark_deps {
	my ($base, $final, $pkg, $n) = @_;
	$final->{$pkg} = $base->{$pkg};
	return if $n<=1;
	for my $p (keys %{$base->{$pkg}}) {
		next if defined $final->{$p};
		mark_deps($base, $final, $p, $n-1);
	}
}	

sub find_deps {
	my ($pkg, $n, $reverse) = @_;
	print STDERR "Finding dependencies: pkg=[$pkg] n=[$n] reverse=[$reverse]\n" if $debug;
	my $base_build = $reverse ? $build_required_by : $build_depends_on;
	my $final_build = $reverse ? $final_build_required_by : $final_build_depends_on;
	my $base_ldd =  $reverse ? $ldd_required_by : $ldd_depends_on;
	my $final_ldd =  $reverse ? $final_ldd_required_by : $final_ldd_depends_on;
	mark_deps($base_build, $final_build, $pkg, $n);
	mark_deps($base_ldd, $final_ldd, $pkg, $n);
}

sub merge_required_into_depends {
	my ($required, $depends) = @_;
	while ( my ($pkg, $req) = each($required)) {
		for my $p (keys %$req) {
			unless ( $depends->{$p} ) { $depends->{$p} = {}; }
			$depends->{$p}->{$pkg}=1;
		}
	}
}


# ============================================================
# REMOVE UNWANTED DEPENDENCIES
# ============================================================

sub remove_unwanted {
	my ($depends, $packages) = @_;
	while ( my ($pkg, $dep) = each($depends)) {
		delete $depends->{$pkg} unless defined $packages->{$pkg};
		for my $p (keys %$dep) {
			delete $dep->{$p} unless defined $packages->{$p};
		}
	}
}


# ============================================================
# TRANSITIVE REDUCTION
# ============================================================

sub transitive_reduction {
	# See e.g. http://www.researchgate.net/profile/David_Gries/publication/220131718_An_Algorithm_for_Transitive_Reduction_of_an_Acyclic_Graph/file/3deec52b37074cf850.pdf
	my ($d) = @_;
	# Transitive closure
	# (as transitive reduction algorithm only works on closed graph)
	foreach my $k (keys $d) {
		foreach my $i (keys $d) {
			if ($d->{$i}->{$k}) {
				foreach my $j (keys $d) {
					$d->{$i}->{$j}=1 if ($d->{$k}->{$j});
	}	}	}	}
	# Transitive reduction
	foreach my $k (keys $d) {
		foreach my $i (keys $d) {
			if ($d->{$i}->{$k}) {
				foreach my $j (keys $d) {
					delete $d->{$i}->{$j} if ($d->{$k}->{$j});
	}	}	}	}
}


# ============================================================
# TOPOLOGICAL SORT: WHICH PACKAGES CAN BE BUILD IN PARALLEL
# ============================================================

sub print_topo_sort {
    my %deps = @_;
 
    my %ba;
    while ( my ( $before, $afters_aref ) = each %deps ) {
        for my $after ( @{ $afters_aref } ) {
            $ba{$before}{$after} = 1 if $before ne $after;
            $ba{$after} ||= {};
        }
    }
 
    while ( my @afters = sort grep { ! %{ $ba{$_} } } keys %ba ) {
        print "@afters\n";
        delete @ba{@afters};
        delete @{$_}{@afters} for values %ba;
    }
 
    print !!%ba ? "Cycle found! ". join( ' ', sort keys %ba ). "\n" : "---\n";
}

# ============================================================
# PRINT DEPENDENCY ARROW
# ============================================================

sub print_arrow {
	my ($hash, $arrow) = @_;	
	while ( my ($key, $value) = each($hash)) {
		for my $dep (keys %$value) {
			print "$key\t$arrow\t$dep\n";
		}
	}
}


# ============================================================
# PRINT DEPENDENCY IN GRAPHVIZ DOT FORMAT
# ============================================================

sub print_dot {
	my ($hash, $properties) = @_;	
	while ( my ($key, $value) = each($hash)) {
		for my $dep (keys %$value) {
			print qq("$key" -> "$dep" $properties\n);

		}
	}
}


# ============================================================
# PRINT DEPENDENCIES
# ============================================================

sub print_dependencies {
	if ($dot) {
		print "digraph dependencies {\n";
		print "rankdir=LR\n";
		print "node [shape=box fontname=Helvetica];\n";
		print_dot($final_build_depends_on, "[color=blue]");
		print_dot($final_ldd_depends_on, "[color=red]");
		for my $p (keys $packages) {
			print qq("$p" [ style=filled fillcolor=lightgray ]\n);
		}

		print qq("legend-package" [ style=filled fillcolor=lightgray label="p" ]\n);
		print qq("legend-pre" [ style=filled fillcolor=lightgray label="this depends on p" ]\n);
		print qq("legend-post" [ style=filled fillcolor=lightgray label="p depends on this" ]\n);
		print qq("legend-pre" -> "legend-package" [ color=red label="ldd" ]\n);
		print qq("legend-package" -> "legend-post" [ color=blue label="build" ]\n);
		print qq(label="kx_dependencies @original_args"\n);
	 
		print "}\n";
		print "// You probably want to process this output with graphviz' dot tool.\n";
		print "// Try a shell pipeline like \n";
		print "// kx_dependencies [arguments] | dot -Tsvg > dep.svg\n";

	} else {
		print_arrow($final_build_depends_on, "--BUILD-->");
		print_arrow($final_ldd_depends_on, "---LDD--->");
	}
}



# ============================================================
# ============================================================
# MAIN
# ============================================================


# PARSE COMMAND-LINE OPTIONS

GetOptions(
	"help|?" => \$help,
	"man" => \$man,
	"debug" => \$debug,
	"dot" => \$dot,
	"parallel" => \$parallel,
	"n-depends-on=i" => \$n_depends,
	"n-required-by=i" => \$n_required,
	"ignore-bootstrap=i" => \$ignore_bootstrap,
	"merge-bootstrap=i" => \$merge_bootstrap,
	"merge-file=s" => \@merge_files,
	"show-build!" => \$show_build,
	"show-ldd!" => \$show_ldd,
	"reduce" => \$reduce,
	"raw" => \$raw,
	"regex" => \$regex,
	"only-named" => \$only_named,
	) or pod2usage(64);

$only_named=1 if $parallel;

pod2usage(-exitstatus => 0, -verbose => 99, -sections => "NAME|SYNOPSIS|OPTIONS") if $help;
pod2usage(-exitstatus => 0, -verbose => 2) if $man;

if ( $#ARGV < 0 ) {
	die "Please specify packages to process";
}

read_merge_files();


# READ DEPENDENCIES

print STDERR "Reading dependencies\n" if $debug;

read_depends("${ddir}/build_depends.txt", $build_depends_on, $build_required_by) if ($show_build);
read_depends("${ddir}/ldd_dependencies.txt", $ldd_depends_on, $ldd_required_by) if ($show_ldd);


# PROCESS PACKAGES ON COMMAND-LINE

process_cmdline_packages;

if ($debug) {
	my $n = keys %$packages;
	print STDERR "Processing [$n] packages:\n";
	print STDERR join(' ', keys %$packages);
	print STDERR "\n";
}


# CALCULATE DEPENDENCIES

if ($n_depends>0) { for my $p (keys %$packages) { find_deps($p, $n_depends, 0); } }
if ($n_required>0) { for my $p (keys %$packages) { find_deps($p, $n_required, 1); } }
merge_required_into_depends($final_ldd_required_by, $final_ldd_depends_on);
merge_required_into_depends($final_build_required_by, $final_build_depends_on);


# TRANSITIVE REDUCTION

if ($reduce) {
	transitive_reduction($final_ldd_depends_on);
	transitive_reduction($final_build_depends_on);
}

# REMOVE UNWANTED DEPENDENCIES

if ($only_named) {
	remove_unwanted($final_ldd_depends_on, $packages) ;#unless ($parallel);
	remove_unwanted($final_build_depends_on, $packages);
}


# PRINT DEPENDENCIES

if ($parallel) {
	my %topo = ();
	while ( my ($key, $value) = each($final_build_depends_on)) {
		@{$topo{$key}} = keys %$value;
	}
	while ( my ($key, $value) = each($final_ldd_depends_on)) {
		$topo{$key} = () unless defined $topo{$key};
		push(@{$topo{$key}}, keys %$value);
	}
	print_topo_sort(%topo);
} else {
	print_dependencies();
}


# ============================================================
# ============================================================
# DOCUMENTATION
# ============================================================

__END__


=head1 NAME

kx_dependencies - analyse KaarPux package dependencies


=head1 SYNOPSIS

B<kx_dependencies> [F<option>-...] [F<package_name>...]

B<kx_dependencies> --help | --man


=head1 DESCRIPTION

B<kx_dependencies> lists packages which the packages on the 
command-line are dependent-on or required-by.


=head1 OPTIONS

=over 8


=item B<--help>

Print help message and exit.


=item B<--man>

Print manual page and exit.


=item B<--debug>

Show debug messages while processing.


=item B<--n-depends-on>=B<n>

Show packages which the packages on the command line depends on 
recursively to the B<n>'th level.

Default: B<n>=1


=item B<--n-required-by>=B<n>

Show packages which the packages on the command line are required by 
recursively to the B<n>'th level.

Default: B<n>=1


=item B<--ignore-bootstrap>=B<n>

Do not show packages belonging to bootstrap phases less than the
specified level.

Default: Do not ignore any bootstrap phases


=item B<--merge-bootstrap>=B<n>

Do not show packages belonging to bootstrap phases less than the
specified level inidvidually, but instead show them as one
dependency.

Default: Do not merge any bootstrap phases


=item B<--merge-file>=F<filename>

Merge packages specified in F<filename>.
See below for syntax of the file.


=item B<--raw>

Prefix package names with the phase in which it was created
(e.g. bootstrap_8_acl or linux_totem).

This applies both to the package names in the output and
to the [F<package_name>...] on the command-line.


=item B<--regex>

Interpret each [F<package_name>...] on the command-line
as a perl regular expression.
See L<http://perldoc.perl.org/perlre.html>.


=item B<--only-named>

Normally, B<kx_dependencies> will process each
each [F<package_name>...] on the command-line
but include all requested dependencies in the output.

If B<--only_named> is specified,
the dependency graph will be limited to only
the packages specified
with [F<package_name>...] on the command-line.


=item B<--reduce>

Do a transitive reduce on the resulting graph, i.e.
if A depends on B, B depends on C, and a A depends on C,
do not show A depends on C.


=item B<--show-build>

Show build dependencies.
B<--show-build> is true by default,
so to hide build dependencies, specify
B<--noshow-build>


=item B<--show-ldd>

Show link-time dependencies.
B<--show-ldd> is true by default,
so to hide link-time dependencies, specify
B<--noshow-ldd>


=item B<--dot>

Create output in GraphWiz dot format.


=item B<--parallel>

Instead of creating a dependency graph,
do a topological sort to show which packages
can be build in parallel.

Each output line lists a number of packages 
which can be build in parallel,
assuming that the packages on lines above have
already been build.


=back


=head1 OVERVIEW

B<kx_dependencies> lists packages which the packages on the 
command-line are dependent-on or required-by.

The dependencies are collected from the files in the
F<dependencies> directory, which should be created on beforehand
with the command B<kx_flist>.

B<kx_dependencies> lists both build time dependencies
(if B<KaarPux> was build with KX_SYSTEMTAP="yes")
and link time dependencies
(collected with the B<ldd> command by B<kx_flist>).


=head1 MERGE FILE

The merge file(s) specified with B<--merge-file> have the following
syntax:

A line B<not> prefixed with blanks is interpreted as a B<merge_name>.

Other lines are interpreted as a B<package_name>.

Every time B<kx_dependencies> processes a B<package_name>,
which matches a B<package_name> in the B<--merge-file>,
the name of the package will be replaced by the preceding
B<merge_name>.

See L<http://kaarpux.kaarposoft.dk/dependency_tracking.html> for examples.


=head1 BUGS

B<kx_dependencies> uses the output of B<kx_flist>, so it can only be
accurate to the level that B<kx_flist> is.

In particular, B<kx_flist> uses the B<ldd> command to collect run-time 
dependencies. Other run-time dependencies exist as well,
but those are not collected.


=head1 AUTHOR

KaarPo v/Henrik Kaare Poulsen


=head1 SEE

L<http://kaarpux.kaarposoft.dk>

=cut

