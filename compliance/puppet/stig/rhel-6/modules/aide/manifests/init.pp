############################################################
# Class: aide
#
# Description:
#	Installs and configures aide, and disables prelinking
#
# Variables:
#	None
#
# Facts:
#	None
#
# Files:
#	aide/files/aide.conf
#	aide/files/aide.cron
#	aide/files/aidereset.cron
#
# Templates:
#	None
#
# Dependencies:
#	None
############################################################
class aide {

	# Install AIDE
	package {
		"aide":
			ensure  => latest,
			require => Class["yum"];
	}

	file {
		"/etc/aide.conf":
			owner  => root,
			group  => wheel,
			mode   => 600,
			source => "puppet:///modules/aide/aide.conf";
		"/etc/cron.daily/aide":
			owner  => root,
			group  => root,
			mode   => 700,
			source => "puppet:///modules/aide/aide.cron";
		# This will update the AIDE db every week
		#"/etc/cron.weekly/aide":
		#	owner  => root,
		#	group  => root,
		#	mode   => 700,
		#	source => "puppet:///modules/aide/aidereset.cron";
	}

	augeas {
		"Disable Prelinking":
			context => "/files/etc/sysconfig/prelink",
			changes => [
				"set PRELINKING no",
			],
			notify  => Exec["Turn off Prelinking"];
	}

	exec {
		# This will create the initial AIDE database if it doesn't already exist
		#"Initialize AIDE DB":
		#	command => "/usr/sbin/aide -i; /bin/cp /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz",
		#	onlyif  => "/usr/bin/test ! -f /var/lib/aide/aide.db.gz";
		"Turn off Prelinking":
			command => "/usr/sbin/prelink -ua; /bin/rm /etc/prelink.cache",
			onlyif  => "/usr/bin/test -e /etc/prelink.cache";
	}

}
