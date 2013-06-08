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
# Group ID (Vulid): RHEL-06-000224
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000224_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000224
# Rule Title: The cron service must be running.
#
# Vulnerability Discussion: Due to its usage for maintenance and 
# security-supporting tasks, enabling the cron daemon is essential.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Run the following command to determine the current status of the 
# "crond" service: 

# service crond status

# If the service is enabled, it should return the following: 

# crond is running...


# If the service is not running, this is a finding.
#
# Fix Text: 
#
# The "crond" service is used to execute commands at preconfigured times. 
# It is required by almost all systems to perform necessary maintenance 
# tasks, such as notifying root of system activity. The "crond" service can 
# be enabled with the following command: 

# chkconfig crond on

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000224
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

