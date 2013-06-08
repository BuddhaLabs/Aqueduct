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
# Group ID (Vulid): RHEL-06-000294
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000294_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000294
# Rule Title: All GIDs referenced in /etc/passwd must be defined in 
# /etc/group
#
# Vulnerability Discussion: Inconsistency in GIDs between /etc/passwd and 
# /etc/group could lead to a user having unintended rights.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To ensure all GIDs referenced in /etc/passwd are defined in /etc/group, 
# run the following command: 

# pwck -rq

# There should be no output. 
# If there is output, this is a finding.
#
# Fix Text: 
#
# Add a group to the system for each GID referenced without a 
# corresponding group.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000294
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

