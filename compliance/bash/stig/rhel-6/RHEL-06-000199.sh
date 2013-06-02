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
# Group ID (Vulid): RHEL-06-000199
# Group Title: SRG-OS-000064
#
   
# Rule ID: RHEL-06-000199_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000199
# Rule Title: The audit system must be configured to audit successful 
# file system mounts.
#
# Vulnerability Discussion: The unauthorized exportation of data to 
# external media could result in an information leak where classified 
# information, Privacy Act information, and intellectual property could be 
# lost. An audit trail should be created each time a filesystem is mounted 
# to help identify and guard against information loss.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To verify that auditing is configured for all media exportation events, 
# run the following command: 

# auditctl -l | grep syscall | grep mount


# If there is no output, this is a finding.
#
# Fix Text: 
#
# At a minimum, the audit system should collect media exportation events 
# for all users and root. Add the following to "/etc/audit/audit.rules", 
# setting ARCH to either b32 or b64 as appropriate for your system: 

# -a always,exit -F arch=ARCH -S mount -F auid>=500 -F auid!=4294967295 -k 
# export
# -a always,exit -F arch=ARCH -S mount -F auid==0 -k export

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000199
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

