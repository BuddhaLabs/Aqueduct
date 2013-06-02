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
# Group ID (Vulid): RHEL-06-000138
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000138_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000138
# Rule Title: System logs must be rotated daily.
#
# Vulnerability Discussion: Log files that are not properly rotated run 
# the risk of growing so large that they fill up the /var/log partition. 
# Valuable logging information could be lost if the /var/log partition 
# becomes full.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Run the following commands to determine the current status of the 
# "logrotate" service: 

# grep logrotate /var/log/cron*

# If the logrotate service is not run on a daily basis by cron, this is a 
# finding.
#
# Fix Text: 
#
# The "logrotate" service should be installed or reinstalled if it is not 
# installed and operating properly, by running the following command:

# yum reinstall logrotate  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000138
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

