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
# Group ID (Vulid): RHEL-06-000160
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000160_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000160
# Rule Title: The system must set a maximum audit log file size.
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
# determine how much data the system will retain in each audit log file: "# 
# grep max_log_file /etc/audit/auditd.conf" 

# max_log_file = 6


# If the system audit data threshold hasn't been properly set up, this is a 
# finding.
#
# Fix Text: 
#
# Determine the amount of audit data (in megabytes) which should be 
# retained in each log file. Edit the file "/etc/audit/auditd.conf". Add or 
# modify the following line, substituting the correct value for [STOREMB]: 

# max_log_file = [STOREMB]

# Set the value to "6" (MB) or higher for general-purpose systems. Larger 
# values, of course, support retention of even more audit data.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000160
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

