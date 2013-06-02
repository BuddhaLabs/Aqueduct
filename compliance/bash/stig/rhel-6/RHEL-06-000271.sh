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
# Group ID (Vulid): RHEL-06-000271
# Group Title: SRG-OS-000035
#
   
# Rule ID: RHEL-06-000271_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000271
# Rule Title: The noexec option must be added to removable media 
# partitions.
#
# Vulnerability Discussion: Allowing users to execute binaries from 
# removable media such as USB keys exposes the system to potential 
# compromise.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To verify that binaries cannot be directly executed from removable 
# media, run the following command: 

# grep noexec /etc/fstab

# The output should show "noexec" in use. 
# If it does not, this is a finding.
#
# Fix Text: 
#
# The "noexec" mount option prevents the direct execution of binaries on 
# the mounted filesystem. Users should not be allowed to execute binaries 
# that exist on partitions mounted from removable media (such as a USB 
# key). The "noexec" option prevents code from being executed directly from 
# the media itself, and may therefore provide a line of defense against 
# certain types of worms or malicious code. Add the "noexec" option to the 
# fourth column of "/etc/fstab" for the line which controls mounting of any 
# removable media partitions.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000271
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

