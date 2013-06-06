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
# Group ID (Vulid): RHEL-06-000308
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000308_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000308
# Rule Title: Process core dumps must be disabled unless needed.
#
# Vulnerability Discussion: A core dump includes a memory image taken at 
# the time the operating system terminates an application. The memory image 
# could contain sensitive data and is generally useful only for developers 
# trying to debug problems.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To verify that core dumps are disabled for all users, run the following 
# command: 

# $ grep core /etc/security/limits.conf

# The output should be: 

# * hard core 0


# If it is not, this is a finding.
#
# Fix Text: 
#
# To disable core dumps for all users, add the following line to 
# "/etc/security/limits.conf": 

# * hard core 0

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000308
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

