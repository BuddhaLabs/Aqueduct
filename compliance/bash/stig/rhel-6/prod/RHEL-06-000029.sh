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
# Group ID (Vulid): RHEL-06-000029
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000029_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000029
# Rule Title: Default system accounts, other than root, must be locked.
#
# Vulnerability Discussion: Disabling authentication for default system 
# accounts makes it more difficult for attackers to make use of them to 
# compromise a system.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To obtain a listing of all users and the contents of their shadow 
# password field, run the command: 

# $ awk -F: '{print $1 ":" $2}' /etc/shadow

# Identify the system accounts from this listing. These will primarily be 
# the accounts with UID numbers less than 500, other than root. 
# If any system account (other than root) has a valid password hash, this 
# is a finding.
#
# Fix Text: 
#
# Some accounts are not associated with a human user of the system, and 
# exist to perform some administrative function. An attacker should not be 
# able to log into these accounts. 

# Disable login access to these accounts with the command: 

# passwd -l [SYSACCT]

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000029
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
awk -F: '{
			if ($3)
			if ($3 < 500 && $1 != "root")
			print "/usr/sbin/usermod -s /sbin/nologin " $1
		}' /etc/passwd
#END_REMEDY

