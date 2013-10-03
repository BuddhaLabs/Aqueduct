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
#    1.1     |  Script add test and fix |  Leam Hall         | 3-OCT-2013
#	                                                                  
   
#	
#######################DISA INFORMATION##################################
# Group ID (Vulid): RHEL-06-000204
# Group Title: SRG-OS-000096
#
   
# Rule ID: RHEL-06-000204_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000204
# Rule Title: The xinetd service must be uninstalled if no network 
# services utilizing it are enabled.
#
# Vulnerability Discussion: Removing the "xinetd" package decreases the 
# risk of the xinetd service's accidental (or intentional) activation.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# If network services are using the xinetd service, this is not 
# applicable.

# Run the following command to determine if the "xinetd" package is 
# installed: 

# rpm -q xinetd


# If the package is installed, this is a finding.
#
# Fix Text: 
#
# The "xinetd" package can be uninstalled with the following command: 

# yum erase xinetd

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000204
#
#BEGIN_CHECK

. ./aqueduct_functions
is_rpm_installed xinetd

#END_CHECK
#BEGIN_REMEDY
if [ $? -eq 0 ]
then
	remove_rpm xinetd
fi

#END_REMEDY

