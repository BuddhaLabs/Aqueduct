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
# Group ID (Vulid): RHEL-06-000239
# Group Title: SRG-OS-000106
#
   
# Rule ID: RHEL-06-000239_rule
# Severity: high
# Rule Version (STIG-ID): RHEL-06-000239
# Rule Title: The SSH daemon must not allow authentication using an empty 
# password.
#
# Vulnerability Discussion: Configuring this setting for the SSH daemon 
# provides additional assurance that remote login via SSH will require a 
# password, even in the event of misconfiguration elsewhere.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To determine how the SSH daemon's "PermitEmptyPasswords" option is set, 
# run the following command: 

# grep -i PermitEmptyPasswords /etc/ssh/sshd_config

# If no line, a commented line, or a line indicating the value "no" is 
# returned, then the required value is set. 
# If the required value is not set, this is a finding.
#
# Fix Text: 
#
# To explicitly disallow remote login from accounts with empty passwords, 
# add or correct the following line in "/etc/ssh/sshd_config": 

# PermitEmptyPasswords no

# Any accounts with empty passwords should be disabled immediately, and PAM 
# configuration should prevent users from being able to assign themselves 
# empty passwords.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000239
#

. ./aqueduct_functions
grep ^PermitEmptyPasswords /etc/ssh/sshd_config | grep no

#END_CHECK
#BEGIN_REMEDY

if [ $? -ne 0 ]
then
        edit_file /etc/ssh/sshd_config $PDI "PermitEmptyPasswords no" PermitEmptyPasswords
        service sshd restart
fi

#END_REMEDY

