
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2013: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

# 
# Common testing procedures
#


# ========================================
# kx_cli_success args
#	spawn $args
#	verify that it returns success as returncode

proc kx_cli_success args {

	if [catch "spawn $args" reason] then { fail "spawning \[$args\] failed: $reason"; return }
	expect {
		eof {}
		timeout { fail "$args TIMEOUT"; return }
	}
	catch wait result
	if [lindex $result 3] then \
        { print [string trim $expect_out(buffer)]; fail "$args" 
	} else { pass "$args" }
}


# ========================================
# kx_cli_rc args rc
#	spawn $args
#	verify that it returns $rc as returncode

proc kx_cli_rc { args rc } {

	if [catch "spawn $args" reason] then { fail "spawning \[$args\] failed: $reason"; return }
	expect {
		eof {}
		timeout { fail "$args TIMEOUT"; return }
	}
	catch wait result
	if { [lindex $result 3] == $rc } then \
	{ pass "$args"
        } else { print [string trim $expect_out(buffer)]; fail "$args" }
}


# ========================================
# kx_cli_failure args
#	spawn $args
#	verify that it returns failure as returncode

proc kx_cli_failure args {

	if [catch "spawn $args" reason] then { fail "spawning \[$args\] failed: $reason"; return }
	expect {
		eof {}
		timeout { fail "$args TIMEOUT"; return }
	}
	catch wait result
	if [lindex $result 3] then \
	{ xfail "$args"
	} else { print [string trim $expect_out(buffer)]; xpass "$args" }
}


# ========================================
# kx_cli_match_success cmd match
#	spawn $cmd
#	look for each string in match in sequence one-by-one
#	verify that $cmd returned success as returncode

proc kx_cli_match_success { cmd match } {
	if [catch "spawn $cmd" reason] then { fail "spawning \[$cmd\] failed: $reason"; return }
	foreach m $match { 
		expect {
			$m {}
			eof { fail "$cmd DID NOT MATCH $m"; return }
			timeout { fail "$cmd TIMEOUT"; return }
		}
	}
	expect {
		eof {}
		timeout { fail "$cmd TIMEOUT"; return }
	}
	catch wait result
	if [lindex $result 3] then \
        { print [string trim $expect_out(buffer)]; fail "$cmd" 
	} else { pass "$cmd" }
}


# ========================================
# kx_cli_send_success cmd snd
#	spawn $cmd
#	send it each string in $snd in sequence one-by-one, each followed by newline
#	send it Ctrl-D (i.e. EOF)
#	verify that $cmd returned success as returncode

proc kx_cli_send_success { cmd snd } {
	if [catch "spawn $cmd" reason] then { fail "spawning \[$cmd\] failed: $reason"; return }
	foreach s $snd { send $s; send "\r" } 
	send "\004"
	send "\004"
	expect {
		eof {}
		timeout { fail "$cmd TIMEOUT"; return }
	}
	catch wait result
	if [lindex $result 3] then \
        { print [string trim $expect_out(buffer)]; fail "$cmd" 
	} else { pass "$cmd" }
}

# ========================================
# kx_cli_send_match_success cmd snd match
#	spawn $cmd
#	send it each string in $snd in sequence one-by-one, each followed by newline
#	send it Ctrl-D (i.e. EOF)
#	look for each string in $match in sequence one-by-one
#	verify that $cmd returned success as returncode

proc kx_cli_send_match_success { cmd snd match } {
	if [catch "spawn $cmd" reason] then { fail "spawning \[$cmd\] failed: $reason"; return }
	foreach s $snd { send $s; send "\r" } 
	send "\004"
	send "\004"
	foreach m $match { 
		expect {
			$m {}
			eof { fail "$cmd DID NOT MATCH $m"; return }
			timeout { fail "$cmd TIMEOUT"; return }
		}
	}
	expect {
		eof {}
		timeout { fail "$cmd TIMEOUT"; return }
	}
	catch wait result
	if [lindex $result 3] then \
        { print [string trim $expect_out(buffer)]; fail "$cmd" 
	} else { pass "$cmd" }
}


# ========================================
# kx_cli_sh pkg filename
#	execute shell script in $filename from package $pkg
#	verify that it returns success as returncode

proc kx_cli_sh { pkg filename } {
  set fn [ string tolower [ string index $pkg 0 ] ]
  set fn "../../master/packages/$fn/$pkg.files/$filename"
  kx_cli_success "$fn"
}
