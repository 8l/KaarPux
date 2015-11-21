#!/usr/bin/perl -w
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2012-2013: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

print "\nKAARPUX: Updating /opt\n\n";

use strict;
use Cwd;
use File::Find;

my $debug=0;

my @subdirs = ("bin", "etc", "include", "lib", "libexec", "share", "var");


# ========================================

print "Checking for regular files\n";

sub process_regular {
	return if -d;
	return if -l;
	return if (/man.*\/index.db$/);
	return if (/man.*\/CACHEDIR.TAG$/);
	return if (/applications\/mimeinfo.cache$/);
	die "*** OOPS: Some package installed a regular file: [$_]\n";

}

chdir("/opt") or die "Can not chdir to [/opt]: $!";
find({ wanted => \&process_regular, no_chdir => 1 }, @subdirs);

print "Done checking for regular files\n\n";

# ========================================

print "Removing stale links\n";

sub process_remove_stale_links {
	return unless -l;
	return if -r readlink;
	print "\tremoving $_\n" if $debug;
	unlink || die "Can not unlink [$_]: $!";;
}
chdir("/opt") or die "Can not chdir to [/opt]: $!";
find({ wanted => \&process_remove_stale_links, no_chdir => 1 }, @subdirs);

print "Done removing stale links\n\n";


# ========================================

print "Create directories\n";

sub process_create_directories {

	return if -l "/opt/$_";
	if (-d) {
		return if -d "/opt/$_";
		print "\tcreating dir /opt/$_\n" if $debug;		
		mkdir "/opt/$_";
		return;
	}
}

my @pkgs = </opt/kaarpux/*>;
foreach my $pkg (@pkgs) {
	print "\tprocessing $pkg\n" if $debug;
	chdir($pkg) or die "Can not chdir to [$pkg]: $!";
	foreach my $dir (@subdirs) {
		next if ! -d $dir;
		find({ wanted => \&process_create_directories, no_chdir => 1, follow_fast => 1, follow_skip => 2 }, $dir);
	}
}

print "Done createing directories\n\n";

# ========================================

print "Create links\n";

sub process_create_links {

	return if -l "/opt/$_";
	return if (-d);
	print "\tcreating link $_\n" if $debug;
        symlink Cwd::abs_path($_), "/opt/$_" or die "Can not create symlink to [$_]: $!";
}

foreach my $pkg (@pkgs) {
	print "\tprocessing $pkg\n" if $debug;
	chdir($pkg) or die "Can not chdir to [$pkg]: $!";
	foreach my $dir (@subdirs) {
		next if ! -d $dir;
		find({ wanted => \&process_create_links, no_chdir => 1, follow_fast => 1, follow_skip => 2 }, $dir);
	}
}

print "Done createing links\n\n";

# ========================================

=comment


echo "Creating directories and links"
for PDIR in $(ls -1 /opt/kaarpux); do
	echo "    ${PDIR}"
	cd /opt/kaarpux/"${PDIR}"
	for ODIR in bin etc include lib sbin src share var; do
		if [ -d "${ODIR}" ]; then
			find "${ODIR}" -type d -exec mkdir -p /opt/"{}" \; > /dev/null 2>&1
			find "${ODIR}" -type f -not -exec ls /opt/"{}" \; -exec ln -s /opt/kaarpux/"${PDIR}"/"{}" /opt/"{}" \; > /dev/null 2>&1
			find "${ODIR}" -type l -not -exec ls /opt/"{}" \; -exec cp -P /opt/kaarpux/"${PDIR}"/"{}" /opt/"{}" \; > /dev/null 2>&1
		fi
	done
done
echo "Done reating directories and links"
echo

cd "${CURDIR}"

echo "Do not forget: sudo ldconfig"
echo
=cut
