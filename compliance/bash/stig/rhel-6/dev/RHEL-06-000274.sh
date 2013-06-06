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
# Group ID (Vulid): RHEL-06-000274
# Group Title: SRG-OS-000077
#
   
# Rule ID: RHEL-06-000274_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000274
# Rule Title: The system must prohibit the reuse of passwords within 
# twenty-four iterations.
#
# Vulnerability Discussion: Preventing reuse of previous passwords helps 
# ensure that a compromised password is not reused by a user.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To verify the password reuse setting is compliant, run the following 
# command: 

# $ grep remember /etc/pam.d/system-auth

# The output should show the following at the end of the line: 

# remember=24


# If it does not, this is a finding.
#
# Fix Text: 
#
# Do not allow users to reuse recent passwords. This can be accomplished 
# by using the "remember" option for the "pam_unix" PAM module. In the file 
# "/etc/pam.d/system-auth", append "remember=24" to the line which refers 
# to the "pam_unix.so" module, as shown: 

# password sufficient pam_unix.so [existing_options] remember=24

# The DoD requirement is 24 passwords.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000274
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

