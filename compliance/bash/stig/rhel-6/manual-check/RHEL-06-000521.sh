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
# Group ID (Vulid): RHEL-06-000521
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000521_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000521
# Rule Title: The mail system must forward all mail for root to one or 
# more system administrators.
#
# Vulnerability Discussion: A number of system services utilize email 
# messages sent to the root user to notify system administrators of active 
# or impending issues.  These messages must be forwarded to at least one 
# monitored email address.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Find the list of alias maps used by the Postfix mail server:

# postconf alias_maps

# Query the Postfix alias maps for an alias for "root":

# postmap -q root <alias_map>

# If there are no aliases configured for root that forward to a monitored 
# email address, this is a finding.
#
# Fix Text: 
#
# Set up an alias for root that forwards to a monitored email address:

# echo "root: <system.administrator>@mail.mil" >> /etc/aliases
# newaliases  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000521
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

#This isn't something we can remediate.  We could facilitate the check, but not the
#fix...So into the manual-check folder with ya!
