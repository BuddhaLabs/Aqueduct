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
# Group ID (Vulid): RHEL-06-000054
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000054_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000054
# Rule Title: Users must be warned 7 days in advance of password 
# expiration.
#
# Vulnerability Discussion: Setting the password warning age enables 
# users to make the change at a practical time.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check the password warning age, run the command: 

# $ grep PASS_WARN_AGE /etc/login.defs

# The DoD requirement is 7. 
# If it is not set to the required value, this is a finding.
#
# Fix Text: 
#
# To specify how many days prior to password expiration that a warning 
# will be issued to users, edit the file "/etc/login.defs" and add or 
# correct the following line, replacing [DAYS] appropriately: 

# PASS_WARN_AGE [DAYS]

# The DoD requirement is 7.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000054
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY

PWA=`grep ^PASS_WARN_AGE /etc/login.defs | awk '{ print $2 }'`
if [ $PWA -lt 7 ]
then 
    sed  -i 's/^PASS_WARN_AGE.*/PASS_WARN_AGE    7/' /etc/login.defs
fi
#END_REMEDY

