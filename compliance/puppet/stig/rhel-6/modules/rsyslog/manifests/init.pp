############################################################
# Class: rsyslog
#
# Description:
#	Provide logging and logrotate support for workstations
#
# Variables:
#	shared::server
#	shared::syslogserver
#	shared::syslogserver_ip
#
# Facts:
#	None
#
# Files:
#	syslog.rotate
#
# Templates:
#	rsyslog.conf.erb
#	
# Dependencies:
#	None
############################################################
class rsyslog {
	if $shared::syslogserver {
		include logwatch
	}
	else {
		file {
			"/etc/cron.daily/0logwatch":
				ensure => absent;
		}
	}

	package {
		[
			"logrotate",
			"rsyslog",
		]:
			ensure  => latest,
			require => Class["yum"],
	}

	service {
		"rsyslog":
			ensure    => true,
			enable    => true,
			hasstatus => true,
			require   => Package["rsyslog"];
	}

	file {
		"/etc/rsyslog.conf":
			owner   => root,
			group   => root,
			mode    => 644,
			content => template("rsyslog/rsyslog.conf.erb"),
			notify  => Service["rsyslog"];

		[
			"/var/log/messages",
			"/var/log/secure",
			"/var/log/maillog",
			"/var/log/cron",
			"/var/log/spooler",
			"/var/log/boot.log",
		]:
			owner => root,
			group => root,
			mode  => 0600;

		"/etc/logrotate.d/syslog":
			owner  => root,
			group  => root,
			mode   => 444,
			source => "puppet:///modules/rsyslog/syslog.rotate";
	}
}

class logwatch {
	package {
		"logwatch":
			ensure  => latest,
			require => Class["yum"],
	}

	exec {
		"Add Missing Logwatch HostLimit Line":
			command => "/bin/sed -i '$a HostLimit = No' /etc/logwatch/conf/logwatch.conf",
			onlyif  => "/usr/bin/test `grep HostLimit /etc/logwatch/conf/logwatch.conf | wc -l` -eq 0";
		"Configure Logwatch HostLimit Line":
			command => "/bin/sed -i 's/HostLimit[ \t]*=[ \t]*Yes/HostLimit = No/g' /etc/logwatch/conf/logwatch.conf"
		"Add Missing Logwatch SplitHosts Line":
			command => "/bin/sed -i '$a SplitHosts = Yes' /etc/logwatch/conf/logwatch.conf",
			onlyif  => "/usr/bin/test `grep SplitHosts /etc/logwatch/conf/logwatch.conf | wc -l` -eq 0";
		"Configure Logwatch SplitHosts Line":
			command => "/bin/sed -i 's/SplitHosts[ \t]*=[ \t]*No/SplitHosts = Yes/g' /etc/logwatch/conf/logwatch.conf"
	}
}
