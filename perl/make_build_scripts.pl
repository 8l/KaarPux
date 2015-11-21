#!/usr/bin/perl
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2012-2013: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

my $debug=0;
# my $debug=1;

use File::Basename;
use Data::Dumper;
use YAML::Tiny;

use feature "switch";
no if $] >= 5.018, warnings => "experimental::smartmatch";

# ============================================================

# CALL GRAPH

# main
#   usage
#   build_bootstrap_scripts
#     build_phase_scripts
#       build_prepare_bootstrap
#       build_host_bootstrap
#       build_chroot_bootstrap
#   build_linux_scripts
#     build_the_linux_scripts
#       build_one_linux_script
#         build_one_linux_pkg_seq
#           xorg_pkg
#             xorg_modules


# ============================================================

my $KX_TOP;
my $pass;

# ============================================================

sub usage {
warn "Usage: $0 path-to-kaarpux bootstrap|linux\n"
}


# ============================================================
sub build_host_bootstrap {
	my ($bootstrap, $definition, $file, $parallel) = @_;
	my $par = $parallel ? "_parallel" : "";

	print $file "\nkx_log KX_BLD_STEP HOST BOOTSTRAP: ${bootstrap}\n" unless $parallel;

	foreach $hash (@$definition) {
		while ( my ($key, $value) = each(%$hash) ) {
			given ($key) {
				if ($key eq "parallel") {
					if ($parallel) { die "*** [${bootstrap}]: Nested [parallel] directives not allowed\n"; }
					print $file "\nkx_parallel_start ${bootstrap}\n";
					build_host_bootstrap($bootstrap, $value, $file, 1);
					print $file "kx_parallel_end ${bootstrap}\n\n";
					next;
				}
				when ("pkg") { print $file "kx_build_host_pkg${par} host ${bootstrap} ${value}\n" }
				when ("script") { print $file "kx_exe_host_script ${bootstrap} ${value}\n" }
				when ("sudo") { print $file "kx_exe_host_sudo ${bootstrap} ${value}\n" }
				default { die "*** unknown directive [${key}] for [${bootstrap}]\n"; }
			}
		}
	}
}


# ============================================================
sub build_chroot_bootstrap {
	my ($tools, $bootstrap, $definition, $file, $parallel) = @_;
	my $par = $parallel ? "_parallel" : "";

	print $file "\nkx_log KX_BLD_STEP CHROOT BOOTSTRAP: ${bootstrap}\n" unless $parallel;

	foreach $hash (@$definition) {
		while ( my ($key, $value) = each(%$hash) ) {
			given ($key) {
				if ($key eq "parallel") {
					if ($parallel) { die "*** [${bootstrap}]: Nested [parallel] directives not allowed\n"; }
					print $file "\nkx_parallel_start ${bootstrap}\n";
					build_chroot_bootstrap($tools, $bootstrap, $value, $file, 1);
					print $file "kx_parallel_end ${bootstrap}\n\n";
					next;
				}
				when ("pkg") { print $file "kx_build_chroot_pkg${par} \"${tools}\" ${bootstrap} ${value}\n" }
				when ("perl_module") { print $file "kx_build_chroot_pkg${par} \"${tools}\" ${bootstrap} PERLMODULE_${value}\n" }
				when ("script") { print $file "kx_exe_chroot_script \"${tools}\" ${bootstrap} ${value}\n" }
				when ("sh") { print $file "${value}\n" }
				when ("exit") { print $file "exit\n" }
				default { die "*** unknown directive [${key}] for [${bootstrap}]\n"; }
			}
		}
	}
}

