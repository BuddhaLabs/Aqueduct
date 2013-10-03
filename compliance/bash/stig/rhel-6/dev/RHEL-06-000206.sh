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
# Group ID (Vulid): RHEL-06-000206
# Group Title: SRG-OS-000095
#
   
# Rule ID: RHEL-06-000206_rule
# Severity: high
# Rule Version (STIG-ID): RHEL-06-000206
# Rule Title: The telnet-server package must not be installed.
#
# Vulnerability Discussion: Removing the "telnet-server" package 
# decreases the risk of the unencrypted telnet service's accidental (or 
# intentional) activation.

# Mitigation:  If the telnet-server package is configured to only allow 
# encrypted sessions, such as with Kerberos or the use of encrypted network 
# tunnels, the risk of exposing sensitive information is mitigated.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Run the following command to determine if the "telnet-server" package 
# is installed: 

# rpm -q telnet-server


# If the package is installed, this is a finding.
#
# Fix Text: 
#
# The "telnet-server" package can be uninstalled with the following 
# command: 

# yum erase telnet-server

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000206
#
#BEGIN_CHECK

rpm -q telnet-server 

#END_CHECK
#BEGIN_REMEDY

if [ $? -eq 0 ]
then
	rpm -e telnet-server
fi

#END_REMEDY

