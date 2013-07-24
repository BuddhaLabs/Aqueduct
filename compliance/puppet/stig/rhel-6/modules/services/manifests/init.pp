############################################################
# Class: services
#
# Description:
#	This will turn services on or off that aren't covered elsewhere
#
# Variables:
#	shared::server
#
# Facts:
#	None
#
# Files:
#	None
#
# Templates:
#	None
#
# Dependencies:
#	None
############################################################
class services {
	service {
		[
			"crond",
			"irqbalance",
			#"pcscd", # CAC support
			"psacct",
			"restorecond",
			#"sssd", # Used to authenticate network users
		]:
			ensure    => true,
			enable    => true,
			hasstatus => true;
	}

	service {
		[
			"abrtd",
			"acpid",
			"anacron",
			"atd",
			"autofs",
			"avahi-daemon", # if this must be enabled, uncomment avahi-daemon section in packages
			"certmonger",
			"cgconfig",
			"cgred",
			"cpuspeed",
			"cups", # if this must be enabled, uncomment cups section in packages
			"dhcpd", # if this must be enabled, follow prose guide instructions
			"haldaemon",
			"kdump",
			"mdmonitor",
			#"messagebus", # disables D-Bus, used by GUIs
			"named", # if named must be enabled, follow prose guide instructions
			"netconsole",
			"netfs",
			"nfs", # if nfs must be enabled, follow prose guide instructions
			"nfslock", # only remove this line if nfs must be enabled 
			"ntpdate",
			"oddjobd",
			"portreserve",
			"qpidd",
			"quota_nld",
			"rdisc",
			"rhnsd",
			"rhsmcertd",
			"rpcgssd", # only remove this line if nfs must be enabled and Kerberos is in use
			"rpcidmapd", # only remove this line if nfs must be enabled and NFSv4 is in use
			"rpcsvcgssd", # only remove this line if nfs must be enabled and Kerberos is in use
			"saslauthd", # disables SASL, used by LDAP and Kerberos
			"sendmail",
			"smartd",
			#"sshd", # disables SSH, uncomment this and remember to uncomment the SSH module in nodes.pp
			"sysstat",
			"vsftpd", # if vsftpd must be enabled, uncomment ftp section in packages
		]:
			ensure    => false,
			enable    => false,
			hasstatus => true;
	}

	exec {
		"Ensure No Daemons are Unconfined by SELinux":
			command   => "/bin/ps -eZ | /bin/egrep \"initrc\" | /bin/egrep -vw \"tr|ps|egrep|bash|awk\" | /usr/bin/tr \':\' \' \' | /usr/bin/awk '{ print $NF }'",
			logoutput => true;
	}

}
