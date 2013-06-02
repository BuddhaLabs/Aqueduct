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
# Group ID (Vulid): RHEL-06-000296
# Group Title: SRG-OS-000121
#
   
# Rule ID: RHEL-06-000296_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000296
# Rule Title: All accounts on the system must have unique user or account 
# names
#
# Vulnerability Discussion: Unique usernames allow for accountability on 
# the system.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Run the following command to check for duplicate account names: 

# pwck -rq

# If there are no duplicate names, no line will be returned. 
# If a line is returned, this is a finding.
#
# Fix Text: 
#
# Change usernames, or delete accounts, so each has a unique name.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000296
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

