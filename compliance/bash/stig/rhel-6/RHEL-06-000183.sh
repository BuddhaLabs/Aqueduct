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
# Group ID (Vulid): RHEL-06-000183
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000183_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000183
# Rule Title: The audit system must be configured to audit modifications 
# to the system's Mandatory Access Control (MAC) configuration (SELinux).
#
# Vulnerability Discussion: The system's mandatory access policy 
# (SELinux) should not be arbitrarily changed by anything other than 
# administrator action. All changes to MAC policy should be audited.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To determine if the system is configured to audit changes to its 
# SELinux configuration files, run the following command: 

# auditctl -l | grep "dir=/etc/selinux"

# If the system is configured to watch for changes to its SELinux 
# configuration, a line should be returned (including "perm=wa" indicating 
# permissions that are watched). 
# If the system is not configured to audit attempts to change the MAC 
# policy, this is a finding.
#
# Fix Text: 
#
# Add the following to "/etc/audit/audit.rules": 

# -w /etc/selinux/ -p wa -k MAC-policy

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000183
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

