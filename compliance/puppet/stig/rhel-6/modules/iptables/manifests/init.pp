############################################################
# Class: iptables
#
# Description:
#
# Variables:
#	shared::dnsserver
#	shared::ftpserver
#	shared::krbserver
#	shared::ldapserver
#	shared::mailserver
#	shared::nfsserver
#	shared::puppetserver
#	shared::syslogserver
#
# Facts:
#       None
#
# Files:
#       None
#
# Templates:
#       None
#
# Dependencies:
#       None
############################################################
class iptables {
	file {
		"/etc/sysconfig/iptables":
			owner   => root,
			group   => root,
			mode    => 600,
			notify  => Service["iptables"],
			content => template("iptables/iptables.erb");
		"/etc/sysconfig/iptables-config":
			owner  => root,
			group  => root,
			mode   => 600,
			notify  => Service["iptables"],
			source => "puppet:///modules/iptables/iptables-config";
	}

	service {
		[
			"iptables",
		]:
			ensure => true,
			enable => true,
			hasstatus => true;
	}
}
