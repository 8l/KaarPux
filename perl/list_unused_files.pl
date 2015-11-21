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
use File::Basename;
use File::Spec;
use Cwd;

my $kaarpux=Cwd::abs_path(File::Spec->catdir(File::Spec->catdir(dirname(__FILE__), File::Spec->updir()), File::Spec->updir()));

# ============================================================

sub process_packages {
	my ($package_dir) = @_;
	my $n = 0;

	chdir("$package_dir");
	foreach my $filedir (<[a-z]/*.files>) {
		print("Processing $filedir\n");
		my $yaml = $filedir;
		$yaml =~ s/\.files$/\.yaml/;
		if (! -r $yaml) {
			print "*** *** Apparently unused directory: [$filedir]\n";
			$n++;
			next;
		}
		foreach my $file (<$filedir/*>) {
			my $f = basename($file);
			my $ok = 0;
			my $rc = open (MYFILE, $yaml);
			while (<MYFILE>) { 
				next unless m/$f/;
				$ok = 1
			}
			close (MYFILE); 
			if (!$ok) {
				print "*** *** Apparently unused file: [$file]\n";
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
my $package_dir = File::Spec->catdir($master, "packages");
print "Processing package support files in [$package_dir]...\n";
my $n = process_packages($package_dir);
print "Found [$n] unused package support files / directories in [$package_dir].\n";

