#!/usr/bin/perl -w
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2013: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#
# See documentation at bottom of file


use strict;

use Getopt::Long;
use Pod::Usage;

use File::Basename;
use File::Spec;
#use File::Spec::Functions qw(rel2abs);
use Cwd qw(abs_path);

use YAML::Tiny;
use Sort::Versions;

use Data::Dumper;

use feature "switch";
no if $] >= 5.018, warnings => "experimental::smartmatch";

my $base_dir = dirname(abs_path(__FILE__));

my $man = 0;
my $help = 0;
my $debug = 0;

my $modulesets_directory = "./modulesets";
my $include_file = "";
my $exclude_file = "";
my @include_modules = ();
my @exclude_modules = ();
my $create_packages = 0;
my $packages_directory = "./packages";
my $rename_file = "";

my $renamings = {};

my $repo = {};
my $gnome_modules = {};
my $depends = {};
my $suggests = {};
my $system_modules = {};
my $meta_modules = {};

my $modules_to_keep = {};

my $kaarpux_packages = {};
my $kaarpux_packages_before = {};
my $kaarpux_packages_after = {};
my $kaarpux_packages_gnome = {};
my @needs_update = ();

# ============================================================

sub rename_module {
	my $from = shift;
	$renamings->{$from} // $from; #/
} 

# ============================================================

sub printModuleCounts {
	my $lead = shift;
	print STDERR "$lead\n";
	print STDERR "\t" . (keys $meta_modules) . "\tmeta-modules\n";
	print STDERR "\t" . (keys $gnome_modules) . "\tgnome-modules\n";
	print STDERR "\t" . (keys $depends) . "\tmodules with depends\n";
	print STDERR "\t" . (keys $suggests) . "\tmodules with suggests\n";
	print STDERR "\t" . (keys $system_modules) . "\tsystem-modules\n";
} 

# ============================================================

sub printDepends {
	my $lead = shift;
	my $hash = shift;
	print STDERR "$lead\n";
	while ( my ($key, $value) = each %{$hash} ) {
		my @a = @{$value};
		print STDERR "\t$key\t@a\n";
	}
} 



# ============================================================

sub keepModules {
	foreach (@_) {
#		print "KEEP $_\n";
		next if $_ ~~ @exclude_modules;
		$modules_to_keep->{$_} = 1;
		my $d=$depends->{$_};
		next if !$d;
		my @a=@{$d};
		foreach my $dep (@a) {
			keepModules($dep);
		}
	}
}

# ============================================================

sub removeKeys {
	my $hashref = shift;
	delete @{$hashref}{ @_ };
}


# ============================================================

sub removeUnwantedKeys {
	my $hashref = shift;
	my %mods;
	@mods { keys $hashref } = keys $hashref;
	delete @mods { @_ };
	delete @{$hashref} { (keys %mods) };
}


# ============================================================

sub removeUnwantedModules {
	print STDERR "Removing unwanted modules\n" if $debug;
	my $modules_to_keep = shift;
	removeUnwantedKeys($gnome_modules, keys $modules_to_keep);
	removeUnwantedKeys($system_modules, keys $modules_to_keep);
	removeUnwantedKeys($depends, keys $modules_to_keep);
	removeUnwantedKeys($suggests, keys $modules_to_keep);
	print STDERR "Done removing unwanted modules\n" if $debug;
	
}

# ============================================================

sub removeOneSysDep {
	(my $modules, my $deps) = @_;
	while ( my ($key, $value) = each %{$deps} ) {
		my %new;
		@new { @{$value} } = @{$value};
		delete @new { (keys $modules) };
		my $d = ();
		@{$d} = keys %new;
		$deps->{$key} = $d;
	}
}

# ============================================================

sub removeSystemDependencies {
	print STDERR "Removing system dependencies\n" if $debug;
	removeOneSysDep($system_modules, $depends);
	removeOneSysDep($system_modules, $suggests);
	print STDERR "Done removing system dependencies\n" if $debug;
}

