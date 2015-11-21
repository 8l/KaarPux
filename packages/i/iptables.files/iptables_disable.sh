#!/bin/sh

read -p "Do you really want to disable the iptables FireWall (yes/no)? " yn
case $yn in
	[Yy][eE][sS]) break;;
	*) echo "OK, doing nothing."; exit 1;;
esac


for T in $(cat /proc/net/ip_tables_names); do
	echo "Updating policy of chains in table [$T] to [ACCEPT]"
	for C in $(iptables -t $T -L | grep "^Chain" | cut -f2 -d" "); do
		iptables -t $T -P $C ACCEPT
	done
done

# Remove all chains in all tables
for T in $(cat /proc/net/ip_tables_names); do
	echo "Removing all chain contents in table [$T]"
	iptables -t $T -F
	iptables -t $T -X
	iptables -t $T -Z
done

