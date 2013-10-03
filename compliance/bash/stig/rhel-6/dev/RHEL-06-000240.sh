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
# Group ID (Vulid): RHEL-06-000240
# Group Title: SRG-OS-000023
#
   
# Rule ID: RHEL-06-000240_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000240
# Rule Title: The SSH daemon must be configured with the Department of 
# Defense (DoD) login banner.
#
# Vulnerability Discussion: The warning message reinforces policy 
# awareness during the logon process and facilitates possible legal action 
# against attackers. Alternatively, systems whose ownership should not be 
# obvious should ensure usage of a banner that does not provide easy 
# attribution.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To determine how the SSH daemon's "Banner" option is set, run the 
# following command: 

# grep -i Banner /etc/ssh/sshd_config

# If a line indicating /etc/issue is returned, then the required value is 
# set. 
# If the required value is not set, this is a finding.
#
# Fix Text: 
#
# To enable the warning banner and ensure it is consistent across the 
# system, add or correct the following line in "/etc/ssh/sshd_config": 

# Banner /etc/issue

# Another section contains information on how to create an appropriate 
# system-wide warning banner.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000240
#
#BEGIN_CHECK

. ./aqueduct_functions
HAS_BANNER=`grep -c ^Banner /etc/ssh/sshd_config`

#END_CHECK
#BEGIN_REMEDY

if [  $HAS_BANNER -eq 0 ]
then
	edit_file /etc/ssh/sshd_config $PDI "Banner /etc/issue" "Banner"
fi

#END_REMEDY

