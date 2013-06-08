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
# Group ID (Vulid): RHEL-06-000201
# Group Title: SRG-OS-000064
#
   
# Rule ID: RHEL-06-000201_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000201
# Rule Title: The audit system must be configured to audit changes to the 
# "/etc/sudoers" file.
#
# Vulnerability Discussion: The actions taken by system administrators 
# should be audited to keep a record of what was executed on the system, as 
# well as, for accountability purposes.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To verify that auditing is configured for system administrator actions, 
# run the following command: 

# auditctl -l | grep "watch=/etc/sudoers"


# If there is no output, this is a finding.
#
# Fix Text: 
#
# At a minimum, the audit system should collect administrator actions for 
# all users and root. Add the following to "/etc/audit/audit.rules": 

# -w /etc/sudoers -p wa -k actions

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000201
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

