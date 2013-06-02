#!/bin/bash
#
##########################################################################
#Red Hat Enterprise Linux 6 - DISA STIG Compliance Remediation Content
#Copyright (C) 2013 
#Vincent C. Passaro (vince@buddhalabs.com)
#
##########################################################################
#
######################  Buddha Labs LLC  ################################
# By Vincent C. Passaro                                                 #
# Buddha Labs LLC.                                                      #
# vince[@]buddhalabs[.]com                                              #
# www.buddhalabs.com	                                                #
######################  Buddha Labs LLC  ################################
#_________________________________________________________________________
#    Version |   Change Information     |      Author        |    Date    
#-------------------------------------------------------------------------
#    1.0     |  Initial Script Creation |  Vincent Passaro   | 1-JUNE-2013
#	                                                                  
   
#	
#######################DISA INFORMATION##################################
# Group ID (Vulid): RHEL-06-000339
# Group Title: SRG-OS-000037
#
   
# Rule ID: RHEL-06-000339_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000339
# Rule Title: The FTP daemon must be configured for logging or verbose 
# mode.
#
# Vulnerability Discussion: To trace malicious activity facilitated by 
# the FTP service, it must be configured to ensure that all commands sent 
# to the ftp server are logged using the verbose vsftpd log format. The 
# default vsftpd log file is /var/log/vsftpd.log.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Find if logging is applied to the ftp daemon. 

# Procedures: 

# If vsftpd is started by xinetd the following command will indicate the 
# xinetd.d startup file. 

# grep vsftpd /etc/xinetd.d/*



# grep server_args [vsftpd xinetd.d startup file]

# This will indicate the vsftpd config file used when starting through 
# xinetd. If the [server_args]line is missing or does not include the 
# vsftpd configuration file, then the default config file 
# (/etc/vsftpd/vsftpd.conf) is used. 

# grep xferlog_enable [vsftpd config file]


# If xferlog_enable is missing, or is not set to yes, this is a finding.
#
# Fix Text: 
#
# Add or correct the following configuration options within the "vsftpd" 
# configuration file, located at "/etc/vsftpd/vsftpd.conf". 

# xferlog_enable=YES
# xferlog_std_format=NO
# log_ftp_protocol=YES

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000339
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

