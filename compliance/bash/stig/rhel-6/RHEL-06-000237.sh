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
# Group ID (Vulid): RHEL-06-000237
# Group Title: SRG-OS-000109
#
   
# Rule ID: RHEL-06-000237_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000237
# Rule Title: The system must not permit root logins using remote access 
# programs such as ssh.
#
# Vulnerability Discussion: Permitting direct root login reduces 
# auditable information about who ran privileged commands on the system and 
# also allows direct attack attempts on root's password.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To determine how the SSH daemon's "PermitRootLogin" option is set, run 
# the following command: 

# grep -i PermitRootLogin /etc/ssh/sshd_config

# If a line indicating "no" is returned, then the required value is set. 
# If the required value is not set, this is a finding.
#
# Fix Text: 
#
# The root user should never be allowed to log in to a system directly 
# over a network. To disable root login via SSH, add or correct the 
# following line in "/etc/ssh/sshd_config": 

# PermitRootLogin no

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000237
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

