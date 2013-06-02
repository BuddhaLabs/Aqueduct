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
# Group ID (Vulid): RHEL-06-000291
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000291_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000291
# Rule Title: The xorg-x11-server-common (X Windows) package must not be 
# installed, unless required.
#
# Vulnerability Discussion: Unnecessary packages should not be installed 
# to decrease the attack surface of the system.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To ensure the X Windows package group is removed, run the following 
# command: 

# $ rpm -qi xorg-x11-server-common

# The output should be: 

# package xorg-x11-server-common is not installed


# If it is not, this is a finding.
#
# Fix Text: 
#
# Removing all packages which constitute the X Window System ensures 
# users or malicious software cannot start X. To do so, run the following 
# command: 

# yum groupremove "X Window System"

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000291
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

