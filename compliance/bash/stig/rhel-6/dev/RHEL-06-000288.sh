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
# Group ID (Vulid): RHEL-06-000288
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000288_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000288
# Rule Title: The sendmail package must be removed.
#
# Vulnerability Discussion: The sendmail software was not developed with 
# security in mind and its design prevents it from being effectively 
# contained by SELinux. Postfix should be used instead.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Run the following command to determine if the "sendmail" package is 
# installed: 

# rpm -q sendmail


# If the package is installed, this is a finding.
#
# Fix Text: 
#
# Sendmail is not the default mail transfer agent and is not installed by 
# default. The "sendmail" package can be removed with the following 
# command: 

# yum erase sendmail

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000288
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

