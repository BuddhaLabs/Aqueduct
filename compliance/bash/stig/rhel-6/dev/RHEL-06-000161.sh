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
# Group ID (Vulid): RHEL-06-000161
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000161_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000161
# Rule Title: The system must rotate audit log files that reach the 
# maximum file size.
#
# Vulnerability Discussion: Automatically rotating logs (by setting this 
# to "rotate") minimizes the chances of the system unexpectedly running out 
# of disk space by being overwhelmed with log data. However, for systems 
# that must never discard log data, or which use external processes to 
# transfer it and reclaim space, "keep_logs" can be employed.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Inspect "/etc/audit/auditd.conf" and locate the following line to 
# determine if the system is configured to rotate logs when they reach 
# their maximum size: "# grep max_log_file_action /etc/audit/auditd.conf" 

# max_log_file_action "rotate"


# If the system has not been properly set up to rotate audit logs, this is 
# a finding.
#
# Fix Text: 
#
# The default action to take when the logs reach their maximum size is to 
# rotate the log files, discarding the oldest one. To configure the action 
# taken by "auditd", add or correct the line in "/etc/audit/auditd.conf": 

# max_log_file_action = [ACTION]

# Possible values for [ACTION] are described in the "auditd.conf" man page. 
# These include: 

# "ignore"
# "syslog"
# "suspend"
# "rotate"
# "keep_logs"


# Set the "[ACTION]" to "rotate" to ensure log rotation occurs. This is the 
# default. The setting is case-insensitive.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000161
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

