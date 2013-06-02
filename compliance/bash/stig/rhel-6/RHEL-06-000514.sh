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
# Group ID (Vulid): RHEL-06-000514
# Group Title: SRG-OS-000090
#
   
# Rule ID: RHEL-06-000514_rule
# Severity: high
# Rule Version (STIG-ID): RHEL-06-000514
# Rule Title: The RPM package management tool must cryptographically 
# verify the authenticity of all software packages during installation.
#
# Vulnerability Discussion: Ensuring all packages' cryptographic 
# signatures are valid prior to installation ensures the provenance of the 
# software and protects against malicious tampering.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Verify RPM signature validation is not disabled:
# grep nosignature /etc/rpmrc /usr/lib/rpm/rpmrc 
# /usr/lib/rpm/redhat/rpmrc ~root/.rpmrc
# If any configuration is found, this is a finding.
#
# Fix Text: 
#
# Edit the RPM configuration files containing the "nosignature" option 
# and remove the option.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000514
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

