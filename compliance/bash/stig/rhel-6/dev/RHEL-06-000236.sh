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
# Group ID (Vulid): RHEL-06-000236
# Group Title: SRG-OS-000106
#
   
# Rule ID: RHEL-06-000236_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000236
# Rule Title: The SSH daemon must not allow host-based authentication.
#
# Vulnerability Discussion: SSH trust relationships mean a compromise on 
# one host can allow an attacker to move trivially to other hosts.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To determine how the SSH daemon's "HostbasedAuthentication" option is 
# set, run the following command: 

# grep -i HostbasedAuthentication /etc/ssh/sshd_config

# If no line, a commented line, or a line indicating the value "no" is 
# returned, then the required value is set. 
# If the required value is not set, this is a finding.
#
# Fix Text: 
#
# SSH's cryptographic host-based authentication is more secure than 
# ".rhosts" authentication, since hosts are cryptographically 
# authenticated. However, it is not recommended that hosts unilaterally 
# trust one another, even within an organization. 

# To disable host-based authentication, add or correct the following line 
# in "/etc/ssh/sshd_config": 

# HostbasedAuthentication no

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000236
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

