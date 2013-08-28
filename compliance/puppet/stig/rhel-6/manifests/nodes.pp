class shared (	$server = false,
		$dnsserver = false,
		$ftpserver = false,
		$webserver = false,
		$gitserver = false,
		$krbserver = false,
		$ldapserver = false,
		$mailserver = false,
		$needs_gnome = true,
		$needs_x11 = true,
		$nfsbackupserver = false,
		$nfsserver = false,
		$puppetserver = false,
		$syslogserver = false,
		$yumcanary = false ) {

	$dnsservers = "10.10.10.1"
	$gateway = "10.10.10.1"
	$syslogserver_ip = "10.10.10.1"

	$sudoers = "%admins  ALL=(ALL)       ALL"
	#$nfs_server_fqdn = "fileserver.domain.com"

	class { "accounts": }
	class { "aide": }
	class { "audit": }
	class { "banner": }
	class { "cron": }
	class { "fstab": }
	class { "init": }
	class { "iptables": }
	class { "kernel": }
	class { "named": }
	class { "networking": }
	#class { "nfs": nfs_server_fqdn => $nfs_server_fqdn; }
	class { "ntp": }
	class { "packages": }
	class { "pam": }
	class { "postfix": }
	class { "puppet": }
	class { "rsyslog": }
	class { "services": }
	class { "ssh": }
	class { "sudo": }
	class { "sysctl": }
	class { "yum": }
}

# LDAP/Kerberos
node 'ldap.domain.com' {
	class {
		"shared":
			server       => true,
			krbserver    => true,
			ldapserver   => true,
			needs_x11    => false,
			needs_gnome  => false,
			syslogserver => true;
	}
}

# Backup server
node 'backup.domain.com' {
	class {
		"shared":
			server          => true,
			needs_x11       => false,
			needs_gnome     => false,
			nfsbackupserver => true;
	}
}

# File server (NFS, FTP, HTTP, GIT, CVS)
node 'fileserver.domain.com' {
	class {
		"shared":
			server      => true,
			ftpserver   => true,
			gitserver   => true,
			needs_x11   => false,
			needs_gnome => false,
			nfsserver   => true,
			webserver   => true;
	}
}

# Puppet Server
node 'puppet.domain.com' {
	class {
		"shared":
			server       => true,
			needs_x11    => false,
			needs_gnome  => false,
			puppetserver => true;
	}
}

# Mail server (Postfix/Dovecot)
node 'mail.domain.com' {
	class {
		"shared":
			server      => true,
			needs_x11   => false,
			needs_gnome => false,
			mailserver  => true;
	}
}

# DNS (BIND)
node 'named.domain.com' {
	class {
		"shared":
			server      => true,
			needs_x11   => false,
			needs_gnome => false,
			dnsserver   => true;
	}
}

# Basic Workstation example

node 'workstation.domain.com'	{ class { "shared": } }

# Example of passing a variable into a workstation class (be sure the variable has a default value of false in the shared class above)

node 'workstation2.domain.com'	{
	class { "shared": yumcanary => true }
}
