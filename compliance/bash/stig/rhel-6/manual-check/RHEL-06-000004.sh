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
# Group ID (Vulid): RHEL-06-000004
# Group Title: SRG-OS-000044
#
   
# Rule ID: RHEL-06-000004_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000004
# Rule Title: The system must use a separate file system for the system 
# audit data path.
#
# Vulnerability Discussion: Placing "/var/log/audit" in its own partition 
# enables better separation between audit files and other files, and helps 
# ensure that auditing cannot be halted due to the partition running out of 
# space.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Run the following command to determine if "/var/log/audit" is on its 
# own partition or logical volume: 

# $ mount | grep "on /var/log/audit "

# If "/var/log/audit" has its own partition or volume group, a line will be 
# returned. 
# If no line is returned, this is a finding.
#
# Fix Text: 
#
# Audit logs are stored in the "/var/log/audit" directory. Ensure that it 
# has its own partition or logical volume at installation time, or migrate 
# it later using LVM. Make absolutely certain that it is large enough to 
# store all audit logs that will be created by the auditing daemon.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000004
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

