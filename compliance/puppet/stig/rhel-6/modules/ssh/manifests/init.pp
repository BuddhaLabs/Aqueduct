############################################################
# Class: ssh
#
# Description:
#	The ssh module will setup and configure a working sshd.  It will
#	auto populate the ssh_known_hosts files using exported resources
#
# Variables:
#	shared::krbserver
#	shared::ldapserver
#	shared::mailserver
#	shared::nfsserver
#	shared::puppetserver
#
# Facts:
#	None
#
# Files:
#	None
#
# Templates:
#	authorized_keys.erb
#
# Dependencies:
#	None
# TODO:
#	Better documentation on how exported resources work
#	Be able to add static list to the auto generated known_hosts
############################################################
class ssh {
	service {
		"sshd":
			ensure    => true,
			enable    => true,
			hasstatus => true;
	}

	# This is an exported resource. This will enable all managed boxes to update their
	# ssh_known_hosts files automatically.

	# To add static hosts (i.e., not managed by puppet) add the following line
	# sshkey { "hostname": type => rsa, key => "dfafafdadfadfadfaf" } 
	@@sshkey {
		$fqdn:
			type => ssh-rsa,
			host_aliases => $fqdn ? {
				"ldap.domain.com"	=> [$hostname,"ldap","ldap.domain.com","syslog","syslog.domain.com","kerberos","kerberos.domain.com",$ipaddress],
				"mail.domain.com"	=> [$hostname,"mail","mail.domain.com","pop","pop.domain.com","smtp","smtp.domain.com",$ipaddress],
				"fileserver.domain.com"	=> [$hostname,"fileserver","fileserver.domain.com","nfs","nfs.domain.com",$ipaddress],
				"named.domain.com"	=> [$hostname,"named","named.domain.com",$ipaddress],
				"puppet.domain.com"	=> [$hostname,"puppet","puppet.domain.com",$ipaddress],
				default			=> [$hostname, $ipaddress]
			},
			key => $sshrsakey
	}

	Sshkey <<| |>>

	augeas {
		# RHEL-06-000227
		"Allow Only SSH Protocol 2":
			context => "/files/etc/ssh/sshd_config",
			lens    => "sshd.lns",
			incl    => "/etc/ssh/sshd_config",
			changes => [
				"set Protocol 2",
			];
		# RHEL-06-000230
		"Set SSH Idle Timeout Interval":
			context => "/files/etc/ssh/sshd_config",
			lens    => "sshd.lns",
			incl    => "/etc/ssh/sshd_config",
			changes => [
				"set ClientAliveInterval 900",
			];
		# RHEL-06-000231
		"Set SSH Client Alive Count":
			context => "/files/etc/ssh/sshd_config",
			lens    => "sshd.lns",
			incl    => "/etc/ssh/sshd_config",
			changes => [
				"set ClientAliveCountMax 0"
			];
		# RHEL-06-000234
		"Disable SSH Support for .rhosts Files":
			context => "/files/etc/ssh/sshd_config",
			lens    => "sshd.lns",
			incl    => "/etc/ssh/sshd_config",
			changes => [
				"set IgnoreRhosts yes"
			];
		# RHEL-06-000236
		"Disable Host-Based Authentication":
			context => "/files/etc/ssh/sshd_config",
			lens    => "sshd.lns",
			incl    => "/etc/ssh/sshd_config",
			changes => [
				"set HostbasedAuthentication no",
			];
		# RHEL-06-000237
		"Disable SSH Root Login":
			context => "/files/etc/ssh/sshd_config",
			lens    => "sshd.lns",
			incl    => "/etc/ssh/sshd_config",
			changes => [
				"set PermitRootLogin no",
			];
		# RHEL-06-000239
		"Disable SSH Access via Empty Passwords":
			context => "/files/etc/ssh/sshd_config",
			lens    => "sshd.lns",
			incl    => "/etc/ssh/sshd_config",
			changes => [
				"set PermitEmptyPasswords no",
			];
		# RHEL-06-000240
		"Enable SSH Warning Banner":
			context => "/files/etc/ssh/sshd_config",
			lens    => "sshd.lns",
			incl    => "/etc/ssh/sshd_config",
			changes => [
				"set Banner /etc/issue",
			];
		# RHEL-06-000241
		"Do Not Allow SSH Environment Options":
			context => "/files/etc/ssh/sshd_config",
			lens    => "sshd.lns",
			incl    => "/etc/ssh/sshd_config",
			changes => [
				"set PermitUserEnvironment no",
			];
		# RHEL-06-000507
		"Print the Last Successful Login Date and Time":
			context => "/files/etc/ssh/sshd_config",
			lens    => "sshd.lns",
			incl    => "/etc/ssh/sshd_config",
			changes => [
				"set PrintLastLog yes",
			];
		# RHEL-06-000243
		"Use Only Approved Ciphers":
			context => "/files/etc/ssh/sshd_config",
			lens    => "sshd.lns",
			incl    => "/etc/ssh/sshd_config",
			changes => [
				"set Ciphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,3des-cbc,aes192-cbc,aes256-cbc",
			];
	}

	file {
		"/etc/ssh/ssh_known_hosts":
			mode    => 444,
			owner   => root,
			group   => root;
	}
}