# ============================================================
sub build_phase_scripts {
	my ($phase, $phase_def) = @_;
	my $file="${KX_TOP}/bootstrap/host_scripts/complete_bootstrap.sh";
	print "\tCreating [${file}]\n" if $debug;

	open BOOTSTRAP_FILE, ">${file}" or die $!;
	print BOOTSTRAP_FILE <<"eof_bootstrap_file";
#!/bin/sh

set -o nounset
set -o errexit

KX_BASE="\$(cd \$(dirname "\$0")/..; pwd -P)"
. "\${KX_BASE}/shinc/bootstrap.shinc"
kx_ensure_runas_root

if test "\${1:-unset}" = "RECURSIVE_SH"; then
	shift
	rm -f "\${KX_BASE}/.kaarpux_log_pipe"
else
	rm -f "\${KX_BASE}/.kaarpux_log_pipe"
	mkfifo "\${KX_BASE}/.kaarpux_log_pipe"
	touch "\${KX_BASE}/../build.log"
	tee < "\${KX_BASE}/.kaarpux_log_pipe" --append "\${KX_BASE}/../build.log" &
	kx_sar_start bootstrap
	"time" \\
		--format="D \$(date +%F_%T) KX_BLD_TIME %E = %e elapsed; %U user; %S sys; %P cpu" \\
		"\$0" "RECURSIVE_SH" "\$@" \\
		> "\${KX_BASE}/.kaarpux_log_pipe" 2>&1
	kx_sar_stop bootstrap
	exit 0
fi

trap 'kx_unlock_and_kill_children; exit 1' INT HUP TERM QUIT EXIT

kx_log KX_BLD_STRT "Building phase [${phase}] starting"
kx_identify

cd "\${KX_BASE}"

eof_bootstrap_file

	foreach $hash (@$phase_def) {
		while ( my ($key, $value) = each(%$hash) ) {
			given ($key) {
				when (/^bootstrap_[1-3]$/) { build_host_bootstrap $key, $value, BOOTSTRAP_FILE, 0; }
				when (/^bootstrap_[4-7]$/) { build_chroot_bootstrap "tools_", $key, $value, BOOTSTRAP_FILE, 0; }
				when (/^bootstrap_8$/) { build_chroot_bootstrap "", $key, $value, BOOTSTRAP_FILE, 0; }
				default { die "*** unknown directive [$key] for [$phase]\n"; }
			}
			print BOOTSTRAP_FILE "\ncd \${KX_BASE}\n";
			print BOOTSTRAP_FILE "test -n \"\${KX_KEEP_BUILD_DIRECTORIES:-}\" || rm -rf \${KX_BASE}/build/${key}/*\n";
		}
	}

	print BOOTSTRAP_FILE "kx_log KX_BLD_DONE \"Building phase [${phase}] complete\"\n";
        print BOOTSTRAP_FILE "trap '' INT HUP TERM QUIT EXIT\n";
	close BOOTSTRAP_FILE;
	chmod 0744, "${file}" or die $!;

}



# ============================================================
sub build_bootstrap_scripts {
	my ($phase) = @_;
	my $file = "${KX_TOP}/master/master.yaml";
	print "Processing phase [$phase] in [$file]\n" if $debug;
	my $yaml = YAML::Tiny->read($file);
	my $yaml0=$yaml->[0];
	my $found;
	foreach $hash (@$yaml0) {
		my $phase_def = $hash->{$phase};
		next unless defined $phase_def;
		$found = 1;
		build_phase_scripts $phase, $phase_def;
	}
	die "No [${phase}] directive in [${file}]\n" unless $found;
}

# ============================================================
sub xorg_modules {
	my ($pkg_name, $group, $yaml) = @_;
	my $was_parallel = 0;
	my @modules = split(/\n/, $yaml);
	foreach $par_md5_module_file  (@modules) {
		next if $par_md5_module_file =~ /^\s+$/;
		my ($parallel, $md5, $module_file) = ($par_md5_module_file =~ /\s*(\S*)\s+(\S*)\s+(\S*)\s*/);
		my ($module_name, $version) = ($module_file =~ /(.*)-([0-9\.]*)\.tar\.bz2/);
		if ($parallel =~ /[pP]/) {
			if ($was_parallel) { print LINUX_FILE "kx_parallel_end linux\n"; }
			print LINUX_FILE "kx_parallel_start linux\n";
			$was_parallel = 1;
		} elsif ($parallel eq '1') {
			if ($was_parallel) { print LINUX_FILE "kx_parallel_end linux\n"; }
		} elsif ($parallel eq '.') {
		}
		my $par = $was_parallel ? "_parallel" : "";
		print LINUX_FILE "test \"\${FIRST_PACKAGE}\" = \"${module_name}\" && CONTINUE_BUILD=Y\n";
		print LINUX_FILE "test -n \"\${CONTINUE_BUILD}\" && kx_build_linux_pkg${par} linux ${module_name}\n";
	}

	if ($was_parallel) { print LINUX_FILE "kx_parallel_end linux\n"; }
}

