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
# Group ID (Vulid): RHEL-06-000002
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000002_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000002
# Rule Title: The system must use a separate file system for /var.
#
# Vulnerability Discussion: Ensuring that "/var" is mounted on its own 
# partition enables the setting of more restrictive mount options. This 
# helps protect system services such as daemons or other programs which use 
# it. It is not uncommon for the "/var" directory to contain world-writable 
# directories, installed by other software packages.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Run the following command to determine if "/var" is on its own 
# partition or logical volume: 

# $ mount | grep "on /var "

# If "/var" has its own partition or volume group, a line will be returned. 
# If no line is returned, this is a finding.
#
# Fix Text: 
#
# The "/var" directory is used by daemons and other system services to 
# store frequently-changing data. Ensure that "/var" has its own partition 
# or logical volume at installation time, or migrate it using LVM.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000002
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

