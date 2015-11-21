#!/bin/sh

echo "Update GNOME desktop database for /opt"
update-desktop-database /opt/share/applications/
gtk-update-icon-cache
