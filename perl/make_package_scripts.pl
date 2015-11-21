#!/usr/bin/perl -w
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2012-2014: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

use Config;
use File::Basename;
use File::Copy;
use Data::Dumper;
use YAML::Tiny;

use feature "switch";
no if $] >= 5.018, warnings => "experimental::smartmatch";

# ============================================================

my $KX_TOP;
my $pass;

my $debug=0;
#my $debug=1;

#my $disable_test=1;

# ============================================================

sub usage {
warn "Usage: $0 path-to-kaarpux\n"
}

# ============================================================
sub pkg_ref_from_name {
	my ($pkg_name) = @_;
	my $pkg_ref = $pkg_name;
	$pkg_ref =~ tr/a-z/A-Z/;
	$pkg_ref =~ s/\+/_PLUS/g;
	$pkg_ref =~ tr/a-zA-Z0-9/_/cs;
	return $pkg_ref;
}


# ============================================================
sub create_definition_script {
	my $definition_script="${KX_TOP}/bootstrap/shinc/packages.shinc";
	open DEFINITION_SCRIPT, ">${definition_script}" or die $!;
	return $definition_script;
}


# ============================================================
sub create_download_bootstrap_script {
	my $download_bootstrap_script="${KX_TOP}/bootstrap/download_bootstrap_packages.sh";
	open DOWNLOAD_BOOTSTRAP_SCRIPT, ">${download_bootstrap_script}" or die $!;
	print DOWNLOAD_BOOTSTRAP_SCRIPT <<"eof";
#!/bin/sh

set -o nounset
set -o errexit

KX_BASE="\$(cd \$(dirname "\$0"); pwd -P)"
. "\${KX_BASE}/shinc/common_functions.shinc"
. "\${KX_BASE}/shinc/packages.shinc"

eof
	return $download_bootstrap_script;
}


# ============================================================
sub create_download_all_script {
	my $download_all_script="${KX_TOP}/linux/download_all_packages.sh";
	open DOWNLOAD_ALL_SCRIPT, ">${download_all_script}" or die $!;
	print DOWNLOAD_ALL_SCRIPT <<"eof";
#!/bin/sh

set -o nounset
set -o errexit

KX_BASE="\$(cd \$(dirname "\$0"); pwd -P)"
. "\${KX_BASE}/shinc/common_functions.shinc"
. "\${KX_BASE}/shinc/packages.shinc"

eof
	return $download_all_script;
}

# ============================================================
sub create_version_script {
	my $version_script="${KX_TOP}/linux/plinc/kx_version.plinc";
	open VERSION_SCRIPT, ">${version_script}" or die $!;
	print VERSION_SCRIPT "%package_versions = ();\n";
	return $version_script;
}

# ============================================================
sub close_and_copy_scripts {
	my ($definition_script, $download_bootstrap_script, $download_all_script, $version_script) = @_;
	close DEFINITION_SCRIPT;
	close DOWNLOAD_BOOTSTRAP_SCRIPT;
	close DOWNLOAD_ALL_SCRIPT;
	close VERSION_SCRIPT;
	chmod 0744, "${download_bootstrap_script}" or die $!;
	chmod 0744, "${download_all_script}" or die $!;
	my $linux_definition_script = "${KX_TOP}/linux/shinc/packages.shinc";
	copy($definition_script, $linux_definition_script) or die "Could not copy [$definition_script] to [$linux_definition_script]: $!";

}

# ============================================================


