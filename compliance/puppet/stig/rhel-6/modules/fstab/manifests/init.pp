############################################################
# Class: fstab
#
# Description:
#	Add options to fstab entries and disable GNOME Automounting
#
# Variables:
#	None
#
# Facts:
#	None
#
# Files:
#	fstab/files/%gconf.xml
#
# Templates:
#	None
#	
# Dependencies:
#	None
############################################################
class fstab {
	augeas {
		"Add nodev Option to /tmp":
			context => "/files/etc/fstab",
			changes => [
				"ins opt after *[file='/tmp']/opt[last()]",
				"set *[file='/tmp']/opt[last()] nodev",
			],
			onlyif  => "match *[file='/tmp'][opt='nodev'] size == 0";
		"Add noexec Option to /tmp":
			context => "/files/etc/fstab",
			changes => [
				"ins opt after *[file='/tmp']/opt[last()]",
				"set *[file='/tmp']/opt[last()] noexec",
			],
			onlyif  => "match *[file='/tmp']/opt[.='noexec'] size == 0";
		"Add nosuid Option to /tmp":
			context => "/files/etc/fstab",
			changes => [
				"ins opt after *[file='/tmp']/opt[last()]",
				"set *[file='/tmp']/opt[last()] nosuid",
			],
			onlyif  => "match *[file='/tmp']/opt[.='nosuid'] size == 0";
		"Add nodev Option to /dev/shm":
			context => "/files/etc/fstab",
			changes => [
				"ins opt after *[file='/dev/shm']/opt[last()]",
				"set *[file='/dev/shm']/opt[last()] nodev",
			],
			onlyif  => "match *[file='/dev/shm']/opt[.='nodev'] size == 0";
		"Add noexec Option to /dev/shm":
			context => "/files/etc/fstab",
			changes => [
				"ins opt after *[file='/dev/shm']/opt[last()]",
				"set *[file='/dev/shm']/opt[last()] noexec",
			],
			onlyif  => "match *[file='/dev/shm']/opt[.='noexec'] size == 0";
		"Add nosuid Option to /dev/shm":
			context => "/files/etc/fstab",
			changes => [
				"ins opt after *[file='/dev/shm']/opt[last()]",
				"set *[file='/dev/shm']/opt[last()] nosuid",
			],
			onlyif  => "match *[file='/dev/shm']/opt[.='nosuid'] size == 0";
		"Bind Mount /var/tmp To /tmp":
			context => "/files/etc/fstab",
			changes => [
				"ins 00 after *[file='/tmp']",
				"set 00/spec /tmp",
				"set 00/file /var/tmp",
				"set 00/vfstype none",
				"set 00/opt[1] rw",
				"set 00/opt[2] nodev",
				"set 00/opt[3] noexec",
				"set 00/opt[4] nosuid",
				"set 00/opt[5] bind",
				"set 00/dump 0",
				"set 00/passno 0",

			],
			onlyif  => "match *[file='/var/tmp'] size == 0";
	}

	file {
		[
			"/etc/gconf/gconf.xml.mandatory/apps/",
			"/etc/gconf/gconf.xml.mandatory/apps/nautilus",
			"/etc/gconf/gconf.xml.mandatory/apps/nautilus/preferences",
		]:
			ensure => directory;

		[
			"/etc/gconf/gconf.xml.mandatory/apps/%gconf.xml",
			"/etc/gconf/gconf.xml.mandatory/apps/nautilus/%gconf.xml",
		]:
			ensure => present;

		"/etc/gconf/gconf.xml.mandatory/apps/nautilus/preferences/%gconf.xml":
			owner => gdm,
			group => gdm,
			mode  => 600,
			source => "puppet:///modules/fstab/%gconf.xml";
	}
}
