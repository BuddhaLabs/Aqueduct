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
# Group ID (Vulid): RHEL-06-000030
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000030_rule
# Severity: high
# Rule Version (STIG-ID): RHEL-06-000030
# Rule Title: The system must not have accounts configured with blank or 
# null passwords.
#
# Vulnerability Discussion: If an account has an empty password, anyone 
# could log in and run commands with the privileges of that account. 
# Accounts with empty passwords should never be used in operational 
# environments.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To verify that null passwords cannot be used, run the following 
# command: 

# grep nullok /etc/pam.d/system-auth /etc/pam.d/system-auth-ac

# If this produces any output, it may be possible to log into accounts with 
# empty passwords. 
# If NULL passwords can be used, this is a finding.
#
# Fix Text: 
#
# If an account is configured for password authentication but does not 
# have an assigned password, it may be possible to log into the account 
# without authentication. Remove any instances of the "nullok" option in 
# "/etc/pam.d/system-auth-ac" to prevent logins with empty passwords.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000030
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
grep 'nullok' /etc/pam.d/* > /dev/null
if [ $? == 0 ]
then
    sed -i 's/ nullok//g' /etc/pam.d/*
fi
#END_REMEDY

