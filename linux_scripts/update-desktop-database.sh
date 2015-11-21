#!/bin/sh

echo "Update GNOME desktop database, icon cache, and compiled schema"
update-desktop-database
gtk-update-icon-cache
glib-compile-schemas /share/glib-2.0/schemas/