# ============================================================

sub merge_kaarpux_packages {
	(my $kp, my $step) = @_;
	@{$kp}{keys $kaarpux_packages->{$step}} = values $kaarpux_packages->{$step};
}


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
	my @pkgs = grep { ! $meta_modules->{$_} } @afters;
	if (scalar(@pkgs)>0) {
		print "    - parallel:\n      - pkg: ";
		print join("\n      - pkg: ", @pkgs);
		print "\n";
	}
        delete @ba{@afters};
        delete @{$_}{@afters} for values %ba;
    }
 
    print !!%ba ? "*** *** Cycle found! ". join( ' ', keys %ba ). "\n\n" : "Topology OK\n\n";
}


# ============================================================

sub printSystemModules {
	(my $title, my $sm) = @_;
	print "${title}\n";
	while ( my ($pkg, $info) = each %{$sm} ) {
		print "\t$pkg\n";
	}
}

# ============================================================
sub readOneKaarPuxPackage {
	(my $step, my $pkg) = @_;
	$kaarpux_packages->{$step}->{$pkg}=1;
}


# ============================================================
# ============================================================
#         MAIN
# ============================================================
# ============================================================


# ============================================================
# PARSE ARGUMENTS

	GetOptions(
		"help|?" => \$help,
		"man" => \$man,
		"debug" => \$debug,
		"modulesets-directory=s" => \$modulesets_directory,
		"include-file=s" => \$include_file,
		"exclude-file=s" => \$exclude_file,
		"create-packages" => \$create_packages,
		"packages-directory=s" => \$packages_directory,
		"rename-file=s" => \$rename_file,
		) or pod2usage(64);

	pod2usage(-exitstatus => 0, -verbose => 99, -sections => "NAME|SYNOPSIS|OPTIONS") if $help;
	pod2usage(-exitstatus => 0, -verbose => 2) if $man;


# ============================================================
# PROCESS RENAMINGS
#
# Read rename file (each line should be "pkg-name-from pkg-name-to")

if (length($rename_file)<1) {
	print STDERR "Not reading any rename file\n" if $debug;
} else {

	print STDERR "Reading rename file [${rename_file}]\n" if $debug;
	open(my $f, "<${rename_file}") || die "*** *** Could not open rename file [${rename_file}]: $!\n";
	while (<$f>) {
		chomp;
		for ($_) {
			when (!length($_)) {}
			when (/^\s*(\S+)\s*(\S+)\s*$/) { $renamings->{$1} = $2; }
			default { die "*** *** Unrecognized renaming line: $_\n"; }
		}
	}
	close($f);
	print STDERR "Done reading rename file\n" if $debug;
}


# ============================================================
# PROCESS EXCLUDE
#
# Read exclude file

if (length($exclude_file)<1) {
	print STDERR "Not reading any exclude file\n" if $debug;
} else {

	print STDERR "Reading exclude file [${exclude_file}]\n" if $debug;
	open(my $f, "<${exclude_file}") || die "*** *** Could not open rename file [${exclude_file}]: $!\n";
	while (<$f>) {
		next if $_ =~ /^\s*$/;
		next if $_ =~ /^#/;
		$_ =~ s/^\s+|\s+$//g;
		push @exclude_modules, $_;
	}
	close($f);
	print STDERR "Done reading exclude file\n" if $debug;
}


# ============================================================
# PROCESS INCLUDE
#
# Read include file

if (length($include_file)<1) {
	print STDERR "Not reading any include file\n" if $debug;
} else {

	print STDERR "Reading include file [${include_file}]\n" if $debug;
	open(my $f, "<${include_file}") || die "*** *** Could not open rename file [${include_file}]: $!\n";
	while (<$f>) {
		next if $_ =~ /^\s*$/;
		next if $_ =~ /^#/;
		$_ =~ s/^\s+|\s+$//g;
		push @include_modules, $_;
	}
	close($f);
	print STDERR "Done reading include file\n" if $debug;
}


