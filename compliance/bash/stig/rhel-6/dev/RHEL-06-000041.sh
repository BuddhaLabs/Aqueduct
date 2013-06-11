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
# Group ID (Vulid): RHEL-06-000041
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000041_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000041
# Rule Title: The /etc/passwd file must have mode 0644 or less permissive.
#
# Vulnerability Discussion: If the "/etc/passwd" file is writable by a 
# group-owner or the world the risk of its compromise is increased. The 
# file contains the list of accounts on the system and associated 
# information, and protection of this file is critical for system security.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check the permissions of "/etc/passwd", run the command: 

# $ ls -l /etc/passwd

# If properly configured, the output should indicate the following 
# permissions: "-rw-r--r--" 
# If it does not, this is a finding.
#
# Fix Text: 
#
# To properly set the permissions of "/etc/passwd", run the command: 

# chmod 0644 /etc/passwd

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000041
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY

chmod 0644 /etc/passwd

#END_REMEDY

