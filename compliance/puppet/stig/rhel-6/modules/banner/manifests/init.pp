############################################################
# Class: banner
#
# Description:
#	Provides consistent banner across all boxes
#
# Variables:
#	shared::server
#
# Facts:
#	None
#
# Files:
#	banner/files/issue
#	banner/files/custom.conf
#
# Templates:
#	None
#
# Dependencies:
#	None
############################################################
class banner {
	file {
		"/etc/issue":
			owner  => root,
			group  => root,
			mode   => 444,
			source => "puppet:///modules/banner/issue",
	}

	# We don't run X on our servers
	if !$shared::server {
		include banner::gdm
	}
}

class banner::gdm {
	file {
		"/etc/gdm/custom.conf":
			owner  => root,
			group  => root,
			mode   => 444,
			source => "puppet:///modules/banner/custom.conf";
		"/var/lib/gdm/.gconf/apps/gdm/simple-greeter/%gconf.xml":
			owner  => gdm,
			group  => gdm,
			mode   => 600,
			source => "puppet:///modules/banner/%gconf.xml";
		[
			"/var/lib/gdm/.gconf/apps/gdm/simple-greeter",
			"/var/lib/gdm/.gconf/apps/gdm/",
			"/var/lib/gdm/.gconf/apps/",
		]:
			ensure => directory;

		[
			"/var/lib/gdm/.gconf/apps/gdm/%gconf.xml",
			"/var/lib/gdm/.gconf/apps/%gconf.xml",
		]:
			ensure => present;
	}
}
