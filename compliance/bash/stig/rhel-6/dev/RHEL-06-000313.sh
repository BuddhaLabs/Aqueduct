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
# Group ID (Vulid): RHEL-06-000313
# Group Title: SRG-OS-000046
#
   
# Rule ID: RHEL-06-000313_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000313
# Rule Title: The audit system must identify staff members to receive 
# notifications of audit log storage volume capacity issues.
#
# Vulnerability Discussion: Email sent to the root account is typically 
# aliased to the administrators of the system, who can take appropriate 
# action.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Inspect "/etc/audit/auditd.conf" and locate the following line to 
# determine if the system is configured to send email to an account when it 
# needs to notify an administrator: 

# action_mail_acct = root


# If auditd is not configured to send emails per identified actions, this 
# is a finding.
#
# Fix Text: 
#
# The "auditd" service can be configured to send email to a designated 
# account in certain situations. Add or correct the following line in 
# "/etc/audit/auditd.conf" to ensure that administrators are notified via 
# email for those situations: 

# action_mail_acct = root

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000313
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

