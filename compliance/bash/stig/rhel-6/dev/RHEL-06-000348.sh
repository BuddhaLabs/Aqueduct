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
# Group ID (Vulid): RHEL-06-000348
# Group Title: SRG-OS-000023
#
   
# Rule ID: RHEL-06-000348_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000348
# Rule Title: The FTPS/FTP service on the system must be configured with 
# the Department of Defense (DoD) login banner.
#
# Vulnerability Discussion: This setting will cause the system greeting 
# banner to be used for FTP connections as well.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To verify this configuration, run the following command: 

# grep "banner_file" /etc/vsftpd/vsftpd.conf

# The output should show the value of "banner_file" is set to "/etc/issue", 
# an example of which is shown below. 

# grep "banner_file" /etc/vsftpd/vsftpd.conf
# banner_file=/etc/issue


# If it does not, this is a finding.
#
# Fix Text: 
#
# Edit the vsftpd configuration file, which resides at 
# "/etc/vsftpd/vsftpd.conf" by default. Add or correct the following 
# configuration options. 

# banner_file=/etc/issue

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000348
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

