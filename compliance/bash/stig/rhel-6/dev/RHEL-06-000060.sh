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
# Group ID (Vulid): RHEL-06-000060
# Group Title: SRG-OS-000072
#
   
# Rule ID: RHEL-06-000060_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000060
# Rule Title: The system must require at least four characters be changed 
# between the old and new passwords during a password change.
#
# Vulnerability Discussion: Requiring a minimum number of different 
# characters during password changes ensures that newly changed passwords 
# should not resemble previously compromised ones. Note that passwords 
# which are changed on compromised systems will still be compromised, 
# however.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check how many characters must differ during a password change, run 
# the following command: 

# $ grep pam_cracklib /etc/pam.d/system-auth

# The "difok" parameter will indicate how many characters must differ. The 
# DoD requires four characters differ during a password change. This would 
# appear as "difok=4". 
# If difok is not found or not set to the required value, this is a finding.
#
# Fix Text: 
#
# The pam_cracklib module's "difok" parameter controls requirements for 
# usage of different characters during a password change. Add "difok=[NUM]" 
# after pam_cracklib.so to require differing characters when changing 
# passwords, substituting [NUM] appropriately. The DoD requirement is 4.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000060
#
#BEGIN_CHECK

grep ^password /etc/pam.d/system-auth | grep difok > /dev/null

#END_CHECK
#BEGIN_REMEDY

if [ $? -eq 1 ]
then
    sed -i 's/pam_cracklib.so /pam_cracklib.so difok=4 /' /etc/pam.d/system-auth
fi

#END_REMEDY

