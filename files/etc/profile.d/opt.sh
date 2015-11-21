if [ $(id -u) -ge 1000 ]; then
	PATH="$PATH:/opt/sbin:/opt/bin"; export PATH
	MANPATH="$MANPATH:/opt/man:/opt/share/man"; export MANPATH
	LD_LIBRARY_PATH="/local/lib:/lib:/opt/lib"; export LD_LIBRARY_PATH
	PKG_CONFIG_PATH="/opt/lib/pkgconfig:/opt/share/pkgconfig"; export PKG_CONFIG_PATH
	XDG_CONFIG_DIRS="/etc/xdg"; export XDG_CONFIG_DIRS
	XDG_DATA_DIRS="/local/share:/share:/opt/share"; export XDG_DATA_DIRS
fi