# ============================================================
# PROCESS GNOME MODULESETS WIHT XSLT
#
# Process each moduleset file with XSLT.
# Pipe the result to perl, and build global variables.

{
	print STDERR "Processing modulesets with XSLT\n" if $debug;
	die "Moduleset directory [${modulesets_directory}] not found" unless -d $modulesets_directory;
	while (<$modulesets_directory/*.modules>) {
		print STDERR "Processing [$_]\n" if $debug;
		open(my $f, "xsltproc $base_dir/gnome_modulesets.xslt $_ |") || die "*** *** XSLT failed: $!\n";
		while (<$f>) {
			chomp;
			for ($_) {
				when (/^\s*$/) {}
				when (/^REPO¤([^¤]+)¤([^¤]*)¤$/) { $repo->{$1} = $2; }
				when (/^SYSTEMMODULE¤([^¤]+)¤([^¤]*)¤$/) { $system_modules->{rename_module($1)} = $2; }
				when (/^METAMODULE¤([^¤]+)¤$/) { $meta_modules->{$1} = 1; }
				when (/^MODULE¤([^¤]+)¤([^¤]+)¤([^¤]+:)?([^¤]+)¤([^¤]+)¤([^¤]+)¤([^¤]+)¤([^¤]*)¤([^¤]*)¤$/) {
					$gnome_modules->{rename_module($1)} = {
						build=>$2,
						hash=>$4,
						module=>$5,
						repo=>($repo->{$6} // $6), #/
						version=>$7,
						autogenargs=>$8,
						makeargs=>$9
					}; }
				when (/^DEPENDENCY¤([^¤]+)¤([^¤]+)¤$/) { push @{$depends->{rename_module($1)}}, rename_module($2) }
				when (/^METADEP¤([^¤]+)¤([^¤]+)¤$/) { push @{$depends->{rename_module($1)}}, rename_module($2) }
				when (/^SUGGESTS¤([^¤]+)¤([^¤]+)¤$/) { push @{$suggests->{rename_module($1)}}, rename_module($2) }
				default { die "*** *** Unrecognized line: $_\n"; }
			}
		}
		close($f);
	}
	print STDERR "Done processing modulesets with XSLT\n" if $debug;
	printModuleCounts("All modules found in modulesets:") if $debug;

	printDepends("ALL Dependencies:", $depends) if $debug;
}


# ============================================================
# CALCULATE WHICH MODULES TO KEEP
#
# Find modules directly or indirectly referenced on commandline


	if (scalar(@ARGV)+scalar(@include_modules)<1) {
		die "*** *** Please specify metamodule(s) as argument(s) and/or modules with --include\n"
	}

	print STDERR "Calculating which modules to keep\n" if $debug;

	removeKeys($gnome_modules, @exclude_modules);
	removeKeys($system_modules, @exclude_modules);
	while ( my ($p, $d) = each $depends ) {
		@{$depends->{$p}} = grep { ! ($_ ~~ @exclude_modules) } @{$d};

	}

	foreach (@ARGV) {
		die "*** *** No metamodule [$_] found\n" unless $meta_modules->{$_};
		keepModules(@{$depends->{$_}});
	}
	foreach (@include_modules) {
		die "*** *** No module [$_] found\n" unless ($gnome_modules->{$_} || $system_modules->{$_});
	}
	keepModules(@include_modules);

	print STDERR "Done calculating which modules to keep\n" if $debug;
	print STDERR "Found " . (keys $modules_to_keep) . " modules to keep\n" if $debug;

	removeUnwantedModules($modules_to_keep);
	removeSystemDependencies();

	printModuleCounts("Modules referenced directly or indirectly on commandline:") if $debug;


# ============================================================
# MERGE SUGGESTIONS
#
# Add suggestions as dependencies, if dependent package already included

{
	print STDERR "Merging suggestions\n" if $debug;
	while ( my ($pkg, $slist) = each %{$suggests} ) {
		foreach	my $sug (@{$slist}) {
			if (!! ${modules_to_keep}->{$sug}) {
				if ( $pkg ~~ @{$depends->{$sug}} ) {
					print STDERR "\tDropping CIRCULAR [$sug] as suggestion for [$pkg]\n" if $debug;
				} else {
					print STDERR "\tAdding [$sug] as suggestion for [$pkg]\n" if $debug;
					push @{$depends->{$pkg}}, $sug;
				}
			} else {
				print STDERR "\tDropping [$sug] as suggestion for [$pkg]\n" if $debug;
			}
		}
	}
	$suggests = {};
	print STDERR "Done merging suggestions\n" if $debug;

	printModuleCounts("Modules referenced directly or indirectly on commandline, with suggestions merged in:") if $debug;

	printDepends("Dependencies:", $depends) if $debug;
	printSystemModules("All system modules:", $system_modules) if $debug;
}

# ============================================================
# SHOW PROPOSED INSTALLATION SEQUENCE
# Calculated by topological sort of dependencies

print "Proposed installation sequence:\n";
print_topo_sort(%{$depends});

# ============================================================
# PROCESS MODULE URL'S TO GIVE NICE INPUT TO KAARPUX PACKAGES

if ($create_packages) {
	print STDERR "Processing module URL's\n" if $debug;
	while ( my ($pkg, $info) = each %{$gnome_modules} ) {
		my $path=$info->{repo} . $info->{module};
		$info->{url}=dirname($path);
		$info->{file}=basename($path);
		if ($info->{url} =~ m|^http://download.gnome.org/sources/$pkg|) {
			$info->{F0}="  gnomexz: ~";
			$info->{F1}="";
		} else {
			$info->{F0}="  url: " . dirname($path);
			my $prefix = $pkg . "-" . $info->{version} . ".tar";
			if ($info->{file} =~ m|$prefix.xz|) {
				$info->{F1}="  file_tar_xz: ~";
			} elsif ($info->{file} =~ m|$prefix.bz2|) {
				$info->{F1}="  file_tar_bz2: ~";
			} elsif ($info->{file} =~ m|$prefix.gz|) {
				$info->{F1}="  file_tar_gz: ~";
			} else {
				$info->{F1}="  file: " . basename($path);
			}
		}
	}
	print STDERR "Done processing module URL's\n" if $debug;
}

# ============================================================
# CREATE KAARPUX PACKAGE FILES FOR GNOME MODULES

if (!$create_packages) {
	print STDERR "NOT generating KaarPux package files\n";
} else {

	print STDERR "Generating KaarPux package files\n" if $debug;

	my $pdir = (length($packages_directory)) ? $packages_directory :"./packages";
	print STDERR "Generating KaarPux package files in [$pdir]\n";
	mkdir $pdir unless -d $pdir;
	while ( my ($pkg, $info) = each %{$gnome_modules} ) {
		my $p = lc(substr($pkg,0,1));
		my $dir = $pdir . "/$p";
		mkdir $dir unless -d $dir;
		my $file = "${dir}/${pkg}.yaml";
		print STDERR "\t${file}\n" if $debug;
		open(my $f, ">${file}") || die "*** *** Could not open [$file]: $!\n";
		$info->{makeargs}="~" unless $info->{makeargs};
print $f <<"EOF";
package:
  name: $pkg
  version: $info->{version}

download:
$info->{F0}
$info->{F1}
  checksum: $info->{hash}

version:
  upstream_gnome_uneven: ~

linux:

  - build:
    - configure_kx: --disable-gtk-doc --disable-static --enable-man-pages $info->{autogenargs}
    - make: $info->{makeargs}

  - install:
    - install: ~
EOF
		close($f);
	}

if (0) {
	print "Gnome modules:\n";
	while ( my ($pkg, $info) = each %{$gnome_modules} ) {
		print "\t$pkg\n";
		print "\t\tversion $info->{version}\n";
		print "\t\tchecksum $info->{hash}\n";
		# print "\t\trepo $info->{repo}\n";
		# print "\t\tmodule $info->{module}\n";
		print "\t\turl $info->{url}\n";
		print "\t\tfile $info->{file}\n";
		print "\t\tF0 $info->{F0}\n" if $info->{F0};
		print "\t\tF1 $info->{F1}\n" if $info->{F1};
	}
}
	print STDERR "Done generating KaarPux package files\n" if $debug;
}


# ============================================================
# READ KAARPUX MASTER FILE
#
# Process KaarPux master.yaml
# Build $kaarpux_packages from the contents

{
	print STDERR "Processing KaarPux master\n" if $debug;
	my $file = "${base_dir}/../master.yaml";
	my $yaml = YAML::Tiny->read($file);
#	my @bootstrap = qw( bootstrap_7 bootstrap_8 );
#	my @linux = qw( linux_core linux_base linux_xorg );

	my $yaml0=$yaml->[0];
	foreach my $y (@{$yaml0}) {
		while ( my ($phase, $phase_def) = each %{$y} ) {
			foreach my $v (@{$phase_def}) {
				while ( my ($step, $step_def) = each %{$v} ) {
					print STDERR "\tProcessing step [$step]\n" if $debug;
					$kaarpux_packages->{$step} = {};
					foreach my $pp (@{$step_def}) {
						while ( my ($p, $pkg) = each %{$pp} ) {
							if ($p eq "pkg") { readOneKaarPuxPackage($step, $pkg); }
							if ($p eq "parallel") {
								foreach my $pp2 (@{$pkg}) {
									while ( my ($p2, $pkg2) = each %{$pp2} ) {
										if ($p2 eq "pkg") { readOneKaarPuxPackage($step, $pkg2); }

									}
								}
							}
						}
					}
				}
			}
		}
	}

	print STDERR "Done processing KaarPux master\n" if $debug;
	print STDERR "Merging KaarPux packages\n" if $debug;

	merge_kaarpux_packages($kaarpux_packages_before, 'bootstrap_3');
	merge_kaarpux_packages($kaarpux_packages_before, 'bootstrap_4');
	merge_kaarpux_packages($kaarpux_packages_before, 'bootstrap_5');
	merge_kaarpux_packages($kaarpux_packages_before, 'bootstrap_6');
	merge_kaarpux_packages($kaarpux_packages_before, 'bootstrap_7');
	merge_kaarpux_packages($kaarpux_packages_before, 'bootstrap_8');
	merge_kaarpux_packages($kaarpux_packages_before, 'linux_base');
	merge_kaarpux_packages($kaarpux_packages_before, 'linux_xorg');
	merge_kaarpux_packages($kaarpux_packages_before, 'linux_gnome_pre');

	merge_kaarpux_packages($kaarpux_packages_gnome, 'linux_gnome');

	merge_kaarpux_packages($kaarpux_packages_after, 'linux_gnome_post');
	merge_kaarpux_packages($kaarpux_packages_after, 'opt_desktop');
	merge_kaarpux_packages($kaarpux_packages_after, 'opt_libreoffice');
	merge_kaarpux_packages($kaarpux_packages_after, 'opt_programming');
	merge_kaarpux_packages($kaarpux_packages_after, 'opt_coins');
	merge_kaarpux_packages($kaarpux_packages_after, 'opt_closed_source');

	print STDERR "Done merging KaarPux packages\n" if $debug;
}




# ============================================================
# New packages in linux_gnome

{
	print STDERR "Checking for new packages in linux_gnome\n" if $debug;

	my $kaarpux_gnome_new = ();

	while ( my ($key, $value) = each %{$gnome_modules} ) {
		if (
			!($kaarpux_packages_before->{$key})
			&& !($kaarpux_packages_gnome->{$key})
			&& !($kaarpux_packages_after->{$key})
		) {
			$kaarpux_gnome_new->{$key}=1;
		}
	}

	print STDERR "Done checking for new packages in linux_gnome\n" if $debug;

	{
		my $n = 0 + (keys %{$kaarpux_gnome_new});
		if ($n==0) {
			print "NO new packages found in linux_gnome\n";
		} else {
			print "New packages in linux_gnome\n";
			foreach my $key (sort (keys %{$kaarpux_gnome_new} )) {
			print "\t$key\n";
			}
		}
	}

}





# ============================================================
# Packages found in linux_gnome which are actually NOT really gnome packages, but system dependencies.
# They neeed to be installed before linux_gnome

{
	print STDERR "Checking KaarPux packages in linux_gnome, which are actually NOT really GNOME packages, but system dependencies\n" if $debug;

	my $kaarpux_gnome_beginning = ();
	while ( my ($key, $value) = each %{$system_modules} ) {
		if ( !!($kaarpux_packages_gnome->{$key}) ) {
			print STDERR "\tKeep KaarPux package [$key] in linux_gnome is a system dependency\n" if $debug;
			$kaarpux_gnome_beginning->{$key}=1;
		}
	}

	print STDERR "Done checking KaarPux packages in linux_gnome, which are actually NOT really GNOME packages, but system dependencies\n" if $debug;

	{
		my $n = 0 + (keys %{$kaarpux_gnome_beginning});
		if ($n==0) {
			print "NO Packages found in linux_gnome which are actually NOT really gnome packages, but system dependencies\n";
		} else {
			print "Packages found in linux_gnome which are actually NOT really gnome packages, but system dependencies\n";
			print "They neeed to be installed before linux_gnome\n";
			foreach my $key (sort (keys %{$kaarpux_gnome_beginning} )) {
			print "\t$key\n";
			}
		}
	}

}


# ============================================================
# Packages found in linux_gnome, which have NOTHING to do with GNOME.
# They need to be installed somewhere else, if needed

{
	print STDERR "Checking KaarPux packages in linux_gnome, which will be dropped\n" if $debug;

	my $kaarpux_gnome_irrelevant = ();

	while ( my ($key, $value) = each %{$kaarpux_packages_gnome} ) {
		if ( !($modules_to_keep->{$key}) ) {
			print STDERR "\tKaarPux package [$key] in linux_gnome is irrelevant\n" if $debug;
			$kaarpux_gnome_irrelevant->{$key}=1;
		}
	}

	print STDERR "Done checking KaarPux packages in linux_gnome, which will be dropped\n" if $debug;

	{
		my $n = 0 + (keys %{$kaarpux_gnome_irrelevant});
		if ($n==0) {
			print "NO Packages found in linux_gnome, which will be dropped\n";
		} else {
			print "Packages found in linux_gnome, which will be dropped\n";
			print "They need to be installed somewhere else, if needed\n";
			foreach my $key (sort (keys %{$kaarpux_gnome_irrelevant} )) {
			print "\t$key\n";
			}
		}
	}

}


# ============================================================
# KaarPux packages before linux_gnome, which are really GNOME packages
# They need to be removed from before linux_gnome or from linux_gnome

{
	print STDERR "Checking KaarPux packages before linux_gnome, which are really GNOME packages\n" if $debug;

	my $kaarpux_gnome_really = ();

	while ( my ($key, $value) = each %{$kaarpux_packages_before} ) {
		if ( !!($gnome_modules->{$key}) ) {
			print STDERR "\tKaarPux package [$key] before linux_gnome is really GNOME\n" if $debug;
			$kaarpux_gnome_really->{$key}=1;
		}
	}

	print STDERR "Done checking KaarPux packages before linux_gnome, which are really GNOME packages\n" if $debug;

	{
		my $n = 0 + (keys %{$kaarpux_gnome_really});
		if ($n==0) {
			print "NO Packages found before linux_gnome, which are really GNOME packages\n";
		} else {
			print "Packages found before linux_gnome, which are really GNOME packages\n";
			print "They need to be removed from before linux_gnome or from linux_gnome\n";
			foreach my $key (sort (keys %{$kaarpux_gnome_really} )) {
			print "\t$key\n";
			}
		}
	}

}


# ============================================================
# KaarPux packages after linux_gnome, which are really GNOME packages
# They need to be removed from after linux_gnome or from linux_gnome

{
	print STDERR "Checking KaarPux packages after linux_gnome, which are really GNOME packages\n" if $debug;

	my $kaarpux_gnome_really = ();

	while ( my ($key, $value) = each %{$kaarpux_packages_after} ) {
		if ( !!($gnome_modules->{$key}) ) {
			print STDERR "\tKaarPux package [$key] after linux_gnome is really GNOME\n" if $debug;
			$kaarpux_gnome_really->{$key}=1;
		}
	}

	print STDERR "Done checking KaarPux packages after linux_gnome, which are really GNOME packages\n" if $debug;

	{
		my $n = 0 + (keys %{$kaarpux_gnome_really});
		if ($n==0) {
			print "NO Packages found after linux_gnome, which are really GNOME packages\n";
		} else {
			print "Packages found after linux_gnome, which are really GNOME packages\n";
			print "They need to be removed from after linux_gnome or from linux_gnome\n";
			foreach my $key (sort (keys %{$kaarpux_gnome_really} )) {
			print "\t$key\n";
			}
		}
	}

}



# ============================================================
# CHECK FOR Missing system dependencies

{
	print STDERR "Checking for missing system dependencies\n" if $debug;

	my $all = $kaarpux_packages_before;
	my $missing = { %$system_modules };
	@{$all}{keys $kaarpux_packages_gnome} = values $kaarpux_packages_gnome;

	removeKeys($missing, keys $all);
	removeKeys($system_modules, keys $missing);

	print STDERR "Done checking for missing system dependencies\n" if $debug;

	my $n = 0 + (keys $missing);
	if ($n==0) {
		print "No missing system dependencies found\n";
	} else {
		print "Missing system dependencies.\n";
		print "They need to be installed before linux_gnome\n";
		foreach my $key (sort (keys %{$missing} )) {
		my $value = %{$missing}{$key};
		print "\t$key $value\n";
		}
	}

}

# ============================================================
# CHECK FOR system dependencies needing updates

{
	print STDERR "Checking for outdated system dependencies\n" if $debug;
	while ( my ($key, $value) = each %{$system_modules} ) {
		print STDERR "\tCheck\t${key}\n" if $debug;
		if (!$value) {
			print STDERR "\t\t${key} NO_VERSION_INFO\n" if $debug;
			next;
		}
		my $p = lc(substr($key,0,1));
		my $file = "${base_dir}/../packages/${p}/${key}.yaml";
		my $yaml = YAML::Tiny->read($file) || die "*** *** Could not read [${file}]\n";
		my $version = $yaml->[0]->{"package"}->{"version"};
		my $ok = (versioncmp($version, $value)>=0);
		my $str = $ok ? "OK" : "NEEDS_UPDATE";
		print STDERR "\t\t${key} required=${value} kaarpux=${version} ${str}\n" if $debug;
		if (!$ok) { push @needs_update, $key; }
	}
	print STDERR "Done checking for outdated system dependencies\n" if $debug;

	my $n = 0 + @needs_update;
	if ($n==0) {
		print "No outdated system dependencies\n";
	} else {
		print "Outdated system dependencies, which need to be upgraded\n";
		foreach (@needs_update) { print "\t$_\n"; }
	}

}

exit 0;

# ============================================================
# ============================================================
#         DOCUMENTATION
# ============================================================
# ============================================================

__END__

=head1 NAME

kx_gnome - process gnome modules for KaarPux


=head1 SYNOPSIS

B<kx_gnome> [F<options>] F<metamodule>...

B<kx_gnome> --help | --man


=head1 DESCRIPTION

B<kx_gnome> will read all files in the F<modulesets> subdirectory
(or in the directory specified with B<--modulesets-directory>).

Those files are expected to be B<GNOME> module xml files,
which can be downloaded from e.g.
L<http://ftp.gnome.org/pub/GNOME/teams/releng/3.12.2/>

B<kx_gnome> will then extract dependency information for the metamodules
listed on the commandline (also including modules specified with
B<--include> and excluding modules specified with B<--exclude>)

Then a topological sort is performed, resulting in a proposed
installation sequence, which can be used in KaarPux's F<master.yaml>

If B<--create-packages> is specified, B<kx_gnome> will also generate
package files in the F<packages> subdirectory
(or in the directory specified with B<--packages-directory>).
Those can be merged into KaarPux's F<master/packages/*> directories.

Then B<kx_gnome> will read KaarPux's F<master.yaml> file,
as well as some of KaarPux's F<master/packages/?/*.yaml> package files,
and do the following checks:

=over 2

=item *
List new packages, which where not found in KaarPux before.

=item *
List packages found in linux_gnome which are actually NOT really gnome packages,
but system dependencies.
(They neeed to be installed before or in the beginning of linux_gnome).

=item *
List packages found in linux_gnome, which will be dropped.
(They need to be installed somewhere else, if needed).

=item *
List packages found before linux_gnome, which are really GNOME packages.
(They need to be removed from before linux_gnome or from linux_gnome).

=item *
List packages found after linux_gnome, which are really GNOME packages.
(They need to be removed from after linux_gnome or from linux_gnome).

=item *
List missing system dependencies.
(They need to be installed before linux_gnome).

=item *
List outdated system dependencies (which need to be upgraded).

=back 

Since GNOME and KaarPux may not agree on how to name system dependencies,
the B<--rename-file> option can be used for renaming.


=head1 OPTIONS

=over 8

=item B<--help>

Print help message and exit.

=item B<--man>

Print manual page and exit.

=item B<--debug>

Show supplementary progress and debug messages.


=item B<--modulesets-directory>=F<dir>

Process files in F<dir> instead of the default
F<modulesets> subdirectory


=item B<--include-file>=F<file>

Include modules listed in F<file> in addition to modules requred by the metamodules
specified on the commandline.


=item B<--exclude-file>=F<file>

Exclude modules listed F<file> in even if they are included in the metamodules
specified on the commandline.

=item B<--create-packages>

Create YAML package files in the F<packages> subdirectory
(or in the directory specified with B<--packages-directory>).


=item B<--packages-directory>=F<dir>

Create YAML package files in F<dir>, instead of in the defaut
F<packages> subdirectory.


=item B<--rename-file>=F<file>

Each line of F<file> must contain two package names separated by space.
The first package name should be the name under which GNOME knows 
the package, the second package name should be the name under which
KaarPux knows the package.

When processing system dependencies, B<kx_gnome> will rename matching
package names from the GNOME name to the KaarPux name.


=back

=head1 EXAMPLE

wget --directory-prefix=modulesets "ftp://ftp.gnome.org/pub/GNOME/teams/releng/3.12.2/*"

./kx_gnome.pl meta-gnome-core meta-gnome-devel-platform meta-gnome-apps-tested
--rename-file=gnome_rename.txt
--exclude-file=gnome_exclude.txt
--create-packages


=head1 AUTHOR

KaarPo v/Henrik Kaare Poulsen

=cut
