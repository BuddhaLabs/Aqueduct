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
# Group ID (Vulid): RHEL-06-000056
# Group Title: SRG-OS-000071
#
   
# Rule ID: RHEL-06-000056_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000056
# Rule Title: The system must require passwords to contain at least one 
# numeric character.
#
# Vulnerability Discussion: Requiring digits makes password guessing 
# attacks more difficult by ensuring a larger search space.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check how many digits are required in a password, run the following 
# command: 

# $ grep pam_cracklib /etc/pam.d/system-auth

# The "dcredit" parameter (as a negative number) will indicate how many 
# digits are required. The DoD requires at least one digit in a password. 
# This would appear as "dcredit=-1". 
# If dcredit is not found or not set to the required value, this is a 
# finding.
#
# Fix Text: 
#
# The pam_cracklib module's "dcredit" parameter controls requirements for 
# usage of digits in a password. When set to a negative number, any 
# password will be required to contain that many digits. When set to a 
# positive number, pam_cracklib will grant +1 additional length credit for 
# each digit. Add "dcredit=-1" after pam_cracklib.so to require use of a 
# digit in passwords.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000056
#
#BEGIN_CHECK

grep ^password /etc/pam.d/system-auth | grep dcredit > /dev/null

#END_CHECK
#BEGIN_REMEDY

if [ $? -eq 1 ]
then
    sed -i 's/pam_cracklib.so /pam_cracklib.so dcredit=-1 /' /etc/pam.d/system-auth
fi


#END_REMEDY

