class shared (	$server = false,
		$dnsserver = false,
		$ftpserver = false,
		$gitserver = false,
		$krbserver = false,
		$ldapserver = false,
		$mailserver = false,
		$nfsbackupserver = false,
		$nfsserver = false,
		$puppetserver = false,
		$syslogserver = false,
		$yumcanary = false ) {

	$dnsservers = "10.10.10.1"
	$gateway = "10.10.10.1"
	$syslogserver_ip = "10.10.10.1"

	$sudoers = "%admins  ALL=(ALL)       ALL"

	class { "accounts": }
	class { "aide": }
	class { "audit": }
	class { "banner": }
	class { "cron": }
	class { "fstab": }
	class { "iptables": }
	class { "kernel": }
	class { "named": }
	class { "networking": }
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
			syslogserver => true;
	}
}

# Backup server
node 'backup.domain.com' {
	class {
		"shared":
			server          => true,
			nfsbackupserver => true;
	}
}

# File server (NFS, FTP, HTTP, GIT, CVS)
node 'fileserver.domain.com' {
	class {
		"shared":
			server    => true,
			ftpserver => true,
			gitserver => true,
			nfsserver => true,
	}
}

# Puppet Server
node 'puppet.domain.com' {
	class {
		"shared":
			server       => true,
			puppetserver => true;
	}
}

# Mail server (Postfix/Dovecot)
node 'mail.domain.com' {
	class {
		"shared":
			server     => true,
			mailserver => true;
	}
}

# DNS (BIND)
node 'named.domain.com' {
	class {
		"shared":
			server    => true,
			dnsserver => true;
	}
}

# Basic Workstation example

node 'workstation.domain.com'	{ class { "shared": } }

# Example of passing a variable into a workstation class (be sure the variable has a default value of false in the shared class above)

node 'workstation2.domain.com'	{
	class { "shared": yumcanary => true }
}
