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
# Group ID (Vulid): RHEL-06-000200
# Group Title: SRG-OS-000064
#
   
# Rule ID: RHEL-06-000200_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000200
# Rule Title: The audit system must be configured to audit user deletions 
# of files and programs.
#
# Vulnerability Discussion: Auditing file deletions will create an audit 
# trail for files that are removed from the system. The audit trail could 
# aid in system troubleshooting, as well as detecting malicious processes 
# that attempt to delete log files to conceal their presence.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To determine if the system is configured to audit calls to the "unlink" 
# system call, run the following command: 

# auditctl -l | grep syscall | grep unlink | grep -v unlinkat

# If the system is configured to audit this activity, it will return 
# several lines. 
# To determine if the system is configured to audit calls to the "unlinkat" 
# system call, run the following command: 

# auditctl -l | grep syscall | grep unlinkat

# If the system is configured to audit this activity, it will return 
# several lines. To determine if the system is configured to audit calls to 
# the "rename" system call, run the following command: 

# auditctl -l | grep syscall | grep rename | grep -v renameat

# If the system is configured to audit this activity, it will return 
# several lines. To determine if the system is configured to audit calls to 
# the "renameat" system call, run the following command: 

# auditctl -l | grep syscall | grep renameat

# If the system is configured to audit this activity, it will return 
# several lines. 
# If no line is returned, this is a finding.
#
# Fix Text: 
#
# At a minimum, the audit system should collect file deletion events for 
# all users and root. Add the following to "/etc/audit/audit.rules", 
# setting ARCH to either b32 or b64 as appropriate for your system: 

# -a always,exit -F arch=ARCH -S unlink -S unlinkat -S rename -S renameat \
# -F auid>=500 -F auid!=4294967295 -k delete
# -a always,exit -F arch=ARCH -S unlink -S unlinkat -S rename -S renameat \
# -F auid==0 -k delete

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000200
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

