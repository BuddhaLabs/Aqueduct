############################################################
# Class: postfix
#
# Description:
#	Configure clients' postfix installations to allow
#	outgoing email to rsyslog server
#
# Variables:
#	shared::mailserver
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
#
############################################################
class postfix {
	package {
		"postfix":
			ensure  => latest,
			require => Class["yum"];
	}
	
	service {
		"postfix":
			ensure    => true,
			enable    => true,
			hasstatus => true,
			require   => Package["postfix"],
	}

	if !$shared::mailserver {
		augeas {
			"Disable Postfix Network Listening":
				context => "/files/etc/postfix/main.cf",
				changes => [
					"set inet_interfaces localhost",
				];
		}
	}
	else {
		augeas {
			"Configure SMTP Greeting Banner":
				context => "/files/etc/postfix/main.cf",
				changes => "set smtpd_banner '\$myhostname ESMTP'";
			"Configure Postfix Resource Usage to Limit Denial of Service Attacks":
				context => "/files/etc/postfix/main.cf",
				changes => [
					"set default_process_limit 100",
					"set smtpd_client_connection_count_limit 10",
					"set smtpd_client_connection_rate_limit 30",
					"set queue_minfree 20971520",
					"set header_size_limit 51200",
					"set message_size_limit 10485760",
					"set smtpd_recipient_limit 100",
				];
			# Customize and uncomment one of the following changes lines according to the prose guide
			#"Configure Trusted Networks and Hosts":
			#	context => "/files/etc/postfix/main.cf",
			#	changes => [
			#		#"mynetworks_style subnet",
			#		#"mynetworks_style host",
			#		#"mynetworks_style '10.0.0.0/16, 192.168.1.0/24, 127.0.0.1'",
			#	];
		}

		file {
			#Ensure Security of Postfix SSL Certificates
			"/etc/pki/tls/mail":
				owner  => root,
				group  => root,
				mode   => 755,
				ensure => directory;

			# Customize and uncomment the following lines to automatically (re)install certificate files, files
			# are generally stored in puppet/modules/postfix/files/
			#"/etc/pki/tls/mail/serverkey.pem": # private key
			#	owner  => root,
			#	group  => root,
			#	mode   => 600,
			#"/etc/pki/tls/mail/servercert.pem": # certificate file
			#	owner => root,
			#	group => root,
			#	mode  => 644;
			#	source => "puppet:///modules/postfix/servercert.pem";
			#"/etc/pki/tls/CA/cacert.pem": # CA public certificate file
			#	owner => root,
			#	group => root,
			#	mode  => 644;
			#	source => "puppet:///modules/postfix/cacert.pem";
				
		}
	}

}
