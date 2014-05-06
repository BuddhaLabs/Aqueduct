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
#	 1.1     |  Fix typo chomd          |  Leam Hall         | 6-MAY-2014                                                               
#	
#######################DISA INFORMATION##################################
# Group ID (Vulid): RHEL-06-000063
# Group Title: SRG-OS-000120
#
   
# Rule ID: RHEL-06-000063_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000063
# Rule Title: The system must use a FIPS 140-2 approved cryptographic 
# hashing algorithm for generating account password hashes (login.defs).
#
# Vulnerability Discussion: Using a stronger hashing algorithm makes 
# password cracking attacks more difficult.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Inspect "/etc/login.defs" and ensure the following line appears: 

# ENCRYPT_METHOD SHA512


# If it does not, this is a finding.
#
# Fix Text: 
#
# In "/etc/login.defs", add or correct the following line to ensure the 
# system will use SHA-512 as the hashing algorithm: 

# ENCRYPT_METHOD SHA512

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000063
#
#BEGIN_CHECK
grep ENCRYPT_METHOD /etc/login.defs | grep SHA512 > /dev/null
#END_CHECK
#BEGIN_REMEDY

if [ $? -eq 1 ]
then
    echo "ENCRYPT_METHOD   SHA512" >> /etc/login.defs
    chmod 644 /etc/login.defs
    chown root:root /etc/login.defs
fi

#END_REMEDY

