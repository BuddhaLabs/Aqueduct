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
# Group ID (Vulid): RHEL-06-000015
# Group Title: SRG-OS-000103
#
   
# Rule ID: RHEL-06-000015_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000015
# Rule Title: The system package management tool must cryptographically 
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
# To determine whether "yum" has been configured to disable "gpgcheck" 
# for any repos, inspect all files in "/etc/yum.repos.d" and ensure the 
# following does not appear in any sections: 

# gpgcheck=0

# A value of "0" indicates that "gpgcheck" has been disabled for that repo. 
# If GPG checking is disabled, this is a finding.

# If the "yum" system package management tool is not used to update the 
# system, verify with the SA that installed packages are cryptographically 
# signed.
#
# Fix Text: 
#
# To ensure signature checking is not disabled for any repos, remove any 
# lines from files in "/etc/yum.repos.d" of the form: 

# gpgcheck=0

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000015
#
#BEGIN_CHECK
if [ -d /etc/yum.repos.d ]
then
#END_CHECK
#BEGIN_REMEDY
   for i in `ls /etc/yum.repos.d/*.repo`
   do
      sed -i "s/gpgcheck=0/gpgcheck=1/g" $i
   done
fi
#END_REMEDY