sub pkg_download_definition {
	my ($pkg_name, $pkg_version, $pkg_ref, $pkg_file, $download) = @_;

	my $pkg_version_m = $pkg_version;
	$pkg_version_m = $1 if $pkg_version_m =~ /^([0-9]+)/;

	my $pkg_version_mm = $pkg_version;
	$pkg_version_mm = $1 if $pkg_version_mm =~ /^([0-9]+\.[0-9]+)/;

	my $pkg_version_mmm = $pkg_version;
	$pkg_version_mmm = $1 if $pkg_version_mmm =~ /^([0-9]+\.[0-9]+\.[0-9]+)/;

	my $pkg_version_uscore = $pkg_version;
	$pkg_version_uscore =~ s|\.|_|g;

	my $pkg_ver = "\${KX_${pkg_ref}_VERSION}";
	my $pkg_m = "\${KX_${pkg_ref}_VERSION_M}";
	my $pkg_mm = "\${KX_${pkg_ref}_VERSION_MM}";
	my $pkg_mmm = "\${KX_${pkg_ref}_VERSION_MMM}";
	my $pkg_uscore = "\${KX_${pkg_ref}_VERSION_USCORE}";

	my $dir = $download->{"dir"};

	my $verify = "";

	if (exists($download->{"no_download"})) {
		print DEFINITION_SCRIPT "KX_${pkg_ref}_NAME=\"${pkg_name}\"\n";
		print DEFINITION_SCRIPT "KX_${pkg_ref}_VERSION=\"${pkg_version}\"\n";
		print DEFINITION_SCRIPT "KX_${pkg_ref}_VERSION_M=\"${pkg_version_m}\"\n";
		print DEFINITION_SCRIPT "KX_${pkg_ref}_VERSION_MM=\"${pkg_version_mm}\"\n";
		print DEFINITION_SCRIPT "KX_${pkg_ref}_VERSION_MMM=\"${pkg_version_mmm}\"\n";
		print DEFINITION_SCRIPT "KX_${pkg_ref}_VERSION_USCORE=\"${pkg_version_uscore}\"\n";
		$dir="${pkg_name}-${pkg_ver}" unless defined $dir;
		print DEFINITION_SCRIPT "KX_${pkg_ref}=\"${dir}\"\n";
		return (undef, undef, undef, undef);
	}

	
	my $url = $download->{"url"};
	my $file = $download->{"file"};
	my $checksum = $download->{"checksum"};

	# predefined downloads


	if (exists $download->{"gnu"}) {
		print "GNU download\n" if $debug;
		$url="http://ftp.gnu.org/gnu/${pkg_name}";
		$file="${pkg_name}-${pkg_ver}.tar.bz2";
		$verify="sig";
	};

	if (exists $download->{"gnuz"}) {
		print "GNU download\n" if $debug;
		$url="http://ftpmirror.gnu.org/${pkg_name}";
		$file="${pkg_name}-${pkg_ver}.tar.gz";
		$verify="sig";
	};

	if (exists $download->{"gnux"}) {
		print "GNU download\n" if $debug;
		$url="http://ftpmirror.gnu.org/${pkg_name}";
		$file="${pkg_name}-${pkg_ver}.tar.xz";
		$verify="sig";
	};

	if (exists $download->{"gnuv"}) {
		print "GNUV download\n" if $debug;
		$url="http://ftpmirror.gnu.org/${pkg_name}/${pkg_name}-${pkg_ver}";
		$file="${pkg_name}-${pkg_ver}.tar.bz2";
		$verify="sig";
	};

	if (exists $download->{"gnur"}) {
		print "GNUR download\n" if $debug;
		$url="http://ftpmirror.gnu.org/${pkg_name}/${pkg_name}-${pkg_ver}";
		$file="${pkg_name}-${pkg_ver}.tar.bz2";
		$verify="sig";
	};

	if (exists $download->{"kernelxz"}) {
		print "KERNEL download\n" if $debug;
		my $subdir=$download->{"kernelxz"};
		$url="http://www.kernel.org/pub/${subdir}";
		$file="${pkg_name}-${pkg_ver}.tar.xz" unless defined $file;
		$verify="tar.xz.sign";
	};

	if (exists $download->{"sourceforge"}) {
		print "SF download\n" if $debug;
		my $p = $download->{"sourceforge"};
		if (!$p) { $p= $pkg_name; }
		$url="http://downloads.sourceforge.net/sourceforge/${p}";
	};

	if (exists $download->{"lxde"}) {
		print "SF download\n" if $debug;
		$url="http://downloads.sourceforge.net/sourceforge/lxde";
		$file="${pkg_name}-${pkg_ver}.tar.gz";
	};

	if (exists $download->{"lxde_bz2"}) {
		print "SF download\n" if $debug;
		$url="http://downloads.sourceforge.net/sourceforge/lxde";
		$file="${pkg_name}-${pkg_ver}.tar.bz2";
	};

	if (exists $download->{"gnome"}) {
		print "GNOME download\n" if $debug;
		$url="ftp://ftp.gnome.org/pub/gnome/sources/${pkg_name}/${pkg_mm}";
		$file="${pkg_name}-${pkg_ver}.tar.bz2";
	};

	if (exists $download->{"gnomexz"}) {
		print "GNOME download\n" if $debug;
		$url="ftp://ftp.gnome.org/pub/gnome/sources/${pkg_name}/${pkg_mm}";
		$file="${pkg_name}-${pkg_ver}.tar.xz";
	};


	if (exists $download->{"redhat"}) {
		print "REDHAT download\n" if $debug;
		$url="ftp://sources.redhat.com/pub/${pkg_name}/";
		$file="${pkg_name}-${pkg_ver}.tar.gz";
	};

	if (exists $download->{"freedesktop"}) {
		print "FREEDESKTOP.ORG download\n" if $debug;
		$url="http://freedesktop.org/software/${pkg_name}/releases";
		$file="${pkg_name}-${pkg_ver}.tar.gz";
	};

	if (exists $download->{"freedesktop_xz"}) {
		print "FREEDESKTOP.ORG download\n" if $debug;
		$url="http://freedesktop.org/software/${pkg_name}/releases";
		$file="${pkg_name}-${pkg_ver}.tar.xz";
	};

	# modifiers 
	if (exists $download->{"url_pkg_ver"}) {
		print "PKG_VER download\n" if $debug;
		$url=$download->{"url_pkg_ver"} . "/${pkg_name}-${pkg_ver}";
		$file="${pkg_name}-${pkg_ver}.tar.bz2";
	};

	if (exists $download->{"url_ver"}) {
		print "VER download\n" if $debug;
		$url=$download->{"url_ver"} . "/${pkg_ver}";
		$file="${pkg_name}-${pkg_ver}.tar.bz2";
	};

	if (exists $download->{"file_tar_gz"}) {
		$file="${pkg_name}-${pkg_ver}.tar.gz";
	};

	if (exists $download->{"file_tgz"}) {
		$file="${pkg_name}-${pkg_ver}.tgz";
	};

	if (exists $download->{"file_zip"}) {
		$file="${pkg_name}-${pkg_ver}.zip";
	};

	if (exists $download->{"file_tar_xz"}) {
		$file="${pkg_name}-${pkg_ver}.tar.xz";
	};

	if (exists $download->{"file_tar_lzma"}) {
		$file="${pkg_name}-${pkg_ver}.tar.lzma";
	};
	if (exists $download->{"file_tar_lz"}) {
		$file="${pkg_name}-${pkg_ver}.tar.lz";
	};

	$file="${pkg_name}-${pkg_ver}.tar.bz2" unless defined $file;
	$dir="${pkg_name}-${pkg_ver}" unless defined $dir;

	if (exists($download->{"full_url"})) {
		my $full_url = $download->{"full_url"};
		print DEFINITION_SCRIPT "KX_${pkg_ref}_NAME=\"${pkg_name}\"\n";
		print DEFINITION_SCRIPT "KX_${pkg_ref}_VERSION=\"${pkg_version}\"\n";
		print DEFINITION_SCRIPT "KX_${pkg_ref}_VERSION_M=\"${pkg_version_m}\"\n";
		print DEFINITION_SCRIPT "KX_${pkg_ref}_VERSION_MM=\"${pkg_version_mm}\"\n";
		print DEFINITION_SCRIPT "KX_${pkg_ref}_VERSION_MMM=\"${pkg_version_mmm}\"\n";
		print DEFINITION_SCRIPT "KX_${pkg_ref}_VERSION_USCORE=\"${pkg_version_uscore}\"\n";
		print DEFINITION_SCRIPT "KX_${pkg_ref}=\"${dir}\"\n";
		print DEFINITION_SCRIPT "KX_${pkg_ref}_FILE=\"${file}\"\n";
		print DEFINITION_SCRIPT "KX_${pkg_ref}_TARBALL=\"${full_url}\"\n";
		return ( ${full_url}, ${file}, ${checksum}, ${full_url} );
	}

	# verify that we got everything

	die "*** Undefined URL for [${pkg_name}] in [${pkg_file}]\n" unless defined $url;
	die "*** Undefined FILE for [${pkg_name}] in [${pkg_file}]\n" unless defined $file;
	die "*** Undefined CHECKSUM for [${pkg_name}] in [${pkg_file}]\n" unless defined $checksum;

	# write to script

	print DEFINITION_SCRIPT "KX_${pkg_ref}_NAME=\"${pkg_name}\"\n";
	print DEFINITION_SCRIPT "KX_${pkg_ref}_VERSION=\"${pkg_version}\"\n";
	print DEFINITION_SCRIPT "KX_${pkg_ref}_VERSION_M=\"${pkg_version_m}\"\n";
	print DEFINITION_SCRIPT "KX_${pkg_ref}_VERSION_MM=\"${pkg_version_mm}\"\n";
	print DEFINITION_SCRIPT "KX_${pkg_ref}_VERSION_MMM=\"${pkg_version_mmm}\"\n";
	print DEFINITION_SCRIPT "KX_${pkg_ref}_VERSION_USCORE=\"${pkg_version_uscore}\"\n";
	print DEFINITION_SCRIPT "KX_${pkg_ref}=\"${dir}\"\n";
	print DEFINITION_SCRIPT "KX_${pkg_ref}_FILE=\"${file}\"\n";
	print DEFINITION_SCRIPT "KX_${pkg_ref}_TARBALL=\"${url}/${file}\"\n";

	if (exists($download->{"verify"})) {
		$verify = $download->{"verify"};
	}

	return ( "${url}/${file}", ${file}, ${checksum}, ${url}, ${verify} );
}


# ============================================================


sub one_download_print {
	my (${line}, ${bootstrap}) = @_;
	print DOWNLOAD_ALL_SCRIPT "${line}\n";
	if ($bootstrap) {
		print DOWNLOAD_BOOTSTRAP_SCRIPT "${line}\n";
	}
}


# ============================================================

sub one_package_download {
	my (${url}, ${file}, ${checksum}, ${u}, ${verify}, ${bootstrap}) = @_;
	if ($url) {
		one_download_print "kx_download \"${url}\" \"${file}\" ${checksum}", ${bootstrap};
		if ($verify) { given (${verify}) {
			when ("no") { }
			when ( [ "tar.xz.sign" ] ) {
				my $f = $file;
				$f =~ s/.xz$//;
				my $uu = "${u}/${f}.sign";
				one_download_print "kx_download \"${uu}\" \"${f}.sign\" no", ${bootstrap};
				one_download_print "kx_verify ${verify} \"${file}\" \"${f}.sign\"", ${bootstrap};
			}
			when ( [ "sig", "sign", "asc", "sha1.asc" ] ) {
				one_download_print "kx_download \"${url}.${verify}\" \"${file}.${verify}\" no", ${bootstrap};
				one_download_print "kx_verify ${verify} \"${file}\" \"${file}.${verify}\"", ${bootstrap};
			}
		}}
	}
}


# ============================================================
sub one_bootstrap_head {
	my ($where, $step, $pkg_name, $pkg_ref) = @_;

	my $file="${KX_TOP}/bootstrap/${where}_scripts/${step}/${pkg_name}.sh";
	print "\tCreating [$file]\n"  if $debug;
	open STEP_SCRIPT, ">${file}" or die $!;

	print STEP_SCRIPT <<"eof_step";
#!/bin/sh

set -o errexit
set -o nounset

KX_PREFIX=/
KX_CONFIG="--prefix=/ --disable-dependency-tracking"

KX_BASE="\$(cd \$(dirname "\$0")/../..; pwd -P)"
. "\${KX_BASE}/shinc/bootstrap.shinc"
. "\${KX_BASE}/shinc/packages.shinc"

kx_init

kx_prepare ${step} ${pkg_ref}

eof_step

return $file;
}


