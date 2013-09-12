##############################################################
# Class: packages
#
# Description:
#	Maintain packages for Linux that are not directly tied
#	to services and 
#
# Variables:
#	shared::server
#
# Facts:
#	None
#
# Files:
#	packages/files/%gconf.xml
#
# Templates:
#	None
#
# Dependencies:
#	None
#
###########################################################
class packages {
	package {
		[
			"cronie-noanacron",
			"kernel-PAE",
		]:
			ensure  => installed,
			require => Class["yum"];

		[
			"bind", # if named must be enabled, follow prose guide instructions for configuration
			"cronie-anacron",
			"dhcp", # if dhcp must be enabled, follow prose guide instructions for configuration
			"sendmail",
			"vsftpd", # if vsftpd must be enabled, uncomment the following vsftpd section
		]:
			ensure  => absent,
			require => Class["yum"];
	}

	if !$shared::needs_x11 {
		package {
			# yum groupremove "X Window System"
			[
				"xorg-x11-drivers",
				"xorg-x11-server-Xorg",
				"xorg-x11-xauth",
				"xorg-x11-xinit",
				"firstboot",
				"glx-utils",
				"hal",
				"plymouth-system-theme",
				"spice-vdagent",
				"subscription-manager-firstboot",
				"wacomexpresskeys",
				"wdaemon",
				"xorg-x11-server-utils",
				"xorg-x11-utils",
				"xvattr",
			]:
				ensure  => absent,
				require => Class["yum"];
		}
	}

	if $shared::needs_gnome {
		file {
			# Disable All GNOME Thumbnailers
			[
				"/etc/gconf/gconf.xml.mandatory/desktop",
				"/etc/gconf/gconf.xml.mandatory/desktop/gnome",
				"/etc/gconf/gconf.xml.mandatory/desktop/gnome/thumbnailers",
			]:
				ensure => directory;

			[
				"/etc/gconf/gconf.xml.mandatory/desktop/%gconf.xml",
				"/etc/gconf/gconf.xml.mandatory/desktop/gnome/%gconf.xml",
			]:
				ensure => present;

			"/etc/gconf/gconf.xml.mandatory/desktop/gnome/thumbnailers/%gconf.xml":
				owner  => gdm,
				group  => gdm,
				mode   => 600,
				source => "puppet:///modules/packages/%gconf.xml";
		}
	}

	file {
		# Verify that Shared Library Files Have Restrictive Permissions and Root Ownership
		[
			"/lib",
			"/lib64",
			"/usr/lib",
			"/usr/lib64",
		]:
			owner   => root,
			mode    => go-w,
			links   => manage,
			recurse => true;

		# Verify that System Executables Have Restrictive Permissions and Root Ownership
		[
			"/bin",
			"/usr/bin",
			"/usr/local/bin",
			"/sbin",
			"/usr/sbin",
			"/usr/local/sbin",
		]:
			owner   => root,
			mode    => go-w,
			links   => manage,
			recurse => true;
	}

	# Configure Avahi if Necessary, requires avahi.lns
	#augeas {
	#	"Serve Avahi Only via Required Protocol":
	#		context => "/files/etc/avahi/avahi-daemon.conf",
	#		changes => [
	#			"set use-ipv6 no",
	#			#"set use-ipv4 no", uncomment this and comment out above line in using ipv6
	#		];
	#	"Check Avahi Responses' TTL Field":
	#		context => "/files/etc/avahi/avahi-daemon.conf",
	#		changes => "set check-reponse-ttl yes";
	#	"Prevent Other Programs from Using Avahi's Port":
	#		context => "/files/etc/avahi/avahi-daemon.conf",
	#		changes => "set disallow-other-stacks yes";
	#	"Disable Avahi Publishing":
	#		context => "/files/etc/avahi/avahi-daemon.conf",
	#		changes => "set disallow-other-stacks yes";
	#	"Restrict Information Published by Avahi":
	#		context => "/files/etc/avahi/avahi-daemon.conf",
	#		changes => [
	#			"set disable-user-service-publishing yes",
	#			"set publish-addresses no",
	#			"set publish-hinfo no",
	#			"set publish-workstation no",
	#			"set publish-domain no",
	#		];
	#}

	# Configure the CUPS Service if Necessary, requires cups.lns
	#augeas {
	#	"Disable Printer Browsing Entirely if Possible":
	#		context => "/files/etc/cups/cupsd.conf",
	#		changes => "set Browsing Off";
	#	"Disable Print Server Capabilities":
	#		context => "/files/etc/cups/cupsd.conf",
	#		changes => [
	#			"rm Port",
	#			"set Listen localhost:631",
	#		];
	#}

	# Configure vsftpd Service if Necessary, follow prose guidance for more instructions, requires vsftpd.lns
	#augeas {
	#	"Enable Logging of All FTP Transactions":
	#		context => "/files/etc/vsftpd/vsftpd.conf",
	#		changes => [
	#			"set xferlog_enable YES",
	#			"set xferlog_std_format NO",
	#			"set log_ftp_protocol YES",
	#		];
	#	"Create Warning Baners for All FTP Users":
	#		context => "/files/etc/vsftpd/vsftpd.conf",
	#		changes => "set banner_file /etc/issue";
	#	"Disable FTP Uploads if Possible":
	#		context => "/files/etc/vsftpd/vsftpd.conf",
	#		changes => "set write_enable NO";
	#	"Restrict Access to Anonymous Users if Possible":
	#		context => "/files/etc/vsftpd/vsftpd.conf",
	#		changes => "set local_enable NO";
	#	"Limit Users Allowed FTP Access if Necessary":
	#		context => "/files/etc/vsftpd/vsftpd.conf",
	#		changes => [
	#			"set userlist_enable YES",
	#			"set userlist_file /etc/vsftp.ftpusers",
	#			"set userlist_deny NO",
	#		];
	#}
	#
	#file {
	#	"/etc/vsftp.ftpusers":
	#		content => "anonymous\nftp\nUSERNAME\nUSERNAME2\n"; # separate each username by \n
	#}
}
