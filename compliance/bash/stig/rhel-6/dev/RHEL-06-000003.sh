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
# Group ID (Vulid): RHEL-06-000003
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000003_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000003
# Rule Title: The system must use a separate file system for /var/log.
#
# Vulnerability Discussion: Placing "/var/log" in its own partition 
# enables better separation between log files and other files in "/var/".
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Run the following command to determine if "/var/log" is on its own 
# partition or logical volume: 

# $ mount | grep "on /var/log "

# If "/var/log" has its own partition or volume group, a line will be 
# returned. 
# If no line is returned, this is a finding.
#
# Fix Text: 
#
# System logs are stored in the "/var/log" directory. Ensure that it has 
# its own partition or logical volume at installation time, or migrate it 
# using LVM.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000003
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

