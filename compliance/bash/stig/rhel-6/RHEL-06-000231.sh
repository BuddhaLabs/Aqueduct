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
# Group ID (Vulid): RHEL-06-000231
# Group Title: SRG-OS-000126
#
   
# Rule ID: RHEL-06-000231_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000231
# Rule Title: The SSH daemon must set a timeout count on idle sessions.
#
# Vulnerability Discussion: This ensures a user login will be terminated 
# as soon as the "ClientAliveCountMax" is reached.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To ensure the SSH idle timeout will occur when the 
# "ClientAliveCountMax" is set, run the following command: 

# grep ClientAliveCountMax /etc/ssh/sshd_config

# If properly configured, output should be: 

# ClientAliveCountMax 0


# If it is not, this is a finding.
#
# Fix Text: 
#
# To ensure the SSH idle timeout occurs precisely when the 
# "ClientAliveCountMax" is set, edit "/etc/ssh/sshd_config" as follows: 

# ClientAliveCountMax 0

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000231
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

