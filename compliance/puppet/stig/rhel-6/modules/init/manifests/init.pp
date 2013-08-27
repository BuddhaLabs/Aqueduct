############################################################
# Class: init
#
# Description:
#	Set key values to secure the init process
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
class init {
	file {
		"/etc/init/control-alt-delete.conf":
			owner   => root,
			group   => root,
			mode    => 644,
			content => "start on control-alt-delete\n\nexec /usr/bin/logger -p security.info \"Ctrl-Alt-Delete pressed\"";
	}
}
