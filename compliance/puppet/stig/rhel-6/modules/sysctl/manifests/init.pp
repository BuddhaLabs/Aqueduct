############################################################
# Class: sysctl
#
# Description:
#	Set kernel variables for workstations and servers
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
class sysctl {
	file {
		"/etc/sysctl.conf":
			owner   => root,
			group   => root,
			mode    => 600;
	}

	augeas {
		"Linux Kernel Parms":
			context => "/files/etc/sysctl.conf",
			lens    => "sysctl.lns",
			incl    => "/etc/sysctl.conf",
			changes => [
				"set fs.suid_dumpable 0",
				"set kernel.exec-shield 1",
				"set kernel.randomize_va_space 2",
				"set net.ipv4.ip_forward 0",
				"set net.ipv4.conf.default.rp_filter 1",
				"set net.ipv4.conf.all.rp_filter 1",
				"set net.ipv4.conf.default.accept_source_route 0",
				"set net.ipv4.conf.all.accept_source_route 0",
				"set net.ipv4.tcp_syncookies 1",
				"set net.ipv4.conf.default.accept_redirects 0",
				"set net.ipv4.conf.all.accept_redirects 0",
				"set net.ipv4.conf.default.send_redirects 0",
				"set net.ipv4.conf.all.send_redirects 0",
				"set net.ipv4.conf.default.secure_redirects 0",
				"set net.ipv4.conf.all.secure_redirects 0",
				"set net.ipv4.icmp_echo_ignore_broadcasts 1",
				"set net.ipv4.icmp_ignore_bogus_error_responses 1",
				"set net.ipv4.conf.all.log_martians 1",
			];
	}
}
