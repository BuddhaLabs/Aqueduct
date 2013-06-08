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
# Group ID (Vulid): RHEL-06-000013
# Group Title: SRG-OS-000103
#
   
# Rule ID: RHEL-06-000013_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000013
# Rule Title: The system package management tool must cryptographically 
# verify the authenticity of system software packages during installation.
#
# Vulnerability Discussion: Ensuring the validity of packages' 
# cryptographic signatures prior to installation ensures the provenance of 
# the software and protects against malicious tampering.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To determine whether "yum" is configured to use "gpgcheck", inspect 
# "/etc/yum.conf" and ensure the following appears in the "[main]" section: 

# gpgcheck=1

# A value of "1" indicates that "gpgcheck" is enabled. Absence of a 
# "gpgcheck" line or a setting of "0" indicates that it is disabled. 
# If GPG checking is not enabled, this is a finding.

# If the "yum" system package management tool is not used to update the 
# system, verify with the SA that installed packages are cryptographically 
# signed.
#
# Fix Text: 
#
# The "gpgcheck" option should be used to ensure checking of an RPM 
# package's signature always occurs prior to its installation. To configure 
# yum to check package signatures before installing them, ensure the 
# following line appears in "/etc/yum.conf" in the "[main]" section: 

# gpgcheck=1

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000013
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
if [ -f /etc/yum.conf ]
then
    sed -i "s/gpgcheck=0/gpgcheck=1/g" /etc/yum.conf
fi

#END_REMEDY

