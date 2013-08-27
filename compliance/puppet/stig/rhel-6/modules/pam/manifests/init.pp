############################################################
# Class: pam
#
# Description:
#	Dynamically set pam and other password options
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
class pam {
	file {
		"/etc/passwd":
			owner => root,
			group => root,
			mode  => 644;
		"/etc/group":
			owner => root,
			group => root,
			mode  => 644;
		"/etc/shadow":
			owner => root,
			group => root,
			mode  => 000;
		"/etc/gshadow":
			owner => root,
			group => root,
			mode  => 000;
	}

	augeas {
		"Limit the Number of Concurrent Login Sessions Allowed Per User":
			context => "/files/etc/security/limits.conf",
			changes => [
				"rm domain[.='*'][./type='hard and ./item='maxlogins']",
				"set domain[last() + 1] '*'",
				"set domain[last()]/type 'hard'",
				"set domain[last()]/item 'maxlogins'",
				"set domain[last()]/value 10",
			];
		# This feels like a bug in SSG
		#"Prevent Log In to Accounts With Empty Password":
		#	context => "/files/etc/pam.d/system-auth",
		#	changes => "rm *[argument=\'nullok\']";
		"Prevent Log In to Accounts With Empty Password":
			context => "/files/etc/pam.d",
			changes => [
				"rm system-auth/*[type = 'password'][module = 'pam_unix.so']/argument[.= 'nullok']",
				"rm system-auth/*[type = 'auth'][module = 'pam_unix.so']/argument[.= 'nullok']",
			],
			onlyif  => "match system-auth/*[type='password'][module='pam_unix.so']/argument[.='nullok'] size == 1";
		"Set Password Minimimum Length, Minimum Age, Maximum Age, and Warning Age":
			context => "/files/etc/login.defs",
			lens    => "login_defs.lns",
			incl    => "/etc/login.defs",
			changes => [
				"set PASS_MAX_DAYS 60",
				"set PASS_MIN_DAYS 1",
				"set PASS_MIN_LEN 14",
				"set PASS_WARN_AGE 7",
			];
		"Set Account Expiration Following Inactivity":
			context => "/files/etc/default/useradd",
			lens => "shellvars.lns",
			incl => "/etc/default/useradd",
			changes => "set INACTIVE 35";
		"Set Last Logon/Access Notification":
			context => "/files/etc/pam.d",
			changes => [
				"ins 01 after system-auth/*[type='session'][module='pam_limits.so']",
				"set system-auth/01/type session",
				"set system-auth/01/control required",
				"set system-auth/01/module pam_lastlog.so",
				"set system-auth/01/argument[1] showfailed",
			],
			onlyif  => "match system-auth/*[type='session'][module='pam_lastlog.so'] size == 0";
		"Set Password Quality Requirements, if using pam_cracklib":
			context => "/files/etc/pam.d",
			changes => [
				"set system-auth/*[type='password'][module='pam_cracklib.so']/control required",
				"rm system-auth/*[type='password'][module='pam_cracklib.so']/argument",
				"set system-auth/*[type='password'][module='pam_cracklib.so']/argument[1] try_first_pass",
				"set system-auth/*[type='password'][module='pam_cracklib.so']/argument[2] retry=3",
				"set system-auth/*[type='password'][module='pam_cracklib.so']/argument[3] minlen=14",
				"set system-auth/*[type='password'][module='pam_cracklib.so']/argument[4] maxrepeat=3",
				"set system-auth/*[type='password'][module='pam_cracklib.so']/argument[5] dcredit=-1",
				"set system-auth/*[type='password'][module='pam_cracklib.so']/argument[6] ucredit=-1",
				"set system-auth/*[type='password'][module='pam_cracklib.so']/argument[7] ocredit=-1",
				"set system-auth/*[type='password'][module='pam_cracklib.so']/argument[8] lcredit=-1",
				"set system-auth/*[type='password'][module='pam_cracklib.so']/argument[9] difok=4",
			],
			onlyif  => "match system-auth/*[type='password'][control='required'][module='pam_cracklib.so'] size == 0";
		# Available faillock guidance doesn't neatly drop into place on all systems
		#"Set Deny For Failed Password Attempts":
		#	context => "/files/etc/pam.d",
		#	changes => [
		#		"ins 01 after system-auth/*[type='auth'][module='pam_unix.so']",
		#		"set system-auth/01/type auth",
		#		"set system-auth/01/control [default=die]",
		#		"set system-auth/01/module pam_faillock.so",
		#		"set system-auth/01/argument[1] authfail",
		#		"set system-auth/01/argument[2] deny=3",
		#		"set system-auth/01/argument[3] unlock_time=604800",
		#		"set system-auth/01/argument[4] fail_interval=900",
		#		"ins 02 after system-auth/01",
		#	],
		#	onlyif  => "match system-auth/*[type='auth'][control='required'][module='pam_faillock.so'] size == 0";
		"Limit Password Reuse":
			context => "/files/etc/pam.d",
			changes => "set system-auth/*[type = 'password'][module = 'pam_unix.so']/argument[.=~regexp('remember.*')] remember=24",
			onlyif  => "match system-auth/*[type='password'][module='pam_unix.so']/argument[.='remember=24'] size == 0";
		"Set Password Hashing Algorithm in /etc/pam.d/system-auth":
			context => "/files/etc/pam.d",
			changes => [
				"set system-auth/*[type = 'password'][module = 'pam_unix.so']/argument[.=~regexp('sha512')] sha512",
				"rm system-auth/*[type = 'password'][module = 'pam_unix.so']/argument[.= 'md5']",
			],
			onlyif  => "match system-auth/*[type='password'][module='pam_unix.so']/argument[.='sha512'] size == 0";
		"Set Password Hashing Algorithm in /etc/login.defs":
			context => "/files/etc/login.defs",
			lens    => "login_defs.lns",
			incl    => "/etc/login.defs",
			changes => "set ENCRYPT_METHOD SHA512";

	# sshd includes password-auth, not system-auth, one possible solution to enable pam_lastlog.so for SSH follows
	#	"Add pam_lastlog.so to sshd":
	#		context => "/files/etc/pam.d",
	#		changes => [
	#			"ins 01 before sshd/*[type='session'][position() = 1]",
	#			"set sshd/01/type session",
	#			"set sshd/01/control required",
	#			"set sshd/01/module pam_lastlog.so",
	#			"set sshd/01/argument[1] showfailed",
	#		],
	#		onlyif  => "match sshd/*[type='session'][module='pam_lastlog.so'] size == 0";
	}

	exec {
		"Set Password Hashing Algorithm in /etc/libuser.conf":
			command => "/bin/sed -i 's/crypt_style[ \t]*=[ \t]*md5/crypt_style = sha512/g' /etc/libuser.conf";
	}
}
