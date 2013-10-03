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
#    1.1     |  Script add test and fix |  Leam Hall         | 3-OCT-2013
#	                                                                  
   
#	
#######################DISA INFORMATION##################################
# Group ID (Vulid): RHEL-06-000507
# Group Title: SRG-OS-000025
#
   
# Rule ID: RHEL-06-000507_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000507
# Rule Title: The operating system, upon successful logon, must display 
# to the user the date and time of the last logon or access via ssh.
#
# Vulnerability Discussion: Users need to be aware of activity that 
# occurs regarding their account. Providing users with information 
# regarding the date and time of their last successful login allows the 
# user to determine if any unauthorized activity has occurred and gives 
# them an opportunity to notify administrators.

# At ssh login, a user must be presented with the last successful login 
# date and time.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Verify the value associated with the "PrintLastLog" keyword in 
# /etc/ssh/sshd_config:

# grep -i PrintLastLog /etc/ssh/sshd_config

# If the value is not set to "yes", this is a finding.  If the 
# "PrintLastLog" keyword is not present, this is not a finding.
#
# Fix Text: 
#
# Update the "PrintLastLog" keyword to "yes" in /etc/ssh/sshd_config:

# PrintLastLog yes

# While it is acceptable to remove the keyword entirely since the default 
# action for the SSH daemon is to print the last login date and time, it is 
# preferred to have the value explicitly documented.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000507
#
#BEGIN_CHECK

. ./aqueduct_functions

HAS_LASTLOG=`line_count 'PrintLastLog' /etc/ssh/sshd_config`

#END_CHECK
#BEGIN_REMEDY

if [ $HAS_LASTLOG -ne 1 ]
then
	edit_file /etc/ssh/sshd_config $PDI 'PrintLastLog yes' 'PrintLastLog'
fi

service sshd restart

#END_REMEDY

