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
# Group ID (Vulid): RHEL-06-000001
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000001_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000001
# Rule Title: The system must use a separate file system for /tmp.
#
# Vulnerability Discussion: The "/tmp" partition is used as temporary 
# storage by many programs. Placing "/tmp" in its own partition enables the 
# setting of more restrictive mount options, which can help protect 
# programs which use it.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Run the following command to determine if "/tmp" is on its own 
# partition or logical volume: 

# $ mount | grep "on /tmp "

# If "/tmp" has its own partition or volume group, a line will be returned. 
# If no line is returned, this is a finding.
#
# Fix Text: 
#
# The "/tmp" directory is a world-writable directory used for temporary 
# file storage. Ensure it has its own partition or logical volume at 
# installation time, or migrate it using LVM.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000001
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

