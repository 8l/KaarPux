#!/bin/sh

# Insert connection-tracking modules
# (not needed if built into the kernel)
#modprobe ip_tables
#modprobe iptable_filter
#modprobe ip_conntrack
#modprobe ip_conntrack_ftp
#modprobe ipt_state
#modprobe ipt_LOG

# Enable broadcast echo Protection
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

# Disable Source Routed Packets
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
echo 0 > /proc/sys/net/ipv4/conf/default/accept_source_route

# Enable TCP SYN Cookie Protection
echo 1 > /proc/sys/net/ipv4/tcp_syncookies

# Disable ICMP Redirect Acceptance
echo 0 > /proc/sys/net/ipv4/conf/default/accept_redirects

# Do not send Redirect Messages
echo 0 > /proc/sys/net/ipv4/conf/all/send_redirects
echo 0 > /proc/sys/net/ipv4/conf/default/send_redirects

# Drop Spoofed Packets coming in on an interface, where responses
# would result in the reply going out a different interface.
echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/default/rp_filter

# Log packets with impossible addresses.
echo 1 > /proc/sys/net/ipv4/conf/all/log_martians
echo 1 > /proc/sys/net/ipv4/conf/default/log_martians

# be verbose on dynamic ip-addresses  (not needed in case of static IP)
echo 2 > /proc/sys/net/ipv4/ip_dynaddr

# disable Explicit Congestion Notification
# too many routers are still ignorant
echo 0 > /proc/sys/net/ipv4/tcp_ecn

# disable automatic assignment of connection tracking helpers
echo 0 > /proc/sys/net/netfilter/nf_conntrack_helper

# Default to dropping everything
iptables -P INPUT   DROP
iptables -P FORWARD DROP
iptables -P OUTPUT  DROP

# Remove all chains in all tables
for T in $(cat /proc/net/ip_tables_names); do
	iptables -t $T -F
	iptables -t $T -X
	iptables -t $T -Z
done


# Allow local-only connections
iptables -A INPUT  -i lo -j ACCEPT

# Free output on any interface to any ip for any service
# (equal to -P ACCEPT)
iptables -A OUTPUT -j ACCEPT

# Permit answers on already established connections
iptables -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT

# Permit answers on expected, tracked connections
iptables -A INPUT -m conntrack --ctstatus EXPECTED -j ACCEPT

# Permit answers on related, tracked connections
iptables -A INPUT -m conntrack --ctstate RELATED -j ACCEPT

# Assign connection tracking helper for FTP
iptables -t raw -A OUTPUT -p tcp --dport 21 -j CT --helper ftp

# Assign connection tracking helper for NetBIOS NameService
iptables -t raw -A OUTPUT -p udp --dport 137:138 -j CT --helper netbios-ns

# Assign connection tracking helper for SNMP
iptables -t raw -A OUTPUT -p udp --dport 161 -j CT --helper snmp

# Allow mDNS multicast
iptables -A INPUT -p udp --dport 5353 -d 224.0.0.251 -j ACCEPT

# Avoid delays in FTP
iptables -A INPUT  -p tcp --dport 113 -j REJECT --reject-with tcp-reset

# Allow access to our SSH server
iptables -A INPUT  -m limit --limit 10/min -p tcp --dport 22 -j ACCEPT

# Silently drop DHCP (unless it was established from here; handled above)
iptables -A INPUT -p udp --sport 67:68 --dport 67:68 -j DROP

# Silently drop NetBIOS NameService (unless it was established from here; handled above)
iptables -A INPUT -p udp --sport 137:138 -j DROP
iptables -A INPUT -p udp --dport 137:138 -j DROP

# Pingable
iptables -A INPUT  -p icmp -m icmp --icmp-type echo-request -j ACCEPT
iptables -A OUTPUT -p icmp -m icmp --icmp-type echo-reply   -j ACCEPT

# do not filter on bridge interface
iptables -A FORWARD -p all -i br0 -j ACCEPT

# Log everything else just before the default DROP
# Packages are logged to the NFLOG interface,
# and may thus be processed further with ulogd
iptables -A INPUT -m limit --limit 600/min -j NFLOG --nflog-group 1
