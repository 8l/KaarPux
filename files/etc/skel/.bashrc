# Do not do anything for non-interactive shells
[ -z "$PS1" ] && return

# Set prompt to user@host$
PS1="\\u@\h\\$ "

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
