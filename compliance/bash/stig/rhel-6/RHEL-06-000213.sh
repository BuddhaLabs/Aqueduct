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
# Group ID (Vulid): RHEL-06-000213
# Group Title: SRG-OS-000095
#
   
# Rule ID: RHEL-06-000213_rule
# Severity: high
# Rule Version (STIG-ID): RHEL-06-000213
# Rule Title: The rsh-server package must not be installed.
#
# Vulnerability Discussion: The "rsh-server" package provides several 
# obsolete and insecure network services. Removing it decreases the risk of 
# those services' accidental (or intentional) activation.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Run the following command to determine if the "rsh-server" package is 
# installed: 

# rpm -q rsh-server


# If the package is installed, this is a finding.
#
# Fix Text: 
#
# The "rsh-server" package can be uninstalled with the following command: 

# yum erase rsh-server

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000213
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

