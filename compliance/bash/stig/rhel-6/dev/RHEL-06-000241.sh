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
# Group ID (Vulid): RHEL-06-000241
# Group Title: SRG-OS-000242
#
   
# Rule ID: RHEL-06-000241_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000241
# Rule Title: The SSH daemon must not permit user environment settings.
#
# Vulnerability Discussion: SSH environment options potentially allow 
# users to bypass access restriction in some configurations.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To ensure users are not able to present environment daemons, run the 
# following command: 

# grep PermitUserEnvironment /etc/ssh/sshd_config

# If properly configured, output should be: 

# PermitUserEnvironment no


# If it is not, this is a finding.
#
# Fix Text: 
#
# To ensure users are not able to present environment options to the SSH 
# daemon, add or correct the following line in "/etc/ssh/sshd_config": 

# PermitUserEnvironment no

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000241
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

