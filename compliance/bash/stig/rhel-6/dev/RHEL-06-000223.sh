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
# Group ID (Vulid): RHEL-06-000223
# Group Title: SRG-OS-000248
#
   
# Rule ID: RHEL-06-000223_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000223
# Rule Title: The TFTP service must not be running.
#
# Vulnerability Discussion: Disabling the "tftp" service ensures the 
# system is not acting as a tftp server, which does not provide encryption 
# or authentication.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check that the "tftp" service is disabled in system boot 
# configuration, run the following command: 

# chkconfig "tftp" --list

# Output should indicate the "tftp" service has either not been installed, 
# or has been disabled at all runlevels, as shown in the example below: 

# chkconfig "tftp" --list
# "tftp" 0:off 1:off 2:off 3:off 4:off 5:off 6:off

# Run the following command to verify "tftp" is disabled through current 
# runtime configuration: 

# service tftp status

# If the service is disabled the command will return the following output: 

# tftp is stopped


# If the service is running, this is a finding.
#
# Fix Text: 
#
# The "tftp" service should be disabled. The "tftp" service can be 
# disabled with the following command: 

# chkconfig tftp off

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000223
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

