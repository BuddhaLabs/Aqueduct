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
# Group ID (Vulid): RHEL-06-000522
# Group Title: SRG-OS-000057
#
   
# Rule ID: RHEL-06-000522_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000522
# Rule Title: Audit log files must be group-owned by root.
#
# Vulnerability Discussion: If non-privileged users can write to audit 
# logs, audit trails can be modified or destroyed.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Run the following command to check the group owner of the system audit 
# logs: 

# grep "^log_file" /etc/audit/auditd.conf|sed s/^[^\/]*//|xargs stat -c 
# %G:%n

# Audit logs must be group-owned by root. 
# If they are not, this is a finding.
#
# Fix Text: 
#
# Change the group owner of the audit log files with the following 
# command: 

# chgrp root [audit_file]

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000522
#
#BEGIN_CHECK
AUDITFILEPERMS=$(grep "^log_file" /etc/audit/auditd.conf|sed s/^[^\/]*//|xargs stat -c %G:%n|cut -d ":" -f 1|grep -i root|wc -l)
if [ $AUDITFILEPERMS != "1" ]
  then
#END_CHECK
#BEGIN_REMEDY
  chgrp root $AUDITFILEPERMS
done
#END_REMEDY

