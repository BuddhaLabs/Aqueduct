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
# Group ID (Vulid): RHEL-06-000165
# Group Title: SRG-OS-000062
#
   
# Rule ID: RHEL-06-000165_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000165
# Rule Title: The audit system must be configured to audit all attempts 
# to alter system time through adjtimex.
#
# Vulnerability Discussion: Arbitrary changes to the system time can be 
# used to obfuscate nefarious activities in log files, as well as to 
# confuse network services that are highly dependent upon an accurate 
# system time (such as sshd). All changes to the system time should be 
# audited.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To determine if the system is configured to audit calls to the 
# "adjtimex" system call, run the following command: 

# auditctl -l | grep syscall | grep adjtimex

# If the system is configured to audit this activity, it will return a 
# line. 
# If the system is not configured to audit time changes, this is a finding.
#
# Fix Text: 
#
# On a 32-bit system, add the following to "/etc/audit/audit.rules": 

# audit_time_rules
# -a always,exit -F arch=b32 -S adjtimex -k audit_time_rules

# On a 64-bit system, add the following to "/etc/audit/audit.rules": 

# audit_time_rules
# -a always,exit -F arch=b64 -S adjtimex -k audit_time_rules

# The -k option allows for the specification of a key in string form that 
# can be used for better reporting capability through ausearch and 
# aureport. Multiple system calls can be defined on the same line to save 
# space if desired, but is not required. See an example of multiple 
# combined syscalls: 

# -a always,exit -F arch=b64 -S adjtimex -S settimeofday -S clock_settime 
# -k audit_time_rules

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000165
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

