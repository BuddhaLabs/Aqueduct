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
# Group ID (Vulid): RHEL-06-000053
# Group Title: SRG-OS-000076
#
   
# Rule ID: RHEL-06-000053_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000053
# Rule Title: User passwords must be changed at least every 60 days.
#
# Vulnerability Discussion: Setting the password maximum age ensures 
# users are required to periodically change their passwords. This could 
# possibly decrease the utility of a stolen password. Requiring shorter 
# password lifetimes increases the risk of users writing down the password 
# in a convenient location subject to physical compromise.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check the maximum password age, run the command: 

# $ grep PASS_MAX_DAYS /etc/login.defs

# The DoD requirement is 60. 
# If it is not set to the required value, this is a finding.
#
# Fix Text: 
#
# To specify password maximum age for new accounts, edit the file 
# "/etc/login.defs" and add or correct the following line, replacing [DAYS] 
# appropriately: 

# PASS_MAX_DAYS [DAYS]

# The DoD requirement is 60.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000053
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY

PMxD=`grep ^PASS_MAX_DAYS /etc/login.defs | awk '{ print $2 }'`
if [ $PMxD -gt 60 ]
then 
    sed  -i 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS    60/' /etc/login.defs
fi


#END_REMEDY

