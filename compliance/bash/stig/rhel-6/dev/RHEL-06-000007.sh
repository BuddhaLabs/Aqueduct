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
# Group ID (Vulid): RHEL-06-000007
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000007_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000007
# Rule Title: The system must use a separate file system for user home 
# directories.
#
# Vulnerability Discussion: Ensuring that "/home" is mounted on its own 
# partition enables the setting of more restrictive mount options, and also 
# helps ensure that users cannot trivially fill partitions used for log or 
# audit data storage.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Run the following command to determine if "/home" is on its own 
# partition or logical volume: 

# $ mount | grep "on /home "

# If "/home" has its own partition or volume group, a line will be 
# returned. 
# If no line is returned, this is a finding.
#
# Fix Text: 
#
# If user home directories will be stored locally, create a separate 
# partition for "/home" at installation time (or migrate it later using 
# LVM). If "/home" will be mounted from another system such as an NFS 
# server, then creating a separate partition is not necessary at 
# installation time, and the mountpoint can instead be configured later.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000007
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

