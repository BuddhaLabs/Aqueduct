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
# Group ID (Vulid): RHEL-06-000062
# Group Title: SRG-OS-000120
#
   
# Rule ID: RHEL-06-000062_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000062
# Rule Title: The system must use a FIPS 140-2 approved cryptographic 
# hashing algorithm for generating account password hashes (system-auth).
#
# Vulnerability Discussion: Using a stronger hashing algorithm makes 
# password cracking attacks more difficult.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Inspect the "password" section of "/etc/pam.d/system-auth" and ensure 
# that the "pam_unix.so" module includes the argument "sha512".

# $ grep sha512 /etc/pam.d/system-auth" 

# If it does not, this is a finding.
#
# Fix Text: 
#
# In "/etc/pam.d/system-auth", the "password" section of the file 
# controls which PAM modules execute during a password change. Set the 
# "pam_unix.so" module in the "password" section to include the argument 
# "sha512", as shown below: 

# password sufficient pam_unix.so sha512 [other arguments...]

# This will help ensure when local users change their passwords, hashes for 
# the new passwords will be generated using the SHA-512 algorithm. This is 
# the default.

# Note that any updates made to "/etc/pam.d/system-auth" will be 
# overwritten by the "authconfig" program.  The "authconfig" program should 
# not be used.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000062
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

