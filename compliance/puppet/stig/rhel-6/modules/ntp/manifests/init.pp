############################################################
# Class: ntp
#
# Description:
#	Set up and configure NTPD
#
# Variables:
#	None
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
class ntp {
	package {
		"ntp":
			ensure  => installed,
			require => Class["yum"],
	}

	service {
		"ntpd":
			enable  => true,
			ensure  => true,
			require => Package["ntp"];
	}

	# Customize and uncomment the following lines to configure NTP
	#augeas {
	#	"Specify a Remote NTP Server": # Also: Specify Additional Remote NTP Servers
	#		context => "/files/etc/ntp.conf",
	#		changes => [
	#			"rm server",
	#			"set server[1] ntpserver.domain.com",
	#			"set server[2] ntpserver2.domain.com",
	#		],
	#		onlyif => "match server[.='ntpserver.domain.com' or .='ntpserver2.domain.com'] size == 0";
	#}
}
