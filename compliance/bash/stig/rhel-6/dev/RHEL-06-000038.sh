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
# Group ID (Vulid): RHEL-06-000038
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000038_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000038
# Rule Title: The /etc/gshadow file must have mode 0000.
#
# Vulnerability Discussion: The /etc/gshadow file contains group password 
# hashes. Protection of this file is critical for system security.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check the permissions of "/etc/gshadow", run the command: 

# $ ls -l /etc/gshadow

# If properly configured, the output should indicate the following 
# permissions: "----------" 
# If it does not, this is a finding.
#
# Fix Text: 
#
# To properly set the permissions of "/etc/gshadow", run the command: 

# chmod 0000 /etc/gshadow

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000038
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY

chmod 0000 /etc/gshadow

#END_REMEDY

