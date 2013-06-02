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
# Group ID (Vulid): RHEL-06-000198
# Group Title: SRG-OS-000020
#
   
# Rule ID: RHEL-06-000198_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000198
# Rule Title: The audit system must be configured to audit all use of 
# setuid programs.
#
# Vulnerability Discussion: Privileged programs are subject to 
# escalation-of-privilege attacks, which attempt to subvert their normal 
# role of providing some necessary but limited capability. As such, 
# motivation exists to monitor these programs for unusual activity.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To verify that auditing of privileged command use is configured, run 
# the following command to find relevant setuid programs: 

# find / -xdev -type f -perm -4000 -o -perm -2000 2>/dev/null

# Run the following command to verify entries in the audit rules for all 
# programs found with the previous command: 

# grep path /etc/audit/audit.rules

# It should be the case that all relevant setuid programs have a line in 
# the audit rules. 
# If it is not the case, this is a finding.
#
# Fix Text: 
#
# At a minimum, the audit system should collect the execution of 
# privileged commands for all users and root. To find the relevant setuid 
# programs: 

# find / -xdev -type f -perm -4000 -o -perm -2000 2>/dev/null

# Then, for each setuid program on the system, add a line of the following 
# form to "/etc/audit/audit.rules", where [SETUID_PROG_PATH] is the full 
# path to each setuid program in the list: 

# -a always,exit -F path=[SETUID_PROG_PATH] -F perm=x -F auid>=500 -F 
# auid!=4294967295 -k privileged

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000198
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