# ============================================================
sub one_linux_build_head {
	my ($step, $pkg_name, $pkg_ref, $additional_downloads, @download) = @_;

	print "one_linux_build_head: $step, $pkg_name, $pkg_ref, @download \n" if $debug;

	my (${url}, ${dl_file}, ${checksum}) = @download;

	my $STEP = uc $step;
	my $file="${KX_TOP}/linux/scripts/linux/${pkg_name}_${STEP}.sh";
	print "\tCreating [$file]\n" if $debug;
	open STEP_SCRIPT, ">${file}" or die $!;

	print STEP_SCRIPT <<"eof_step";
#!/bin/sh

set -o errexit
set -o nounset

KX_PREFIX="\${KX_PREFIX:-/}"
KX_CONFIG="\${KX_CONFIG:---prefix=\${KX_PREFIX}} --disable-dependency-tracking"

if command -V clang >/dev/null 2>&1; then
CC="\${CC:-clang}"; export CC
CXX="\${CXX:-clang++ -std=c++11}"; export CXX
fi

KX_BASE="\$(cd \$(dirname "\$0")/../..; pwd -P)"
. "\${KX_BASE}/shinc/linux.shinc"
. "\${KX_BASE}/shinc/packages.shinc"
kx_init
kx_ensure_runas_nonroot 

eof_step

if (defined $url) { print STEP_SCRIPT "kx_download \"${url}\" \"${dl_file}\" ${checksum}\n\n"; }
if (defined $additional_downloads) { print STEP_SCRIPT $additional_downloads; }
return $file;

}

# ============================================================
sub one_opt_build_head {
	my ($step, $pkg_name, $pkg_ref, $additional_downloads, @download) = @_;

	print "one_opt_build_head: $step, $pkg_name, $pkg_ref, @download \n" if $debug;

	my (${url}, ${dl_file}, ${checksum}) = @download;

	my $STEP = uc $step;
	my $file="${KX_TOP}/linux/scripts/opt/${pkg_name}_${STEP}.sh";
	print "\tCreating [$file]\n" if $debug;
	open STEP_SCRIPT, ">${file}" or die $!;

	print STEP_SCRIPT <<"eof_step";
#!/bin/sh

set -o errexit
set -o nounset

KX_BASE="\$(cd \$(dirname "\$0")/../..; pwd -P)"
. "\${KX_BASE}/shinc/linux.shinc"
. "\${KX_BASE}/shinc/packages.shinc"
kx_init
kx_ensure_runas_nonroot 

KX_PREFIX="\${KX_PREFIX:-/opt/kaarpux/\${KX_${pkg_ref}}}"
KX_CONFIG="\${KX_CONFIG:---prefix=\${KX_PREFIX}} --disable-dependency-tracking"

if command -V clang >/dev/null 2>&1; then
CC="\${CC:-clang}"; export CC
CXX="\${CXX:-clang++ -std=c++11}"; export CXX
fi

eof_step

if (defined $url) { print STEP_SCRIPT "kx_download \"${url}\" \"${dl_file}\" ${checksum}\n\n"; }
if (defined $additional_downloads) { print STEP_SCRIPT $additional_downloads; }

return $file;
}

# ============================================================
sub one_opt_build_head_gcc {
	my ($step, $pkg_name, $pkg_ref, $additional_downloads, @download) = @_;

	print "one_opt_build_head: $step, $pkg_name, $pkg_ref, @download \n" if $debug;

	my (${url}, ${dl_file}, ${checksum}) = @download;

	my $STEP = uc $step;
	my $file="${KX_TOP}/linux/scripts/opt/${pkg_name}_${STEP}.sh";
	print "\tCreating [$file]\n" if $debug;
	open STEP_SCRIPT, ">${file}" or die $!;

	print STEP_SCRIPT <<"eof_step";
#!/bin/sh

set -o errexit
set -o nounset

KX_BASE="\$(cd \$(dirname "\$0")/../..; pwd -P)"
. "\${KX_BASE}/shinc/linux.shinc"
. "\${KX_BASE}/shinc/packages.shinc"
kx_init
kx_ensure_runas_nonroot 

KX_PREFIX="\${KX_PREFIX:-/opt/kaarpux/\${KX_${pkg_ref}}}"
KX_CONFIG="\${KX_CONFIG:---prefix=\${KX_PREFIX}} --disable-dependency-tracking"

eof_step

if (defined $url) { print STEP_SCRIPT "kx_download \"${url}\" \"${dl_file}\" ${checksum}\n\n"; }
if (defined $additional_downloads) { print STEP_SCRIPT $additional_downloads; }

return $file;
}

# ============================================================
sub one_linux_head {
	my ($step, $pkg_name, $pkg_ref, $ensure_runas) = @_;

	my $STEP = uc $step;
	my $file="${KX_TOP}/linux/scripts/linux/${pkg_name}_${STEP}.sh";
	print "\tCreating [$file]\n" if $debug;
	open STEP_SCRIPT, ">${file}" or die $!;

	print STEP_SCRIPT <<"eof_step";
#!/bin/sh

set -o errexit
set -o nounset

KX_PREFIX="\${KX_PREFIX:-/}"
KX_CONFIG="\${KX_CONFIG:---prefix=\${KX_PREFIX}} --disable-dependency-tracking"

KX_BASE="\$(cd \$(dirname "\$0")/../..; pwd -P)"
. "\${KX_BASE}/shinc/linux.shinc"
. "\${KX_BASE}/shinc/packages.shinc"
kx_init
kx_ensure_runas_${ensure_runas} 

if command -V clang >/dev/null 2>&1; then
CC="\${CC:-clang}"; export CC
CXX="\${CXX:-clang++ -std=c++11}"; export CXX
fi

cd \${KX_BASE}/build/linux/\${KX_${pkg_ref}}

eof_step
return $file;
}

# ============================================================
sub one_opt_head {
	my ($step, $pkg_name, $pkg_ref) = @_;

	my $STEP = uc $step;
	my $file="${KX_TOP}/linux/scripts/opt/${pkg_name}_${STEP}.sh";
	print "\tCreating [$file]\n" if $debug;
	open STEP_SCRIPT, ">${file}" or die $!;

	print STEP_SCRIPT <<"eof_step";
#!/bin/sh

set -o errexit
set -o nounset

KX_BASE="\$(cd \$(dirname "\$0")/../..; pwd -P)"
. "\${KX_BASE}/shinc/linux.shinc"
. "\${KX_BASE}/shinc/packages.shinc"
kx_init
kx_ensure_runas_nonroot 

KX_PREFIX="\${KX_PREFIX:-/opt/kaarpux/\${KX_${pkg_ref}}}"
KX_CONFIG="\${KX_CONFIG:---prefix=\${KX_PREFIX}} --disable-dependency-tracking"

if command -V clang >/dev/null 2>&1; then
CC="\${CC:-clang}"; export CC
CXX="\${CXX:-clang++ -std=c++11}"; export CXX
fi

cd \${KX_BASE}/build/opt/\${KX_${pkg_ref}}

eof_step
return $file;
}

