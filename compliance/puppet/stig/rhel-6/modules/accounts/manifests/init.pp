############################################################
# Class: accounts
#
# Description:
#	Disable unnecessary accounts and restrict virtual
#	console logins
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
class accounts {
	augeas {
		"Restrict Virtual Console and Serial Port Root Logins":
			context => "/files/etc/securetty",
			lens    => "securetty.lns",
			incl    => "/etc/securetty",
			changes => [
				"rm *[.=~regexp('vc/.*')]",
				"rm *[.=~regexp('ttyS.*')]"
			];
	}

        exec {
		"Ensure the Default Bash Umask is Set Correctly":
			command => "/bin/sed -i -r 's/(umask)([ \t]*)[0-9]+/umask 077/gi' /etc/bashrc",
			onlyif  => "/usr/bin/test `/bin/egrep -i 'umask[[:space:]]*[0-9]+' /etc/bashrc | /bin/egrep -iv 'umask[[:space:]]*077' | /usr/bin/wc -l` -ne 0";
		"Ensure the Default C Shell Umask is Set Correctly":
			command => "/bin/sed -i -r 's/(umask)([ \t]*)[0-9]+/umask 077/gi' /etc/csh.cshrc",
			onlyif  => "/usr/bin/test `/bin/egrep -i 'umask[[:space:]]*[0-9]+' /etc/csh.cshrc | /bin/egrep -iv 'umask[[:space:]]*077' | /usr/bin/wc -l` -ne 0";
		"Replace /etc/profile umask":
			command => "/bin/sed -i -r 's/(umask)([ \t]*)[0-9]+/umask 077/gi' /etc/profile",
			onlyif  => "/usr/bin/test `/bin/egrep -i 'umask[[:space:]]*[0-9]+' /etc/profile | /bin/egrep -iv 'umask[[:space:]]*077' | /usr/bin/wc -l` -ne 0";
		"Verify Only Root Has UID 0":
			command   => "/bin/awk -F: '(\$3 == \"0\" && \$1 !=\"root\") {print}' /etc/passwd",
			user      => root,
			logoutput => true;
		"Verify No System or Local User Accounts Have Empty Password Fields":
			command   => "/bin/awk -F: '(\$2 == \"\") {print}' /etc/shadow",
			user      => root,
			logoutput => true;
	}
}
