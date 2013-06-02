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
# Group ID (Vulid): RHEL-06-000064
# Group Title: SRG-OS-000120
#
   
# Rule ID: RHEL-06-000064_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000064
# Rule Title: The system must use a FIPS 140-2 approved cryptographic 
# hashing algorithm for generating account password hashes (libuser.conf).
#
# Vulnerability Discussion: Using a stronger hashing algorithm makes 
# password cracking attacks more difficult.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Inspect "/etc/libuser.conf" and ensure the following line appears in 
# the "[default]" section: 

# crypt_style = sha512


# If it does not, this is a finding.
#
# Fix Text: 
#
# In "/etc/libuser.conf", add or correct the following line in its 
# "[defaults]" section to ensure the system will use the SHA-512 algorithm 
# for password hashing: 

# crypt_style = sha512

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000064
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

