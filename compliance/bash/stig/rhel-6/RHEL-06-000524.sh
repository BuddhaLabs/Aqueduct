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
# Group ID (Vulid): RHEL-06-000524
# Group Title: SRG-OS-000001
#
   
# Rule ID: RHEL-06-000524_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000524
# Rule Title: The system must provide automated support for account 
# management functions.
#
# Vulnerability Discussion: A comprehensive account management process 
# that includes automation helps to ensure the accounts designated as 
# requiring attention are consistently and promptly addressed. Enterprise 
# environments make user account management challenging and complex. A user 
# management process requiring administrators to manually address account 
# management functions adds risk of potential oversight.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Interview the SA to determine if there is an automated system for 
# managing user accounts, preferably integrated with an existing enterprise 
# user management system.

# If there is not, this is a finding.
#
# Fix Text: 
#
# Implement an automated system for managing user accounts that minimizes 
# the risk of errors, either intentional or deliberate.  If possible, this 
# system should integrate with an existing enterprise user management 
# system, such as, one based Active Directory or Kerberos.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000524
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

