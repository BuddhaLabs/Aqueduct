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
			require   => [Package["rsyslog"],Service["syslog"]];
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

	augeas {
		"Configure Logwatch HostLimit Line":
			context => "/files/etc/logwatch/conf/logwatch.conf",
			lens    => "shellvars.lns",
			incl    => "/etc/logwatch/conf/logwatch.conf",
			changes => "set HostLimit no";

		"Configure Logwatch SplitHosts Line":
			context => "/files/etc/logwatch/conf/logwatch.conf",
			lens    => "shellvars.lns",
			incl    => "/etc/logwatch/conf/logwatch.conf",
			changes => "set SplitHosts yes";
	}
}