# ============================================================
sub xorg_pkg {
	my ($pkg_name) = @_;
	my $p1 = lc (substr $pkg_name, 0, 1);

	my $file = "${KX_TOP}/master/packages/${p1}/${pkg_name}.yaml";
	my $yaml = YAML::Tiny->read($file);
	die "*** Invalid package file [${file}]\n" unless $yaml;
	my $yaml0=$yaml->[0];
	my $xorg =  $yaml0->{"xorg"};
	die "*** Package file [${file}] does not look like an xorg package\n" unless $xorg;

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
sub build_one_linux_pkg_seq {
	my ($where, $phase, $phase_def, $file, $parallel) = @_;
	my $par = $parallel ? "_parallel" : "";
	foreach $hash (@$phase_def) {
		while ( my ($key, $value) = each(%$hash) ) {
			if ($key eq "parallel") {
				if ($parallel) { die "*** [${phase}]: Nested [parallel] directives not allowed\n"; }
				print $file "\nkx_parallel_start $phase\n";
				build_one_linux_pkg_seq($where, $phase, $value, $file, 1);
				print $file "kx_parallel_end $phase\n\n";
				next;
			}
			#print "XXX $key\n";
			$value =~ s/#.+$//;
			$value =~ s/\s+$//;
			print $file "test \"\${FIRST_PACKAGE}\" = \"${value}\" && CONTINUE_BUILD=Y\n";
			given ($key) {
				when ("pkg") { print $file "test -n \"\${CONTINUE_BUILD}\" && kx_build_linux_pkg${par} ${where} ${value}\n" }
				when ("perl_module") { print $file "test -n \"\${CONTINUE_BUILD}\" && kx_build_linux_pkg${par} ${where} PERLMODULE_${value}\n" }
				when ("haskell_module") { print $file "test -n \"\${CONTINUE_BUILD}\" && kx_build_linux_pkg${par} ${where} HASKELLMODULE_${value}\n" }
				when ("xorg_pkg") { xorg_pkg $value }
				when ("script") { print $file "test -n \"\${CONTINUE_BUILD}\" && kx_exe_${where}_script${par} ${value}\n" }
				when ("sudo") { print $file "test -n \"\${CONTINUE_BUILD}\" && kx_exe_${where}_sudo${par} ${value}\n" }
				when ("exit") { print $file "exit\n" }
				default { die "*** unknown directive [$key] for [$phase]\n"; }
			}
		}
	}
}

# ============================================================
sub build_one_linux_script {
	my ($where, $phase, $phase_def) = @_;
	my $file="${KX_TOP}/linux/scripts/complete_$phase.sh";
	print "\tCreating [${file}]\n" if $debug;

	my $runas = ($where eq "linux") ? "kx_ensure_runas_root" : "kx_ensure_runas_kaarpux";
	open LINUX_FILE, ">${file}" or die $!;
	print LINUX_FILE <<"eof";
#!/bin/sh

set -o nounset
set -o errexit

KX_BASE="\$(cd \$(dirname "\$0")/..; pwd -P)"
. "\${KX_BASE}/shinc/linux.shinc"
${runas}

if test "\${1:-unset}" = "RECURSIVE_SH"; then
	shift
	rm -f "\${KX_BASE}/.kaarpux_log_pipe"
else
	rm -f "\${KX_BASE}/.kaarpux_log_pipe"
	mkfifo "\${KX_BASE}/.kaarpux_log_pipe"
	touch "\${KX_BASE}/../build.log"
	tee < "\${KX_BASE}/.kaarpux_log_pipe" --append "\${KX_BASE}/../build.log" &
	kx_sar_start ${phase}
	"time" \\
		--format="D \$(date +%F_%T) KX_BLD_TIME %E = %e elapsed; %U user; %S sys; %P cpu" \\
		"\$0" "RECURSIVE_SH" "\$@" \\
		> "\${KX_BASE}/.kaarpux_log_pipe" 2>&1
	kx_sar_stop ${phase}
	exit 0
fi

trap 'kx_unlock_and_kill_children; exit 1' INT HUP TERM QUIT EXIT

kx_log KX_BLD_STRT "Building phase [${phase}] starting"
kx_identify

FIRST_PACKAGE="\${1:-}"
CONTINUE_BUILD="Y"
test -n "\${FIRST_PACKAGE}" && CONTINUE_BUILD=""

cd "\${KX_BASE}"

eof

	build_one_linux_pkg_seq($where, $phase, $phase_def, LINUX_FILE, 0);
	print LINUX_FILE "test -n \"\${CONTINUE_BUILD}\" || echo \"No such package: [\${FIRST_PACKAGE}]\"\n";
	print LINUX_FILE "kx_log KX_BLD_DONE \"Building phase [${phase}] complete\"\n";
        print LINUX_FILE "trap '' INT HUP TERM QUIT EXIT\n";

	close LINUX_FILE;
	chmod 0744, "${file}" or die $!;

}



# ============================================================
sub build_the_linux_scripts {
	my ($phase, $phase_def) = @_;

	foreach $hash (@$phase_def) {
		while ( my ($key, $value) = each(%$hash) ) {
			given ($key) {
				when (/^linux_.*/) { build_one_linux_script "linux", $key, $value; }
				when (/^opt_.*/) { build_one_linux_script "opt", $key, $value; }
				default { die "*** unknown directive [$key] for [$phase]\n"; }
			}
		}
	}
}

# ============================================================



# ============================================================
sub build_linux_scripts {
	my ($phase) = @_;
	my $file = "${KX_TOP}/master/master.yaml";
	print "Processing phase [$phase] in [$file]\n" if $debug;
	my $yaml = YAML::Tiny->read($file);
	my $yaml0=$yaml->[0];
	my $found;
	foreach $hash (@$yaml0) {
		my $phase_def = $hash->{$phase};
		next unless defined $phase_def;
		$found = 1;
		build_the_linux_scripts $phase, $phase_def;
	}
	die "No [${phase}] directive in [${file}]\n" unless $found;
}

# ============================================================

;

# ============================================================

if ($#ARGV<1) {
	usage;
	die "*** Please give path to kaarpux as first argument and 'bootstrap' or 'linux' as second argument";
}

$KX_TOP=$ARGV[0];
$pass=$ARGV[1];

given ($pass) {
	when ("bootstrap") {build_bootstrap_scripts $pass; }
	when ("linux") { build_linux_scripts $pass; }
	default { usage; die "*** Please specify 'bootstrap' or 'linux' as second argument"; }
}


