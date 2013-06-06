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
# Group ID (Vulid): RHEL-06-000227
# Group Title: SRG-OS-000112
#
   
# Rule ID: RHEL-06-000227_rule
# Severity: high
# Rule Version (STIG-ID): RHEL-06-000227
# Rule Title: The SSH daemon must be configured to use only the SSHv2 
# protocol.
#
# Vulnerability Discussion: SSH protocol version 1 suffers from design 
# flaws that result in security vulnerabilities and should not be used.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check which SSH protocol version is allowed, run the following 
# command: 

# grep Protocol /etc/ssh/sshd_config

# If configured properly, output should be 

# Protocol 2


# If it is not, this is a finding.
#
# Fix Text: 
#
# Only SSH protocol version 2 connections should be permitted. The 
# default setting in "/etc/ssh/sshd_config" is correct, and can be verified 
# by ensuring that the following line appears: 

# Protocol 2

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000227
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

