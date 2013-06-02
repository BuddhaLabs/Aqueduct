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
# Group ID (Vulid): RHEL-06-000008
# Group Title: SRG-OS-000090
#
   
# Rule ID: RHEL-06-000008_rule
# Severity: high
# Rule Version (STIG-ID): RHEL-06-000008
# Rule Title: Vendor-provided cryptographic certificates must be 
# installed to verify the integrity of system software.
#
# Vulnerability Discussion: This key is necessary to cryptographically 
# verify packages are from Red Hat.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To ensure that the GPG key is installed, run: 

# $ rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey

# The command should return the string below: 

# gpg(Red Hat, Inc. (release key <security@redhat.com>)


# If the Red Hat GPG Key is not installed, this is a finding.
#
# Fix Text: 
#
# To ensure the system can cryptographically verify base software 
# packages come from Red Hat (and to connect to the Red Hat Network to 
# receive them if desired), the Red Hat GPG key must properly be installed. 
# To ensure the GPG key is installed, run: 

# rhn_register

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000008
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

