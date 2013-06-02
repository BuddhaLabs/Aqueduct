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
# Group ID (Vulid): RHEL-06-000347
# Group Title: SRG-OS-000073
#
   
# Rule ID: RHEL-06-000347_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000347
# Rule Title: There must be no .netrc files on the system.
#
# Vulnerability Discussion: Unencrypted passwords for remote FTP servers 
# may be stored in ".netrc" files. DoD policy requires passwords be 
# encrypted in storage and not used in access scripts.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check the system for the existence of any ".netrc" files, run the 
# following command: 

# find /home -xdev -name .netrc


# If any .netrc files exist, this is a finding.
#
# Fix Text: 
#
# The ".netrc" files contain login information used to auto-login into 
# FTP servers and reside in the user's home directory. These files may 
# contain unencrypted passwords to remote FTP servers making them 
# susceptible to access by unauthorized users and should not be used. Any 
# ".netrc" files should be removed.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000347
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

