############################################################
# Class: kernel
#
# Description:
#	This will blacklist Linux kernel modules, disable
#	interactive boot, disable core dumps, require a password
#	for single user mode, and disable ipv6 among other
#	things.
#
# Variables:
#	server
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
class kernel {
	kernel::disableModule{"Disable Cramfs":			module => "cramfs" }
	kernel::disableModule{"Disable freevxfs":		module => "freevxfs" }
	kernel::disableModule{"Disable jffs2":			module => "jffs2" }
	kernel::disableModule{"Disable hfs":			module => "hfs" }
	kernel::disableModule{"Disable hfsplus":		module => "hfsplus" }
	kernel::disableModule{"Disable squashfs":		module => "squashfs" }
	kernel::disableModule{"Disable udf":			module => "udf" }
	kernel::disableModule{"Disable bluetooth":		module => "bluetooth" }
	kernel::disableModule{"net-pf-31":			module => "net-pf-31" }
	kernel::disableModule{"Disable dccp":			module => "dccp" }
	kernel::disableModule{"Disable sctp":			module => "sctp" }
	kernel::disableModule{"Disable rds":			module => "rds" }
	kernel::disableModule{"Disable tipc":			module => "tipc" }
	kernel::disableModule{"Disable usb-storage":		module => "usb-storage" }	

	augeas {
		"Disable Core Dumps for All Users":
			context => "/files/etc/security/limits.conf",
			changes => [
				"rm domain[.='*'][./type='hard' and ./item='core']",
				"set domain[last() + 1] '*'",
				"set domain[last()]/type 'hard'",
				"set domain[last()]/item 'core'",
				"set domain[last()]/value 0",
			];
		"Ensure SELinux State is Enforcing":
			context => "/files/etc/selinux/config",
			lens    => "shellvars.lns",
			incl    => "/etc/selinux/config",
			changes => "set SELINUX enforcing";
		"Configure SELinux Policy":
			context => "/files/etc/selinux/config",
			lens    => "shellvars.lns",
			incl    => "/etc/selinux/config",
			changes => "set SELINUXTYPE targeted";
		"Enable Auditing for Processes Which Start Prior to the Audit Daemon":
			context => "/files/etc/grub.conf",
			lens    => "grub.lns",
			incl    => "/etc/grub.conf",
			changes => "setm title kernel/audit 1";
		"Ensure SELinux Not Disabled in /etc/grub.conf":
			context => "/files/etc/grub.conf",
			lens    => "grub.lns",
			incl    => "/etc/grub.conf",
			changes => "rm title/kernel/selinux[.='0']";
		"Ensure SELinux Enforcing Not Disabled in /etc/grub.conf":
			context => "/files/etc/grub.conf",
			lens    => "grub.lns",
			incl    => "/etc/grub.conf",
			changes => "rm title/kernel/enforcing[.='0']";
		"Require Authentication for Single User Mode":
			context => "/files/etc/sysconfig/init",
			lens    => "shellvars.lns",
			incl    => "/etc/sysconfig/init",
			changes => "set SINGLE /sbin/sulogin";
		"Disable Interactive Boot":
			context => "/files/etc/sysconfig/init",
			lens    => "shellvars.lns",
			incl    => "/etc/sysconfig/init",
			changes => "set PROMPT no";
		"Disable Functionality of IPv6":
			context => "/files/etc/modprobe.d/disabled.conf",
			lens    => "modprobe.lns",
			incl    => "/etc/modprobe.d/disabled.conf",
			changes => [
				"set options[. = 'ipv6'] 'ipv6'",
				"set options[. = 'ipv6']/disable '1'",
			];
		"Disable X Windows Startup By Setting Runlevel":
			context => "/files/etc/inittab",
			lens    => "inittab.lns",
			incl    => "/etc/inittab",
			changes => [
				"set id/runlevels 3",
			];
		# The following will add the same Grub password hash to every computer this manifest touches.
		#"Add SHA-512 password to Grub":
		#	context => "/files/etc/grub.conf",
		#	lens    => "grub.lns",
		#	incl    => "/etc/grub.conf",
		#	changes => [
		#		"ins password after timeout",
		#		"clear password/encrypted",
		#		"set password insert_SHA-512_hash_here",
		#	],
		#	onlyif  => "match password size == 0";
	}

	exec {
		"Enable SELinux":
			command => "/usr/sbin/setenforce 1",
			#user    => "root",
			onlyif  => "/usr/sbin/getenforce | /bin/grep -qv 'Enforcing'";
	}

	file {
		"/boot/grub/grub.conf":
			owner => root,
			group => root,
			mode  => 600;
	}
}

define kernel::disableModule ( $module = '' )
{
	augeas {
		"$name":
			context => "/files/etc/modprobe.d/disabled.conf",
			lens    => "modprobe.lns",
			incl    => "/etc/modprobe.d/disabled.conf",
			changes => [
				"set install[. = '$module /bin/false'] '$module /bin/false'"
			];
	}
}
