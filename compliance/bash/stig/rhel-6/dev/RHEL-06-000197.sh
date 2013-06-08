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
# Group ID (Vulid): RHEL-06-000197
# Group Title: SRG-OS-000064
#
   
# Rule ID: RHEL-06-000197_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000197
# Rule Title: The audit system must be configured to audit failed 
# attempts to access files and programs.
#
# Vulnerability Discussion: Unsuccessful attempts to access files could 
# be an indicator of malicious activity on a system. Auditing these events 
# could serve as evidence of potential system compromise.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To verify that the audit system collects unauthorized file accesses, 
# run the following commands: 

# grep EACCES /etc/audit/audit.rules



# grep EPERM /etc/audit/audit.rules


# If either command lacks output, this is a finding.
#
# Fix Text: 
#
# At a minimum, the audit system should collect unauthorized file 
# accesses for all users and root. Add the following to 
# "/etc/audit/audit.rules", setting ARCH to either b32 or b64 as 
# appropriate for your system: 

# -a always,exit -F arch=ARCH -S creat -S open -S openat -S truncate \
# -S ftruncate -F exit=-EACCES -F auid>=500 -F auid!=4294967295 -k access
# -a always,exit -F arch=ARCH -S creat -S open -S openat -S truncate \
# -S ftruncate -F exit=-EPERM -F auid>=500 -F auid!=4294967295 -k access
# -a always,exit -F arch=ARCH -S creat -S open -S openat -S truncate \
# -S ftruncate -F exit=-EACCES -F auid==0 -k access
# -a always,exit -F arch=ARCH -S creat -S open -S openat -S truncate \
# -S ftruncate -F exit=-EPERM -F auid==0 -k access

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000197
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

