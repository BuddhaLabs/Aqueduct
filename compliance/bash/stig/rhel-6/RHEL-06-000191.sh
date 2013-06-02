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
# Group ID (Vulid): RHEL-06-000191
# Group Title: SRG-OS-000064
#
   
# Rule ID: RHEL-06-000191_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000191
# Rule Title: The audit system must be configured to audit all 
# discretionary access control permission modifications using fsetxattr.
#
# Vulnerability Discussion: The changing of file permissions could 
# indicate that a user is attempting to gain access to information that 
# would otherwise be disallowed. Auditing DAC modifications can facilitate 
# the identification of patterns of abuse among both authorized and 
# unauthorized users.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To determine if the system is configured to audit calls to the 
# "fsetxattr" system call, run the following command: 

# auditctl -l | grep syscall | grep fsetxattr

# If the system is configured to audit this activity, it will return 
# several lines. 
# If no lines are returned, this is a finding.
#
# Fix Text: 
#
# At a minimum, the audit system should collect file permission changes 
# for all users and root. Add the following to "/etc/audit/audit.rules": 

# -a always,exit -F arch=b32 -S fsetxattr -F auid>=500 -F auid!=4294967295 \
# -k perm_mod
# -a always,exit -F arch=b32 -S fsetxattr -F auid==0 -k perm_mod

# If the system is 64-bit, then also add the following: 

# -a always,exit -F arch=b64 -S fsetxattr -F auid>=500 -F auid!=4294967295 \
# -k perm_mod
# -a always,exit -F arch=b64 -S fsetxattr -F auid==0 -k perm_mod

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000191
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

