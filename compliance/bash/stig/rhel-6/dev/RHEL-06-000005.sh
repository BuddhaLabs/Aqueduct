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
# Group ID (Vulid): RHEL-06-000005
# Group Title: SRG-OS-000045
#
   
# Rule ID: RHEL-06-000005_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000005
# Rule Title: The audit system must alert designated staff members when 
# the audit storage volume approaches capacity.
#
# Vulnerability Discussion: Notifying administrators of an impending disk 
# space problem may allow them to take corrective action prior to any 
# disruption.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Inspect "/etc/audit/auditd.conf" and locate the following line to 
# determine if the system is configured to email the administrator when 
# disk space is starting to run low: 

# grep space_left_action /etc/audit/auditd.conf
# space_left_action = email


# If the system is not configured to send an email to the system 
# administrator when disk space is starting to run low, this is a finding.
#
# Fix Text: 
#
# The "auditd" service can be configured to take an action when disk 
# space starts to run low. Edit the file "/etc/audit/auditd.conf". Modify 
# the following line, substituting [ACTION] appropriately: 

# space_left_action = [ACTION]

# Possible values for [ACTION] are described in the "auditd.conf" man page. 
# These include: 

# "ignore"
# "syslog"
# "email"
# "exec"
# "suspend"
# "single"
# "halt"


# Set this to "email" (instead of the default, which is "suspend") as it is 
# more likely to get prompt attention.

# RHEL-06-000521 ensures that the email generated through the operation 
# "space_left_action" will be sent to an administrator.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000005
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
sed -i 's/space_left_action = IGNORE/space_left_action = SYSLOG/g' /etc/audit/auditd.conf
sed -i 's/space_left_action = SUSPEND/space_left_action = SYSLOG/g' /etc/audit/auditd.conf
#END_REMEDY