# ============================================================
sub one_package_step {
	my ($where, $step, $pkg_name, $pkg_ref, $script) = @_;
	print "one_package_step: $where, $step, $pkg_name, $pkg_ref, $script\n" if $debug;

	foreach $directive (@$script) {
		my $typeof = ref $directive;
		if (!$typeof) {
			die "*** Unknown directive [${directive}] for [${step}] in [${pkg_name}]\n"; 
		} elsif ($typeof eq 'HASH') {
			while ( my ($key, $value) = each(%$directive) ) {
				$value="" unless defined $value;
				#my $ch_value = $value;
				chomp $value;
				#print "key: $key\n";
				my $make_j = "\${KX_MAKE_J}";
				given ($key) {
					when ("separate_builddir") { print STEP_SCRIPT "kx_separate_builddir ${step} ${pkg_ref} ${value}\n\n"; }
					when ("untar") { print STEP_SCRIPT "kx_untar ${value}\n\n"; }
					when ("patch") { print STEP_SCRIPT "kx_echo \"Patch ${pkg_ref} with ${value}\";\n";
							 my $p1 = lc (substr $pkg_name, 0, 1);
							 print STEP_SCRIPT "patch -Np1 -i \${KX_BASE}/../master/packages/${p1}/${pkg_name}.files/${value}\n\n"; }
					when ("echo") { print STEP_SCRIPT "kx_step_echo '${value} ${pkg_ref}'\n\n"; }
					when ("use_gcc") { print STEP_SCRIPT "CC=gcc; export CC\nCXX=g++; export CXX\n\n"; }
					when ("configure") { print STEP_SCRIPT "kx_step_echo 'configure ${pkg_ref}'\n./configure ${value}\n\n"; }
					when ("configure_tools") { print STEP_SCRIPT "kx_step_echo 'configure ${pkg_ref}'\n./configure  --prefix=\"\${KX_TOOLS}\" --disable-dependency-tracking ${value}\n\n"; }
					when ("configure_kx") { print STEP_SCRIPT "kx_step_echo 'configure ${pkg_ref}'\n./configure \${KX_CONFIG} ${value}\n\n"; }
					when ("configure_kx_posix") { print STEP_SCRIPT "kx_step_echo 'configure ${pkg_ref}'\nsed '/test/s|==|=|' -i configure\n./configure \${KX_CONFIG} ${value}\n\n"; }
					when ("configure_kx_bash") { print STEP_SCRIPT "kx_step_echo 'configure ${pkg_ref}'\nsed '1s|sh|bash|' -i configure\nCONFIG_SHELL=/bin/bash /bin/bash ./configure \${KX_CONFIG} ${value}\n\n"; }
					when ("make") { print STEP_SCRIPT "kx_step_echo 'make ${pkg_ref}'\nmake ${make_j} ${value}\n\n"; }
					when ("make_repeat") {
						print STEP_SCRIPT "kx_step_echo 'make ${pkg_ref}'\n";
						print STEP_SCRIPT "if ! make ${make_j} ${value}; then\n";
						print STEP_SCRIPT "  kx_step_echo 'repeating make ${pkg_ref}'\n";
						print STEP_SCRIPT "  make -j1 ${value}\n";
						print STEP_SCRIPT "fi\n";
					}
					when ("cmake") { print STEP_SCRIPT "kx_step_echo 'cmake ${pkg_ref}'\ncmake ${value}\n\n"; }
					when ("cmake_kx") { print STEP_SCRIPT "kx_step_echo 'cmake ${pkg_ref}'\ncmake -DCMAKE_INSTALL_PREFIX=\${KX_PREFIX} ${value}\n\n"; }
					when ("check") { print STEP_SCRIPT "kx_step_echo 'check ${pkg_ref}'\ntest -z \"\${KX_DISABLE_TEST}\" && make ${make_j} -k ${value} check\n\n"; }
					when ("check_ignore") { print STEP_SCRIPT "kx_step_echo 'check (but ignore the result) ${pkg_ref}'\ntest -z \"\${KX_DISABLE_TEST}\" && make ${make_j} -k ${value} check || echo 'IGNORING ERRORS'\n\n"; }
					when ("check_repeat") {
						print STEP_SCRIPT "if test -z \"\${KX_DISABLE_TEST}\"; then\n";
						print STEP_SCRIPT "  kx_step_echo 'check ${pkg_ref}'\n";
						print STEP_SCRIPT "  if ! make ${make_j} ${value} check; then\n";
						print STEP_SCRIPT "    kx_step_echo 'repeating check ${pkg_ref}'\n";
						print STEP_SCRIPT "    sleep 10\n";
						print STEP_SCRIPT "    make -j1 -k ${value} check\n";
						print STEP_SCRIPT "  fi\n";
						print STEP_SCRIPT "fi\n";
					}
					when ("test") { print STEP_SCRIPT "kx_step_echo 'test ${pkg_ref}'\ntest -z \"\${KX_DISABLE_TEST}\" && make ${make_j} -k ${value} test\n\n"; }
					when ("install") { print STEP_SCRIPT "kx_step_echo 'install ${pkg_ref}'\nmake ${value} install\n\n"; }
					when ("kx") { print STEP_SCRIPT "kx_${value}\n"; }
					when ("doc") { print STEP_SCRIPT "# ${value}\n"; }
					when ("todo") { print STEP_SCRIPT "# TODO: ${value}\n"; }
					when ("sh") { print STEP_SCRIPT "${value}\n"; }
					when ("install_file") { print STEP_SCRIPT "kx_step_echo 'install file ${value}'\nkx_install_file ${value}\n\n"; }
					when ("install_pkg_file") {
						my $p1 = lc (substr $pkg_name, 0, 1);
						print STEP_SCRIPT "kx_echo 'install pkg file ${value}'\nkx_install_pkg_file ${p1} ${pkg_name} ${value}\n\n";
						}
					when ("append_pkg_file") {
						my $p1 = lc (substr $pkg_name, 0, 1);
						print STEP_SCRIPT "kx_echo 'append pkg file ${value}'\nkx_append_pkg_file ${p1} ${pkg_name} ${value}\n\n";
						}
					when ("get_pkg_file") {
						my $p1 = lc (substr $pkg_name, 0, 1);
						print STEP_SCRIPT "kx_echo 'get pkg file ${value}'\nkx_get_pkg_file ${p1} ${pkg_name} ${value}\n\n";
						}
					when ("python3") {
						print STEP_SCRIPT "PYTHON=python3; export PYTHON\n";
					}
					default { die "*** unknown directive [$key] under [${step}] for [${pkg_name}]\n"; }
				}
			}

		} else { die "*** Unknown directive of type [${typeof}] for [${step}] in [${pkg_name}]\n"; }

	}
}
# ============================================================
sub one_bootstrap_step {
	my ($where, $step, $pkg_name, $pkg_ref, $script) = @_;
	print "one_bootstrap_step: $where, $step, $pkg_name, $pkg_ref, $script\n" if $debug;

	$file = one_bootstrap_head $where, $step, $pkg_name, $pkg_ref;

	one_package_step $where, $step, $pkg_name, $pkg_ref, $script;
	
	print STEP_SCRIPT "\necho 'KaarPux: SUCCESS'\n";
	close STEP_SCRIPT;
	chmod 0744, "${file}" or die $!;
}

# ============================================================
sub all_linux_steps {
	my ($where, $step, $pkg_name, $pkg_ref, $script, $additional_downloads, @download) = @_;
	print "all_linux_steps: $where, $step, $pkg_name, $pkg_ref, $script, [ @download ] \n" if $debug;

	foreach $directive (@$script) {
		my $typeof = ref $directive;
		if (!$typeof) {
			die "*** Unknown directive [${directive}] for [${step}] in [${pkg_name}]\n"; 
		} elsif ($typeof eq 'HASH') {
			while ( my ($key, $value) = each(%$directive) ) {
				given ($key) {
					when ("build") {
						if ($where eq "opt") {
							$file = one_opt_build_head $key, $pkg_name, $pkg_ref, $additional_downloads, @download;
						} else {
							$file = one_linux_build_head $key, $pkg_name, $pkg_ref, $additional_downloads, @download;
						}
						if (defined $download[0]) {
							print STEP_SCRIPT "kx_prepare_linux ${where} ${pkg_ref}\n";
						} else {
							print STEP_SCRIPT "kx_noprepare_linux ${where} ${pkg_ref}\n";
						}
						one_package_step $where, $step, $pkg_name, $pkg_ref, $value, @download;
						print STEP_SCRIPT "\necho 'KaarPux: SUCCESS'\n";
						close STEP_SCRIPT;
						chmod 0744, "${file}" or die $!;
						}
					when ("prepare_and_build") {
						if ($where eq "opt") {
							$file = one_opt_build_head "build", $pkg_name, $pkg_ref, '', @download;
						} else {
							$file = one_linux_build_head "build", $pkg_name, $pkg_ref, '', @download;
						}
						# no prepare script
						one_package_step $where, $step, $pkg_name, $pkg_ref, $value, @download;
						print STEP_SCRIPT "\necho 'KaarPux: SUCCESS'\n";
						close STEP_SCRIPT;
						chmod 0744, "${file}" or die $!;
						}
					when ( ["test", "build2", "test2"] ) {
						if ($where eq "opt") {
							$file = one_opt_head $key, $pkg_name, $pkg_ref;
						} else {
							$file = one_linux_head $key, $pkg_name, $pkg_ref, "nonroot";
						}
						one_package_step $where, $step, $pkg_name, $pkg_ref, $value;
						print STEP_SCRIPT "\necho 'KaarPux: SUCCESS'\n";
						close STEP_SCRIPT;
						chmod 0744, "${file}" or die $!;
						}
					when ( ["install", "install2"] ) {
						if ($where eq "opt") {
							$file = one_opt_head $key, $pkg_name, $pkg_ref;
							print STEP_SCRIPT "\nrm -rf \${KX_PREFIX}\n";
						} else {
							$file = one_linux_head $key, $pkg_name, $pkg_ref, "root";
						}
						one_package_step $where, $step, $pkg_name, $pkg_ref, $value;
						print STEP_SCRIPT "\nkx_install_done ${step} ${pkg_ref}\n";
						print STEP_SCRIPT "\necho 'KaarPux: SUCCESS'\n";
						close STEP_SCRIPT;
						chmod 0744, "${file}" or die $!;
						}
					when ( "install_keep" ) {
						if ($where eq "opt") {
							$file = one_opt_head "install", $pkg_name, $pkg_ref;
						} else {
							$file = one_linux_head "install", $pkg_name, $pkg_ref, "root";
						}
						one_package_step $where, $step, $pkg_name, $pkg_ref, $value;
						print STEP_SCRIPT "\necho 'KaarPux: SUCCESS'\n";
						close STEP_SCRIPT;
						chmod 0744, "${file}" or die $!;
						}
					default { die "*** unknown directive [$key] under [${step}] for [${pkg_name}] in [${file}]\n"; }
				}
			}

		} else { die "*** Unknown directive of type [${typeof}] for [${step}] in [${pkg_name}]\n"; }

	}
}


