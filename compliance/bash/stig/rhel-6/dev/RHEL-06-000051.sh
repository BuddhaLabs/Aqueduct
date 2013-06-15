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
# Group ID (Vulid): RHEL-06-000051
# Group Title: SRG-OS-000075
#
   
# Rule ID: RHEL-06-000051_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000051
# Rule Title: Users must not be able to change passwords more than once 
# every 24 hours.
#
# Vulnerability Discussion: Setting the minimum password age protects 
# against users cycling back to a favorite password after satisfying the 
# password reuse requirement.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check the minimum password age, run the command: 

# $ grep PASS_MIN_DAYS /etc/login.defs

# The DoD requirement is 1. 
# If it is not set to the required value, this is a finding.
#
# Fix Text: 
#
# To specify password minimum age for new accounts, edit the file 
# "/etc/login.defs" and add or correct the following line, replacing [DAYS] 
# appropriately: 

# PASS_MIN_DAYS [DAYS]

# A value of 1 day is considered sufficient for many environments. The DoD 
# requirement is 1.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000051
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
PMD=`grep ^PASS_MIN_DAYS /etc/login.defs | awk '{ print $2 }'`
if [ $PMD -lt 1 ]
then 
    sed  -i 's/^PASS_MIN_DAYS.*/PASS_MIN_DAYS    1/' /etc/login.defs
fi
#END_REMEDY

