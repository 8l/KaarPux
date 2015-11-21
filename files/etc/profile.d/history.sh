# Do not do anything for non-interactive shells
[ -z "$PS1" ] && return

# Only set history options in bash shell (not in e.g. dash)
[ -z "$BASH" ] && return

# Append to history (instead of overwriting); do not keep duplicates around
HISTSIZE=5000; export HISTSIZE
HISTCONTROL=erasedups; export HISTCONTROL
shopt -s histappend