# ============================================================
sub perl_modules {
	my ($prl, $file, $perl_modules) = @_;
	while ( my ($pkg, $value) = each(%$perl_modules) ) {
		my $ppkg = "PERLMODULE_" . $pkg;
		my ($module, $rest) = split(/-/, $pkg);
		my ($alias, $version, $author, $checksum, $bootstrap) = split(/\s+/, $value);
		$bootstrap=0 unless defined $bootstrap;
		my $dir="${alias}-${version}";
		my $file="${dir}.tar.gz";
		my $pkg_ref = pkg_ref_from_name $pkg;
		my $ppkg_ref = pkg_ref_from_name $ppkg;
		my $url="http://www.cpan.org/modules/by-module/${module}/${author}/";
		my  @download = ("$url/$file", $file, $checksum);

		print DOWNLOAD_BOOTSTRAP_SCRIPT "kx_download \"${url}/${file}\" \"${file}\" ${checksum}\n" if $bootstrap;
		print DOWNLOAD_ALL_SCRIPT "kx_download \"${url}/${file}\" \"${file}\" ${checksum}\n";

		print DEFINITION_SCRIPT "KX_${ppkg_ref}_NAME=\"${ppkg}\"\n";
		print DEFINITION_SCRIPT "KX_${ppkg_ref}_VERSION=\"${version}\"\n";
		print DEFINITION_SCRIPT "KX_${ppkg_ref}_FILE=\"${file}\"\n";
		print DEFINITION_SCRIPT "KX_${ppkg_ref}=\"${dir}\"\n";
		print DEFINITION_SCRIPT "KX_${ppkg_ref}_TARBALL=\"${url}/${file}\"\n";

		${file} = one_linux_build_head "build", $ppkg, $ppkg_ref, '', @download;
		print STEP_SCRIPT "kx_prepare_linux linux ${ppkg_ref}\n";
		print STEP_SCRIPT "perl Makefile.PL\n";
		print STEP_SCRIPT "make \${KX_MAKE_J}\n";
		print STEP_SCRIPT "\necho 'KaarPux: SUCCESS'\n";
		close STEP_SCRIPT;
		chmod 0744, "${file}" or die $!;

		${file} = one_linux_head "test", $ppkg, $ppkg_ref, "nonroot";
		print STEP_SCRIPT "make test\n" unless $disable_test;
		print STEP_SCRIPT "\necho 'KaarPux: SUCCESS'\n";
		close STEP_SCRIPT;
		chmod 0744, "${file}" or die $!;

		${file} = one_linux_head "install", $ppkg, $ppkg_ref, "root";
		print STEP_SCRIPT "make install UNINST=1\n";
		print STEP_SCRIPT "\nkx_install_done linux ${ppkg_ref}\n";
		print STEP_SCRIPT "\necho 'KaarPux: SUCCESS'\n";
		close STEP_SCRIPT;
		chmod 0744, "${file}" or die $!;

		if ($bootstrap) {
			$file = one_bootstrap_head "chroot", $bootstrap, $ppkg, $ppkg_ref;
			print STEP_SCRIPT "perl Makefile.PL\n";
			print STEP_SCRIPT "make \${KX_MAKE_J}\n";
			print STEP_SCRIPT "make test\n" unless $disable_test;
			print STEP_SCRIPT "make install UNINST=1\n";
			print STEP_SCRIPT "\nkx_install_done ${bootstrap} ${ppkg_ref}\n";
			print STEP_SCRIPT "\necho 'KaarPux: SUCCESS'\n";
			close STEP_SCRIPT;
			chmod 0744, "${file}" or die $!;
		}
		my $m = $pkg;
		$m =~ s/-/::/g;
		my $installed="eval 'use ${m}; return ${m}->VERSION;'";
		my $upstream="kxver_scrape_url(undef, 'http://cpansearch.perl.org/src/${author}/', qr|$alias-([0-9]+[0-9.\-_]*[0-9]+)/|);";
		my $wiz_url="my (\$pkg_ver, \$pkg, \$ver) = \@_; my \$f=\"${alias}-\${ver}.tar.gz\";
			return ( \$f, \"http://www.cpan.org/modules/by-module/${module}/${author}/\${f}\");";
		my $www = "http://search.cpan.org/~$author/$alias-\\\${KX_${pkg_ref}_VERSION}";
		my $wiz_sed = "my (\$ver, \$checksum) = \@_;
			print \"sed -e 's|\\\\(${alias}[[:space:]]\\\\+\\\\)[0-9.]\\\\+\\\\([[:space:]]\\\\+${author}[[:space:]]\\\\+\\\\)[0-9a-f]\\\\+|\\\\1\$ver\\\\2\$checksum|' -i master/packages/p/perl_modules.yaml\n\";";

		print VERSION_SCRIPT << "eof_version_script";
		\$package_versions{'$pkg'} = {
			"sensitive" => 0, 
			"hold" => 0, 
			"kxversion" => "$version",
			"installed" => sub() { $installed },
			"upstream" => sub() { $upstream },
			"url" => "$url",
			"file" => "${alias}-\\\${KX_${pkg_ref}_VERSION}.tar.gz",
			"www" => "$www",
			"wiz_url" => sub() { $wiz_url },
			"changelog" => "Changes",
			"wiz_can_diff" => 1,
			"wiz_yaml" => '',
			"wiz_sed" => sub () { $wiz_sed },
		};
eof_version_script

	}
}

# ============================================================
sub haskell_modules {
	my ($hsk, $file, $haskell_modules) = @_;
	while ( my ($pkg, $value) = each(%$haskell_modules) ) {
		my $hpkg = "HASKELLMODULE_" . $pkg;
		my ($version, $checksum) = split(/\s+/, $value);
		my $dir="${pkg}-${version}";
		my $file="${dir}.tar.gz";
		my $pkg_ref = pkg_ref_from_name $pkg;
		my $hpkg_ref = pkg_ref_from_name $hpkg;
		my $url="http://hackage.haskell.org/packages/archive/${pkg}/${version}";
		my  @download = ("$url/$file", $file, $checksum);

		print DOWNLOAD_ALL_SCRIPT "kx_download \"${url}/${file}\" \"${file}\" ${checksum}\n";

		print DEFINITION_SCRIPT "KX_${hpkg_ref}_NAME=\"${hpkg}\"\n";
		print DEFINITION_SCRIPT "KX_${hpkg_ref}_VERSION=\"${version}\"\n";
		print DEFINITION_SCRIPT "KX_${hpkg_ref}_FILE=\"${file}\"\n";
		print DEFINITION_SCRIPT "KX_${hpkg_ref}=\"${dir}\"\n";
		print DEFINITION_SCRIPT "KX_${hpkg_ref}_TARBALL=\"${url}/${file}\"\n";

		${file} = one_opt_build_head_gcc "build", $hpkg, $hpkg_ref, '', @download;
		print STEP_SCRIPT "kx_prepare_linux opt ${hpkg_ref}\n";
		print STEP_SCRIPT "kx_step_echo Setup configure\n";
		print STEP_SCRIPT "runhaskell Setup configure --ghc --prefix=\${KX_PREFIX}\n";
		print STEP_SCRIPT "if runhaskell Setup makefile 2>&1 >/dev/null; then\n";
		print STEP_SCRIPT "kx_step_echo make\n";
		print STEP_SCRIPT "make \${KX_MAKE_J}\n";
		print STEP_SCRIPT "else\n";
		print STEP_SCRIPT "kx_echo No make\n";
		print STEP_SCRIPT "fi\n";
		print STEP_SCRIPT "kx_step_echo Setup build\n";
		print STEP_SCRIPT "runhaskell Setup build\n";
		print STEP_SCRIPT "\necho 'KaarPux: SUCCESS'\n";
		close STEP_SCRIPT;
		chmod 0744, "${file}" or die $!;

		${file} = one_opt_head "install", $hpkg, $hpkg_ref, "root";
		print STEP_SCRIPT "kx_step_echo Setup install\n";
		print STEP_SCRIPT "{ flock -w 60 9;\n";
		print STEP_SCRIPT "  runhaskell Setup install;\n";
		print STEP_SCRIPT "} 9</opt/kaarpux/\${KX_GHC}/bin/ghc-pkg-\${KX_GHC_VERSION}\n";
		print STEP_SCRIPT "\nkx_install_done opt ${hpkg_ref}\n";
		print STEP_SCRIPT "\necho 'KaarPux: SUCCESS'\n";
		close STEP_SCRIPT;
		chmod 0744, "${file}" or die $!;

		my $wiz_url="my (\$pkg_ver, \$pkg, \$ver) = \@_;
			my \$p=\$pkg;
			\$p =~ s/HASKELLMODULE_//;
			my \$f=\"\${p}-\${ver}.tar.gz\";
			return ( \$f, \"http://hackage.haskell.org/packages/archive/\${p}/\${ver}/\${f}\");";

		print VERSION_SCRIPT << "eof_version_script";
		\$package_versions{'$hpkg'} = {
			"sensitive" => 0, 
			"hold" => 0, 
			"kxversion" => "$version",
			"installed" => sub() { return 'n/a'; },
			"upstream" => sub() { return kxver_scrape_xml(undef, "http://hackage.haskell.org/package/${pkg}", qr|${pkg}-([0-9]+[0-9\.]*[0-9]+)|); },
			"url" => "$url",
			"file" => "${pkg}-\\\${KX_${hpkg_ref}_VERSION}.tar.gz",
			"wiz_url" => sub() { $wiz_url },
			"wiz_changelog" => "",
			"wiz_can_diff" => 1,
			"wiz_yaml" => sub() { },
		};
eof_version_script

	}
}

my $XORG = "http://xorg.freedesktop.org/releases/individual";

# ============================================================
sub xorg_modules {
	my ($pkg_name, $group, $yaml) = @_;
	my $url = "${XORG}/${group}";

	my @modules = split(/\n/, $yaml);
	foreach $par_md5_module_file  (@modules) {
		#print "SSS $md5_module SSS\n";

		my ($parallel, $md5, $module_file, $installed) = ($par_md5_module_file =~ /\s*(\S+)\s+(\S+)\s+(\S+)\s*(.*)/);
		my ($module_name, $version) = ($module_file =~ /(.*)-([0-9\.]*)\.tar\.bz2/);
		my $module_ref = pkg_ref_from_name $module_name;
		my @download = ("$url/$module_file", $module_file, $md5);

		print DOWNLOAD_ALL_SCRIPT "kx_download \"${url}/${module_file}\" \"${module_file}\" ${md5}\n";

		print DEFINITION_SCRIPT "KX_${module_ref}_NAME=\"${module_name}\"\n";
		print DEFINITION_SCRIPT "KX_${module_ref}_VERSION=\"${version}\"\n";
		print DEFINITION_SCRIPT "KX_${module_ref}_FILE=\"${module_file}\"\n";
		print DEFINITION_SCRIPT "KX_${module_ref}=\"${module_name}-${version}\"\n";
		print DEFINITION_SCRIPT "KX_${module_ref}_TARBALL=\"${url}/${module_file}\"\n";

		${file} = one_linux_build_head "build", $module_name, $module_ref, '', @download;
		print STEP_SCRIPT "kx_prepare_linux linux ${module_ref}\n";
		print STEP_SCRIPT "KX_XORG_CONFIG=\"\${KX_XORG_CONFIG:---prefix=/ --sysconfdir=/etc --mandir=/share/man --localstatedir=/var --disable-dependency-tracking --enable-shared --disable-static}\"\n";
		print STEP_SCRIPT "./configure \${KX_XORG_CONFIG}\n";
		print STEP_SCRIPT "make \${KX_MAKE_J}\n";
		print STEP_SCRIPT "\necho 'KaarPux: SUCCESS'\n";
		close STEP_SCRIPT;
		chmod 0744, "${file}" or die $!;

		if ( ($group ne "font") and ($group ne "proto") ) {
			${file} = one_linux_head "test", $module_name, $module_ref, "nonroot";
			print STEP_SCRIPT "make -k check\n";
			print STEP_SCRIPT "\necho 'KaarPux: SUCCESS'\n";
			close STEP_SCRIPT;
			chmod 0744, "${file}" or die $!;

		}

		${file} = one_linux_head "install", $module_name, $module_ref, "root";
		print STEP_SCRIPT "make install\n";
		print STEP_SCRIPT "\nkx_install_done linux ${module_ref}\n";
		print STEP_SCRIPT "\necho 'KaarPux: SUCCESS'\n";
		close STEP_SCRIPT;
		chmod 0744, "${file}" or die $!;

		my $upstream="kxver_scrape_url('${module_name}', '${url}');";
		my $wiz_url = 'return kxver_wiz_url @_';

		if (!$installed) { $installed="#"; }
		if ($installed =~ /^#/) {
			$installed="return '?';";
			given ($group) {
				when ("proto") {
					$installed="kxver_pkgconfig '$module_name';";
				}
				when ("xcb") {
					$installed="kxver_pkgconfig '$module_name';";
				}
				when ("data") {
					$installed="kxver_pkgconfig '$module_name';";
				}
				when ("lib") {
					my $mn = $module_name;
					if ($mn =~ /libX(.*)/) { my $lc = lc($1); $installed="kxver_pkgconfig 'x$lc';"; }
					elsif ($mn =~ /lib(.*)/) { my $lc = lc($1); $installed="kxver_pkgconfig '$lc';"; }
				}
				when ("driver") {
					$installed="return 'n/a';";
				}
			}
		}

		print VERSION_SCRIPT << "eof_version_script";
		\$package_versions{'$module_name'} = {
			"sensitive" => 0, 
			"hold" => 0, 
			"kxversion" => "$version",
			"installed" => sub() { $installed },
			"upstream" => sub() { $upstream },
			"url" => "$url",
			"file" => "${module_name}-\\\${KX_${module_ref}_VERSION}.tar.bz2",
			"wiz_url" => sub() { $wiz_url },
			"wiz_changelog" => undef,
			"wiz_can_diff" => 1,
			"wiz_yaml" => sub() { },
		};
eof_version_script

	}

}

# ============================================================
sub xorg_package {
	my ($pkg_name, $xorg) = @_;
	foreach $directive (@$xorg) {
		my $typeof = ref $directive;
		if (!$typeof) {
			die "*** Unknown directive [${directive}] for [xorg] in [${pkg_name}]\n"; 
		} elsif ($typeof eq 'HASH') {
			while ( my ($key, $value) = each(%$directive) ) {
				given ($key) {
					when (/(.*)_modules/) { xorg_modules $pkg_name, $1, $value; }
					default { die "*** unknown directive [$key] under [xorg] for [${pkg_name}]\n"; }
				}
			}

		} else { die "*** Unknown directive of type [${typeof}] for [xorg] in [${pkg_name}]\n"; }

	}
}

# ============================================================
sub additional_downloads {
	my ($pkg_ref, $pkg_name, $bootstrap, $downloads) = @_;
	my $ret ='';
	foreach $dl (@$downloads) {
		print DOWNLOAD_ALL_SCRIPT "kx_download $dl\n";
		print DOWNLOAD_BOOTSTRAP_SCRIPT "kx_download $dl\n" if ${bootstrap};
		$ret .= "kx_download $dl\n";
	}
	return $ret;
}

# ============================================================
sub version_info {
	my ($pkg_ref, $pkg_name, $pkg_version, $url, $file, $verify, $version, $yaml_pkg) = @_;
	# $version will be undefined, if we just have version: ~ 
        # $version will be 0 if there is no version: directive
	# otherwise $version should be a hash
	print "version_info: $pkg_ref, $pkg_name, $pkg_version, $url, $file, $version, $yaml_pkg\n" if $debug;
	my $sensitive = 0;
	my $hold = 0;
	my $installed = "return 'n/a';";
	my $upstream = "return 'n/a';";
	my $ver_m = $pkg_version;
	$ver_m = $1 if $ver_m =~ /^([0-9]+)/;
	my $ver_mm = $pkg_version;
	$ver_mm = $1 if $ver_mm =~ /^([0-9]+\.[0-9]+)/;
	my $ver_mmm = $pkg_version;
	$ver_mmm = $1 if $ver_mmm =~ /^([0-9]+\.[0-9]+\.[0-9]+)/;
	my $ver_uscore = $pkg_version;
	$ver_uscore =~ s|\.|_|g;

	# if $version is undefined, use the defaults
	# if $version is defined and not zero, set defaults before processing the rest
	if ( (!defined $version) || ( (defined $version) && ($version) ) ) {
		$installed = "return kxver_sh_trailing '$pkg_name --version';";
					$upstream = "my \$KX_${pkg_ref}_VERSION='$pkg_version';\n\t\t";
					$upstream .= "my \$KX_${pkg_ref}_VERSION_M='$ver_m';\n\t\t";
					$upstream .= "my \$KX_${pkg_ref}_VERSION_MM='$ver_mm';\n\t\t";
					$upstream .= "my \$KX_${pkg_ref}_VERSION_MMM='$ver_mmm';\n\t\t";
					$upstream .= "my \$KX_${pkg_ref}_VERSION_USCORE='$ver_uscore';\n\t\t";
					$upstream .= "my \$url=\"$url\";\n\t\t" if $url;
					$upstream .= "return kxver_scrape_url('$pkg_name', \"\$url\");";

	}

	my $www = $yaml_pkg->{'www'} || '';
	my $news = '';
	my $changelog = '';
	my $source = '';

	my $wiz_url = 'return kxver_wiz_url @_';

	my $wiz_changelog;
	if (!$wiz_changelog) { $wiz_changelog = $yaml_pkg->{'changelog'}; }
	if (!$wiz_changelog) { $wiz_changelog = $yaml_pkg->{'git'}; }

	my $wiz_can_diff = 1;

	my $wiz_yaml = '';

	if ((defined $version) && ($version)) {
		while ( my ($key, $value) = each(%$version) ) {
			given ($key) {
				when ("sensitive") {
					$sensitive = $value;
				}
				when ("hold") {
					$hold = $value;
				}
				when ("installed") {
					$installed = $value;
					$installed .= ";";
				}
				when ("installed_na") {
					$installed = "return 'n/a';";
				}
				when ("installed_sh_trailing") {
					$installed = "kxver_sh_trailing('$value');";
				}
				when ("installed_sh_version") {
					$installed = "kxver_sh_version('$value');";
				}
				when ("installed_sh_v") {
					$installed = "kxver_sh_v('$value');";
				}
				when ("installed_pkgconfig") {
					my $p = defined $value ? $value : $pkg_name;
					$installed = "return kxver_pkgconfig('$p');";
				}
				when ("installed_config") {
					my $p = defined $value ? $value : $pkg_name;
					$installed = "return kxver_config('$p');";
				}
				when ("upstream") {
					$upstream = "my \$KX_${pkg_ref}_VERSION='$pkg_version';\n\t\t";
					$upstream .= "my \$KX_${pkg_ref}_VERSION_M='$ver_m';\n\t\t";
					$upstream .= "my \$KX_${pkg_ref}_VERSION_MM='$ver_mm';\n\t\t";
					$upstream .= "my \$KX_${pkg_ref}_VERSION_MMM='$ver_mmm';\n\t\t";
					$upstream .= "my \$KX_${pkg_ref}_VERSION_USCORE='$ver_uscore';\n\t\t";
					$upstream .= "my \$url=\"$url\";\n\t\t" if $url;
					$upstream .= defined $value ? $value : "return kxver_scrape_url('$pkg_name', \"\$url\");";
					$upstream .= ";";
				}
				when ("upstream_gnome") {
					my $p = $value ? $value : $pkg_name;
					$news = "NEWS";
					$changelog = "ChangeLog";
					$source = "https://git.gnome.org/browse/$p";
					$upstream = "return kxver_upstream_gnome('$p');";
				}
				when ("upstream_pypi") {
					my $p = $value ? $value : $pkg_name;
					$upstream = "return kxver_upstream_pypi('$p');";
				}
				when ("upstream_gnome_uneven") {
					my $p = $value ? $value : $pkg_name;
					$news = "NEWS";
					$changelog = "ChangeLog";
					$source = "https://git.gnome.org/browse/$p";
					$upstream = "return kxver_upstream_gnome_uneven('$p');";
				}
				when ("upstream_gnu") {
					my $p = $value ? $value : $pkg_name;
					$upstream = "return kxver_scrape_ftp('ftp.gnu.org', \"gnu/$p\", qr|$p-([0-9]+\\.+[0-9.]*[0-9]+)|);";
				}
				when ("news") {
					$news = $value;
				}
				when ("url") {
					$url = $value;
				}
				when ("changelog") {
					$changelog = $value;
				}
				when ("source") {
					$source = $value;
				}
				when ("wiz_savannah") {
					my $p = $value ? $value : $pkg_name;
					$news ||= "http://savannah.gnu.org/news/?group=$p";
					$source ||= "http://git.savannah.gnu.org/cgit/$p.git";
				}
				when ("wiz_sourceware") {
					my $p = $value ? $value : $pkg_name;
					$source ||= "https://sourceware.org/git/gitweb.cgi?p=$p.git";
				}
				when ("wiz_url") {
					$wiz_url = $value;
				}
				when ("wiz_can_diff") {
					$wiz_can_diff = $value;
				}
				when ("wiz_yaml") {
					$wiz_yaml = "my \$KX_${pkg_ref}_VERSION='$pkg_version';\n\t\t";
					$wiz_yaml .= "my \$KX_${pkg_ref}_VERSION_M='$ver_m';\n\t\t";
					$wiz_yaml .= "my \$KX_${pkg_ref}_VERSION_MM='$ver_mm';\n\t\t";
					$wiz_yaml .= "my \$KX_${pkg_ref}_VERSION_MMM='$ver_mmm';\n\t\t";
					$wiz_yaml .= "my \$KX_${pkg_ref}_VERSION_USCORE='$ver_uscore';\n\t\t";
					$wiz_yaml .= $value;
				}
				default {
					die "*** Unknown directive [${key}] for [version] in [${pkg_name}]\n";
				}
			}
		}
	}
	$url ||= '';
	$file ||= '';
	$url =~ s|\$|\\\$|g if $url;
	$file =~ s|\$|\\\$|g if $file;

	$source =~ s|\$|\\\$|g if $source;
	$news =~ s|\$|\\\$|g if $news;

	$verify ||= '';

	$wiz_changelog ||= '';
	$wiz_changelog =~ s|\$|\\\$|g if $wiz_changelog;
	$wiz_yaml ||= 0;
	if ($wiz_yaml) { $wiz_yaml = "sub() { $wiz_yaml }"; }
	print VERSION_SCRIPT << "eof_version_script";
\$package_versions{'$pkg_name'} = {
	"www" => "$www",
	"url" => "$url",
	"sensitive" => $sensitive, 
	"verify" => "$verify",
	"hold" => $hold, 
	"kxversion" => "$pkg_version",
	"installed" => sub() { $installed },
	"upstream" => sub() { $upstream },
	"url" => "$url",
	"file" => "$file",
	"news" => "$news",
	"changelog" => "$changelog",
	"source" => "$source",
	"wiz_url" => sub() { $wiz_url },
	"wiz_changelog" => "${wiz_changelog}",
	"wiz_can_diff" => ${wiz_can_diff},
	"wiz_yaml" => ${wiz_yaml},
};
eof_version_script
}

# ============================================================
sub verify_cli {
	my ($key, $pkg, $value) = @_;
	my $f = "${KX_TOP}/verify/${key}/tests/${pkg}.exp";
	print "\tCreating [$f]\n" if $debug;
	open VERIFY_SCRIPT, ">${f}" or die $!;
	print VERIFY_SCRIPT "$value";
	close VERIFY_SCRIPT;

}

# ============================================================
sub verify_gui {
	my ($key, $pkg, $value) = @_;
	my $f = "${KX_TOP}/verify/${key}/tests/${pkg}.test";
	print "\tCreating [$f]\n" if $debug;
	open VERIFY_SCRIPT, ">${f}" or die $!;
	print VERIFY_SCRIPT $value;
	close VERIFY_SCRIPT;
}

# ============================================================
sub one_package {
	my ($pkg, $file) = @_;
	print "Processing package [$pkg] in [$file]\n" if $debug;
	my $yaml = YAML::Tiny->read($file);
	if (!defined $yaml) {
		die "Could not read YAML for [${pkg}] in [${file}]: ". YAML::Tiny->errstr;
	}

	$yaml0=$yaml->[0];
	print "YAML [$file]\n" if $debug;
	print Dumper($yaml0) if $debug;


	my $yaml_perl_modules=$yaml0->{"perl_modules"};
	if (defined $yaml_perl_modules) {
		perl_modules $pkg, $file, $yaml_perl_modules;
		return;
	}

	my $yaml_haskell_modules=$yaml0->{"haskell_modules"};
	if (defined $yaml_haskell_modules) {
		haskell_modules $pkg, $file, $yaml_haskell_modules;
		return;
	}

	my $yaml_pkg=$yaml0->{"package"};
	if (!defined $yaml_pkg) {
		print Dumper($yaml);
		die "No [package] directive for [${pkg}] in [${file}]\n";
	}
	my $pkg_name=$yaml_pkg->{"name"};
	die "No [package:name] directive for [${pkg}] in [${file}]\n" unless defined $pkg_name;
	die "Wrong [package:name] = [${pkg_name}] in [${file}]\n" unless (($pkg_name eq $pkg) || ($pkg_name eq 'xorg-utils'));
	my $pkg_version=$yaml_pkg->{"version"};
	die "No [package:version] directive for [${pkg}] in [${file}]\n" unless defined $pkg_version;

	my $pkg_ref = pkg_ref_from_name $pkg_name;

	my $xorg =  $yaml0->{"xorg"};
	if ($xorg) {
		xorg_package $pkg_name, $xorg;
		return;
	}

	my $download = $yaml0->{"download"};
	if (!$download) {
		if ($Config{'archname'} =~ /^x86_64/) {
			$download = $yaml0->{"download_64"};
		} else {
			$download = $yaml0->{"download_32"};
		}
	}
	die "*** No [download] directive for [${pkg}] in [${file}]\n" unless $download;
	my @download = pkg_download_definition $pkg_name, $pkg_version, $pkg_ref, $file, $download;
	print "Download: @download\n" if $debug;

	my $bs = 0;
	while ( my ($key, $value) = each(%$yaml0) ) { $bs=1 if ($key =~ /bootstrap_.?/)	}

	my $additional_downloads = $yaml0->{"additional_downloads"};
	if ($additional_downloads) { $additional_downloads = additional_downloads($pkg_ref, $pkg_name, $bs, $additional_downloads); }

	one_package_download @download, $bs;

	if (!exists($yaml0->{"version"})) { version_info $pkg_ref, $pkg_name, $pkg_version, $download[3], $download[1], $download[4], 0, $yaml_pkg; }

	while ( my ($key, $value) = each(%$yaml0) ) {
		given ($key) {
			when ("package") { }
			when ("lfs") { }
			when ("download") {  }
			when ("download_32") {  }
			when ("download_64") {  }
			when ("additional_downloads") { }
			when ("doc") { }
			when ("version") { version_info $pkg_ref, $pkg_name, $pkg_version, $download[3], $download[1], $download[4], $value, $yaml_pkg; }
			when (/bootstrap_[1-3]/) { one_bootstrap_step "host", $key, $pkg_name, $pkg_ref, $value; }
			when (/bootstrap_[4-8]/) { one_bootstrap_step "chroot", $key, $pkg_name, $pkg_ref, $value; }
			when (/linux/) { all_linux_steps "linux", $key, $pkg_name, $pkg_ref, $value, $additional_downloads, @download; }
			when (/opt/) { all_linux_steps "opt", $key, $pkg_name, $pkg_ref, $value, $additional_downloads, @download; }
			when (/verify_cli/) { verify_cli $key, $pkg_name, $value; }
			when (/verify_gui/) { verify_gui $key, $pkg_name, $value; }
			default { die "*** unknown directive [$key] for [${pkg}] in [${file}]\n"; }
		}
	}
}

# ============================================================
sub build_package_scripts {

	my $packages="${KX_TOP}/master/packages";
 	@subdirs = <$packages/*>;
	die "*** No package subdirs found in [${packages}]\n" unless @subdirs;

	print DOWNLOAD_ALL_SCRIPT "kx_step_echo Downloading all packages\n";
	print DOWNLOAD_BOOTSTRAP_SCRIPT "kx_step_echo Downloading bootstrap packages\n";

	foreach $subdir (@subdirs) {
	 	@files = <$subdir/*.yaml>;
		die "*** No packages found in [${subdir}]\n" unless @files;
		foreach my $file (@files) {
			my $pkg=basename($file,  ".yaml" );
			one_package $pkg, $file;
		} 
	} 

	print DOWNLOAD_ALL_SCRIPT "\necho\n";
	print DOWNLOAD_ALL_SCRIPT "kx_echo All packages downloaded\n";
	print DOWNLOAD_BOOTSTRAP_SCRIPT "\necho\n";
	print DOWNLOAD_BOOTSTRAP_SCRIPT "kx_echo Bootstrap packages downloaded\n";

}


# ============================================================

sub build_verify {

	open GPG_FILE, "<${KX_TOP}/master/gpg_keys.txt" or die $!;

	my $dldir = '${KX_BASE}/../downloads/gpg_keys';
	my $gpgdir = '${KX_BASE}/gpg';

	one_download_print "if ! command -V gpg 2>/dev/null; then", 1;
		one_download_print "kx_echo 'gpg not found; not verifying signatures'", 1;
	one_download_print "else", 1;

		one_download_print "\nkx_step_echo Updating GPG keyring\n", 1;

		one_download_print "\nif ! test -d \"${gpgdir}\"; then", 1;
		one_download_print "kx_echo Creating GPG keyring directory\n", 1;
		one_download_print "mkdir -pv \"${gpgdir}\"", 1;
		one_download_print "chmod go-rwx \"${gpgdir}\"", 1;
		one_download_print "fi", 1;

		one_download_print "mkdir -pv \"${dldir}\"", 1;
		while (<GPG_FILE>) {
			s/#.*//;            # ignore comments by erasing them
			next if /^(\s)*$/;  # skip blank lines
			chomp;
			my ($keyid, $fingerprint) = split(':', $_);
			one_download_print "\necho", 1;
			one_download_print "kx_import_key $keyid $fingerprint", 1;
		}
		#one_download_print "\ngpg --update-trustdb --homedir=\"${gpgdir}\"", 1;
		close GPG_FILE;

	one_download_print "fi\n", 1;

}


# ============================================================

if ($#ARGV<0) {
	usage;
	die "*** Please give path to kaarpux as argument\n";
}

$KX_TOP=$ARGV[0];

my $definition_script = create_definition_script;
my $download_bootstrap_script = create_download_bootstrap_script;
my $download_all_script = create_download_all_script;
my $version_script = create_version_script;

build_verify;

build_package_scripts;

close_and_copy_scripts $definition_script, $download_bootstrap_script, $download_all_script, $version_script;

