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
# Group ID (Vulid): RHEL-06-000220
# Group Title: SRG-OS-000095
#
   
# Rule ID: RHEL-06-000220_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000220
# Rule Title: The ypserv package must not be installed.
#
# Vulnerability Discussion: Removing the "ypserv" package decreases the 
# risk of the accidental (or intentional) activation of NIS or NIS+ 
# services.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Run the following command to determine if the "ypserv" package is 
# installed: 

# rpm -q ypserv


# If the package is installed, this is a finding.
#
# Fix Text: 
#
# The "ypserv" package can be uninstalled with the following command: 

# yum erase ypserv

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000220
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

