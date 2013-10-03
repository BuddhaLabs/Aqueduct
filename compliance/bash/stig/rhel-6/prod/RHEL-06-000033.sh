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
# Group ID (Vulid): RHEL-06-000033
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000033_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000033
# Rule Title: The /etc/shadow file must be owned by root.
#
# Vulnerability Discussion: The "/etc/shadow" file contains the list of 
# local system accounts and stores password hashes. Protection of this file 
# is critical for system security. Failure to give ownership of this file 
# to root provides the designated owner with access to sensitive 
# information which could weaken the system security posture.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check the ownership of "/etc/shadow", run the command: 

# $ ls -l /etc/shadow

# If properly configured, the output should indicate the following owner: 
# "root" 
# If it does not, this is a finding.
#
# Fix Text: 
#
# To properly set the owner of "/etc/shadow", run the command: 

# chown root /etc/shadow 

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000033
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
if [ -a "/etc/passwd" ]
then
        CUROWN=`stat -c %U /etc/shadow`;
fi
if [ "$CUROWN" != "root" ]
then
    chown root /etc/shadow
fi
#END_REMEDY

