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
# Group ID (Vulid): RHEL-06-000027
# Group Title: SRG-OS-000109
#
   
# Rule ID: RHEL-06-000027_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000027
# Rule Title: The system must prevent the root account from logging in 
# from virtual consoles.
#
# Vulnerability Discussion: Preventing direct root login to virtual 
# console devices helps ensure accountability for actions taken on the 
# system using the root account.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check for virtual console entries which permit root login, run the 
# following command: 

# grep '^vc/[0-9]' /etc/securetty

# If any output is returned, then root logins over virtual console devices 
# is permitted. 
# If root login over virtual console devices is permitted, this is a 
# finding.
#
# Fix Text: 
#
# To restrict root logins through the (deprecated) virtual console 
# devices, ensure lines of this form do not appear in "/etc/securetty": 

# vc/1
# vc/2
# vc/3
# vc/4

# Note:  Virtual console entries are not limited to those listed above.  
# Any lines starting with "vc/" followed by numerals should be removed.

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000027
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
sed -i -r -e '/^(\s*)vc\/[0-9]+/d' /etc/securetty
#END_REMEDY

