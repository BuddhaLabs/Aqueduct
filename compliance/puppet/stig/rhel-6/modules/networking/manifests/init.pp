############################################################
# Class: networking
#
# Description:
#	Sets up certain important files for network support
#
# Variables:
#	shared::dnsservers
#	shared::gateway
#
# Facts:
#	localinterface - custom fact created to work around em1 and eth0 detection
#	fqdn
#	macaddress
#	ipaddress
#	netmask
#
# Files:
#	None
#
# Templates:
#	networking/templates/ifcfg.erb
#	networking/templates/network.erb
#	networking/templates/resolv.conf.erb
#
# Dependencies:
#	iptables/lib/facter/localinterface.rb
############################################################
class networking {
	service {
		"network":
			ensure    => true,
			enable    => true,
			hasstatus => true;
	}

	file {
		"/etc/resolv.conf":
			owner   => root,
			group   => root,
			mode    => 644,
			content => template("networking/resolv.conf.erb");
		"/etc/sysconfig/network":
			owner   => root,
			group   => root,
			mode    => 644,
			content => template("networking/network.erb");
		"/etc/sysconfig/network-scripts/ifcfg-$localinterface":
			owner   => root,
			group   => root,
			mode    => 644,
			content => template("networking/ifcfg.erb");
	}
}
