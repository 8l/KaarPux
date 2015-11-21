#!/usr/bin/perl -w
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2012: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

# my $debug=1;

use strict;
use YAML::Tiny;
use File::Basename;
use File::Spec;
use Cwd;

my $kaarpux=Cwd::abs_path(File::Spec->catdir(File::Spec->catdir(dirname(__FILE__), File::Spec->updir()), File::Spec->updir()));

# ============================================================

sub process_master {
	my ($groups) = @_;
	my %packages = ();
	$packages { 'perl_modules' } = 1 ;
	foreach my $phases (@$groups) {
		while ( my ($s, $steps) = each(%$phases) ) {
			foreach my $step (@$steps) {
				while ( my ($a, $alist) = each(%$step) ) {
					foreach my $action (@$alist) {
						my $parallel = $action->{'parallel'};
						if (!!$parallel) {
							foreach my $action (@$parallel) {
								my $pkg = $action->{'pkg'};
								$packages {$pkg} = 1 if (defined $pkg);
								$pkg = $action->{'xorg_pkg'};
								$packages {$pkg} = 1 if (defined $pkg);
							}
						} else {
							my $pkg = $action->{'pkg'};
							$packages {$pkg} = 1 if (defined $pkg);
							$pkg = $action->{'xorg_pkg'};
							$packages {$pkg} = 1 if (defined $pkg);
						}
					}
				}
			}
		}
	}
	return %packages;
}

# ============================================================

sub process_packages {
	my ($master_packages, $package_dir) = @_;
	my $n = 0;
	foreach my $dir ("a".."z") {
		chdir("$package_dir/$dir");
		foreach my $file (<*.yaml>) {
			$file =~ s/\.yaml//;
			if ( ! $master_packages->{$file} ) {
				print "Apparently unused package: [$file]\n";
				$n++;
			}
		}
	}
	return $n;
}


# ============================================================

my $top = $kaarpux;
if ($#ARGV>-1) { $top = $ARGV[0]; }

my $master = File::Spec->catdir($top, "master");
my $file = File::Spec->catfile($master, "master.yaml");
my $yaml = YAML::Tiny->read($file) || die "*** Could not read YAML file [$file]: [" . YAML::Tiny->errstr . "]: [" . $! . "]\n";
my $yaml0=$yaml->[0];

print "Processing [$file]...\n";
my %master_packages = process_master($yaml0);
print "Found [" . keys( %master_packages ) . "] packages in [$file].\n";

my $package_dir = File::Spec->catdir($master, "packages");
print "Processing yaml package files in [$package_dir]...\n";
my $n = process_packages(\%master_packages, $package_dir);
print "Found [$n] unused yaml package files in [$package_dir].\n";

