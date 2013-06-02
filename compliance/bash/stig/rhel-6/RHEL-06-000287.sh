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
# Group ID (Vulid): RHEL-06-000287
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000287_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000287
# Rule Title: The postfix service must be enabled for mail delivery.
#
# Vulnerability Discussion: Local mail delivery is essential to some 
# system maintenance and notification tasks.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Run the following command to determine the current status of the 
# "postfix" service:

# service postfix status

# If the service is enabled, it should return the following:

# postfix is running...

# If the service is not enabled, this is a finding.
#
# Fix Text: 
#
# The Postfix mail transfer agent is used for local mail delivery within 
# the system. The default configuration only listens for connections to the 
# default SMTP port (port 25) on the loopback interface (127.0.0.1). It is 
# recommended to leave this service enabled for local mail delivery. The 
# "postfix" service can be enabled with the following command: 

# chkconfig postfix on
# service postfix start

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000287
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

