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
# Group ID (Vulid): RHEL-06-000298
# Group Title: SRG-OS-000123
#
   
# Rule ID: RHEL-06-000298_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000298
# Rule Title: Emergency accounts must be provisioned with an expiration 
# date.
#
# Vulnerability Discussion: When emergency accounts are created, there is 
# a risk they may remain in place and active after the need for them no 
# longer exists. Account expiration greatly reduces the risk of accounts 
# being misused or hijacked. 

#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# For every emergency account, run the following command to obtain its 
# account aging and expiration information: 

# chage -l [USER]

# Verify each of these accounts has an expiration date set as documented. 
# If any emergency accounts have no expiration date set or do not expire 
# within a documented time frame, this is a finding.
#
# Fix Text: 
#
# In the event emergency accounts are required, configure the system to 
# terminate them after a documented time period. For every emergency 
# account, run the following command to set an expiration date on it, 
# substituting "[USER]" and "[YYYY-MM-DD]" appropriately: 

# chage -E [YYYY-MM-DD] [USER]

# "[YYYY-MM-DD]" indicates the documented expiration date for the account.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000298
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

