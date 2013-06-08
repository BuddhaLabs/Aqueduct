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
# Group ID (Vulid): RHEL-06-000176
# Group Title: SRG-OS-000240
#
   
# Rule ID: RHEL-06-000176_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000176
# Rule Title: The operating system must automatically audit account 
# disabling actions.
#
# Vulnerability Discussion: In addition to auditing new user and group 
# accounts, these watches will alert the system administrator(s) to any 
# modifications. Any unexpected users, groups, or modifications should be 
# investigated for legitimacy.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To determine if the system is configured to audit account changes, run 
# the following command: 

# auditctl -l | egrep 
# '(/etc/passwd|/etc/shadow|/etc/group|/etc/gshadow|/etc/security/opasswd)'

# If the system is configured to watch for account changes, lines should be 
# returned for each file specified (and with "perm=wa" for each). 
# If the system is not configured to audit account changes, this is a 
# finding.
#
# Fix Text: 
#
# Add the following to "/etc/audit/audit.rules", in order to capture 
# events that modify account changes: 

# audit_account_changes
# -w /etc/group -p wa -k audit_account_changes
# -w /etc/passwd -p wa -k audit_account_changes
# -w /etc/gshadow -p wa -k audit_account_changes
# -w /etc/shadow -p wa -k audit_account_changes
# -w /etc/security/opasswd -p wa -k audit_account_changes

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000176
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

