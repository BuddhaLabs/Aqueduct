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
# Group ID (Vulid): RHEL-06-000321
# Group Title: SRG-OS-000160
#
   
# Rule ID: RHEL-06-000321_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000321
# Rule Title: The system must provide VPN connectivity for communications 
# over untrusted networks.
#
# Vulnerability Discussion: Providing the ability for remote users or 
# systems to initiate a secure VPN connection protects information when it 
# is transmitted over a wide area network.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Run the following command to determine if the "openswan" package is 
# installed: 

# rpm -q openswan


# If the package is not installed, this is a finding.
#
# Fix Text: 
#
# The Openswan package provides an implementation of IPsec and IKE, which 
# permits the creation of secure tunnels over untrusted networks. The 
# "openswan" package can be installed with the following command: 

# yum install openswan

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000321
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

