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
# Group ID (Vulid): RHEL-06-000299
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000299_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000299
# Rule Title: The system must require passwords to contain no more than 
# three consecutive repeating characters.
#
# Vulnerability Discussion: Passwords with excessive repeating characters 
# may be more vulnerable to password-guessing attacks.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check the maximum value for consecutive repeating characters, run 
# the following command: 

# $ grep pam_cracklib /etc/pam.d/system-auth

# Look for the value of the "maxrepeat" parameter. The DoD requirement is 
3. 
# If maxrepeat is not found or not set to the required value, this is a 
# finding.
#
# Fix Text: 
#
# The pam_cracklib module's "maxrepeat" parameter controls requirements 
# for consecutive repeating characters. Edit the "/etc/pam.d/system-auth" 
# file to include the following line prior to the "password include 
# system-auth-ac" line: 

# password required pam_cracklib.so maxrepeat=3

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000299
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

