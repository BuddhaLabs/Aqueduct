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
# Group ID (Vulid): RHEL-06-000050
# Group Title: SRG-OS-000078
#
   
# Rule ID: RHEL-06-000050_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000050
# Rule Title: The system must require passwords to contain a minimum of 
# 14 characters.
#
# Vulnerability Discussion: Requiring a minimum password length makes 
# password cracking attacks more difficult by ensuring a larger search 
# space. However, any security benefit from an onerous requirement must be 
# carefully weighed against usability problems, support costs, or 
# counterproductive behavior that may result.

# While it does not negate the password length requirement, it is 
# preferable to migrate from a password-based authentication scheme to a 
# stronger one based on PKI (public key infrastructure).
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check the minimum password length, run the command: 

# $ grep PASS_MIN_LEN /etc/login.defs

# The DoD requirement is "14". 
# If it is not set to the required value, this is a finding.
#
# Fix Text: 
#
# To specify password length requirements for new accounts, edit the file 
# "/etc/login.defs" and add or correct the following lines: 

# PASS_MIN_LEN 14



# The DoD requirement is "14". If a program consults "/etc/login.defs" and 
# also another PAM module (such as "pam_cracklib") during a password change 
# operation, then the most restrictive must be satisfied.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000050
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY

PML=`grep ^PASS_MIN_LEN /etc/login.defs | awk '{ print $2 }'`
if [ $PML -lt 14 ]
then 
    sed  -i 's/^PASS_MIN_LEN.*/PASS_MIN_LEN     14/' /etc/login.defs
fi

#END_REMEDY

