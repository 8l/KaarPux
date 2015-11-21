if [ -z "$LANG" ]; then
	for L in /etc/sysconfig/i18n "$HOME/.i18n"; do
		[ -f "$L" ] && . $L
		[ -n "$LANG" ] && export LANG
		[ -n "$LC_ALL" ] && export LC_ALL
		[ -n "$LINGUAS" ] && export LINGUAS
		[ -n "$LANG" ] && export LANG
	done
fi

