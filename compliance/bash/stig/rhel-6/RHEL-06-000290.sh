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
# Group ID (Vulid): RHEL-06-000290
# Group Title: SRG-OS-000248
#
   
# Rule ID: RHEL-06-000290_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000290
# Rule Title: X Windows must not be enabled unless required.
#
# Vulnerability Discussion: Unnecessary services should be disabled to 
# decrease the attack surface of the system.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To verify the default runlevel is 3, run the following command: 

# grep initdefault /etc/inittab

# The output should show the following: 

# id:3:initdefault:


# If it does not, this is a finding.
#
# Fix Text: 
#
# Setting the system's runlevel to 3 will prevent automatic startup of 
# the X server. To do so, ensure the following line in "/etc/inittab" 
# features a "3" as shown: 

# id:3:initdefault:

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000290
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

