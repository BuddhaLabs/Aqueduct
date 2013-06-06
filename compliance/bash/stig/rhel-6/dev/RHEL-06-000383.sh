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
# Group ID (Vulid): RHEL-06-000383
# Group Title: SRG-OS-000058
#
   
# Rule ID: RHEL-06-000383_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000383
# Rule Title: Audit log files must have mode 0640 or less permissive.
#
# Vulnerability Discussion: If users can write to audit logs, audit 
# trails can be modified or destroyed.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Run the following command to check the mode of the system audit logs: 

# grep "^log_file" /etc/audit/auditd.conf|sed s/^[^\/]*//|xargs stat -c 
# %a:%n

# Audit logs must be mode 0640 or less permissive. 
# If any are more permissive, this is a finding.
#
# Fix Text: 
#
# Change the mode of the audit log files with the following command: 

# chmod 0640 [audit_file]

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000383
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

