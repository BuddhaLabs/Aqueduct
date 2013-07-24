############################################################
# Class: puppet
#
# Description:
#	Maintains puppet.conf for puppet clients and installs
#	necessary packages on the puppetserver
#
# Variables:
#	shared::puppetserver
#
# Facts:
#	None
#
# Files:
#	puppet/files/puppet.conf
#	puppet/files/namespaceauth.conf
#	puppet/files/auth.conf
#	puppet/files/check_certs
#
# Templates:
#	None
#
# Dependencies:
#	None
############################################################
class puppet {
	# The puppet agent binary is preferably invoked through a cron job. See the cron class for an
	# example.

	if $shared::puppetserver {
		include puppet::server
	}
	else {
		include puppet::workstation
	}
}

class puppet::workstation {
	package {
		"puppet":
			ensure  => latest,
			require => Class["yum"];
	}

	service {
		"puppet":
			ensure  => false,
			enable  => false,
			hasstatus => true;
	}

	file {
		"/etc/puppet/puppet.conf":
			owner   => root,
			group   => root,
			mode    => 644,
			source  => "puppet:///modules/puppet/puppet.conf";
		"/etc/puppet/namespaceauth.conf":
			owner   => root,
			group   => root,
			mode    => 644,
			source  => "puppet:///modules/puppet/namespaceauth.conf";
		"/etc/puppet/auth.conf":
			owner   => root,
			group   => root,
			mode    => 644,
			source  => "puppet:///modules/puppet/auth.conf";
	}
}

class puppet::server {
	package {
		"puppet-server":
			ensure  => latest,
			require => Class["yum"];
		"ruby":
			ensure  => latest,
			require => Class["yum"];
	}

	service {
		"puppetmaster":
			ensure  => true,
			enable  => true,
			hasstatus => true;
	}

	file {
		"/var/lib/puppet/db":
			owner  => puppet,
			group  => puppet,
			mode   => 755,
			ensure => directory;
	}
}
