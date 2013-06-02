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
# Group ID (Vulid): RHEL-06-000222
# Group Title: SRG-OS-000095
#
   
# Rule ID: RHEL-06-000222_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000222
# Rule Title: The tftp-server package must not be installed.
#
# Vulnerability Discussion: Removing the "tftp-server" package decreases 
# the risk of the accidental (or intentional) activation of tftp services.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Run the following command to determine if the "tftp-server" package is 
# installed: 

# rpm -q tftp-server


# If the package is installed, this is a finding.
#
# Fix Text: 
#
# The "tftp-server" package can be removed with the following command: 

# yum erase tftp-server

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000222
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

