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
#    1.1     |  Script add test and fix |  Leam Hall         | 3-OCT-2013
#	                                                                  
   
#	
#######################DISA INFORMATION##################################
# Group ID (Vulid): RHEL-06-000243
# Group Title: SRG-OS-000169
#
   
# Rule ID: RHEL-06-000243_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000243
# Rule Title: The SSH daemon must be configured to use only FIPS 140-2 
# approved ciphers.
#
# Vulnerability Discussion: Approved algorithms should impart some level 
# of confidence in their implementation. These are also required for 
# compliance.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Only FIPS-approved ciphers should be used. To verify that only 
# FIPS-approved ciphers are in use, run the following command: 

# grep Ciphers /etc/ssh/sshd_config

# The output should contain only those ciphers which are FIPS-approved, 
# namely, the AES and 3DES ciphers. 
# If that is not the case, this is a finding.
#
# Fix Text: 
#
# Limit the ciphers to those algorithms which are FIPS-approved. Counter 
# (CTR) mode is also preferred over cipher-block chaining (CBC) mode. The 
# following line in "/etc/ssh/sshd_config" demonstrates use of 
# FIPS-approved ciphers: 

# Ciphers 
# aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,3des-cbc,aes192-cbc,aes256-cbc

# The man page "sshd_config(5)" contains a list of supported ciphers.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000243
#
#BEGIN_CHECK

. ./aqueduct_functions

#END_CHECK
#BEGIN_REMEDY

edit_file /etc/ssh/sshd_config $PDI "Ciphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,3des-cbc,aes192-cbc,aes256-cbc" "Ciphers" 

#END_REMEDY

