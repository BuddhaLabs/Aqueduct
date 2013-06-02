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
# Group ID (Vulid): RHEL-06-000249
# Group Title: SRG-OS-000096
#
   
# Rule ID: RHEL-06-000249_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000249
# Rule Title: Mail relaying must be restricted.
#
# Vulnerability Discussion: This ensures "postfix" accepts mail messages 
# (such as cron job reports) from the local system only, and not from the 
# network, which protects it from network attack.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Run the following command to ensure postfix accepts mail messages from 
# only the local system: 

# $ grep inet_interfaces /etc/postfix/main.cf

# If properly configured, the output should show only "localhost". 
# If it does not, this is a finding.
#
# Fix Text: 
#
# Edit the file "/etc/postfix/main.cf" to ensure that only the following 
# "inet_interfaces" line appears: 

# inet_interfaces = localhost

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000249
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

