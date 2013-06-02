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
# Group ID (Vulid): RHEL-06-000269
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000269_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000269
# Rule Title: Remote file systems must be mounted with the "nodev" option.
#
# Vulnerability Discussion: Legitimate device files should only exist in 
# the /dev directory. NFS mounts should not present device files to users.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To verify the "nodev" option is configured for all NFS mounts, run the 
# following command: 

# $ mount | grep nfs

# All NFS mounts should show the "nodev" setting in parentheses. 
# If the setting does not show, this is a finding.
#
# Fix Text: 
#
# Add the "nodev" option to the fourth column of "/etc/fstab" for the 
# line which controls mounting of any NFS mounts.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000269
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

