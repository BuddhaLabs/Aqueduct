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
# Group ID (Vulid): RHEL-06-000337
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000337_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000337
# Rule Title: All public directories must be owned by a system account.
#
# Vulnerability Discussion: Allowing a user account to own a 
# world-writable directory is undesirable because it allows the owner of 
# that directory to remove or replace any files that may be placed in the 
# directory by other users.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# The following command will discover and print world-writable 
# directories that are not owned by a system account, given the assumption 
# that only system accounts have a uid lower than 500. Run it once for each 
# local partition [PART]: 

# find [PART] -xdev -type d -perm 0002 -uid +500 -print


# If there is output, this is a finding.
#
# Fix Text: 
#
# All directories in local partitions which are world-writable should be 
# owned by root or another system account. If any world-writable 
# directories are not owned by a system account, this should be 
# investigated. Following this, the files should be deleted or assigned to 
# an appropriate group.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000337
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

