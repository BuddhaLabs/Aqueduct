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
# Group ID (Vulid): RHEL-06-000016
# Group Title: SRG-OS-000232
#
   
# Rule ID: RHEL-06-000016_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000016
# Rule Title: A file integrity tool must be installed.
#
# Vulnerability Discussion: The AIDE package must be installed if it is 
# to be available for integrity checking.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# If another file integrity tool is installed, this is not a finding.

# Run the following command to determine if the "aide" package is 
# installed: 

# rpm -q aide


# If the package is not installed, this is a finding.
#
# Fix Text: 
#
# Install the AIDE package with the command: 

# yum install aide

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000016
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

