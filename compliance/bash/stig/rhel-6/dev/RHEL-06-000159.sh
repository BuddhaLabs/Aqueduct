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
# Group ID (Vulid): RHEL-06-000159
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000159_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000159
# Rule Title: The system must retain enough rotated audit logs to cover 
# the required log retention period.
#
# Vulnerability Discussion: The total storage for audit log files must be 
# large enough to retain log information over the period required. This is 
# a function of the maximum log file size and the number of logs retained.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Inspect "/etc/audit/auditd.conf" and locate the following line to 
# determine how many logs the system is configured to retain after 
# rotation: "# grep num_logs /etc/audit/auditd.conf" 

# num_logs = 5


# If the overall system log file(s) retention hasn't been properly set up, 
# this is a finding.
#
# Fix Text: 
#
# Determine how many log files "auditd" should retain when it rotates 
# logs. Edit the file "/etc/audit/auditd.conf". Add or modify the following 
# line, substituting [NUMLOGS] with the correct value: 

# num_logs = [NUMLOGS]

# Set the value to 5 for general-purpose systems. Note that values less 
# than 2 result in no log rotation.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000159
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

