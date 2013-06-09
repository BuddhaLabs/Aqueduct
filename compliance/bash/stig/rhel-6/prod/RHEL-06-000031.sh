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
# Group ID (Vulid): RHEL-06-000031
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000031_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000031
# Rule Title: The /etc/passwd file must not contain password hashes.
#
# Vulnerability Discussion: The hashes for all user account passwords 
# should be stored in the file "/etc/shadow" and never in "/etc/passwd", 
# which is readable by all users.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check that no password hashes are stored in "/etc/passwd", run the 
# following command: 

# awk -F: '($2 != "x") {print}' /etc/passwd

# If it produces any output, then a password hash is stored in 
# "/etc/passwd". 
# If any stored hashes are found in /etc/passwd, this is a finding.
#
# Fix Text: 
#
# If any password hashes are stored in "/etc/passwd" (in the second 
# field, instead of an "x"), the cause of this misconfiguration should be 
# investigated. The account should have its password reset and the hash 
# should be properly stored, or the account should be deleted entirely.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000031
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
if /bin/awk -F: '($2 != "x") {print $1}' /etc/passwd; then
    exit 0
else
    pwconv
fi
#END_REMEDY

