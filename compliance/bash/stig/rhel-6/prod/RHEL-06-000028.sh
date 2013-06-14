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
# Group ID (Vulid): RHEL-06-000028
# Group Title: SRG-OS-000109
#
   
# Rule ID: RHEL-06-000028_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000028
# Rule Title: The system must prevent the root account from logging in 
# from serial consoles.
#
# Vulnerability Discussion: Preventing direct root login to serial port 
# interfaces helps ensure accountability for actions taken on the systems 
# using the root account.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check for serial port entries which permit root login, run the 
# following command: 

# grep '^ttyS[0-9]' /etc/securetty

# If any output is returned, then root login over serial ports is 
# permitted. 
# If root login over serial ports is permitted, this is a finding.
#
# Fix Text: 
#
# To restrict root logins on serial ports, ensure lines of this form do 
# not appear in "/etc/securetty": 

# ttyS0
# ttyS1

# Note:  Serial port entries are not limited to those listed above.  Any 
# lines starting with "ttyS" followed by numerals should be removed

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000028
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
sed -i -r -e '/^(\s*)ttyS[0-9]+/d' /etc/securetty
#END_REMEDY

