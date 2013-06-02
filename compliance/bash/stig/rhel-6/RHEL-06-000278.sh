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
# Group ID (Vulid): RHEL-06-000278
# Group Title: SRG-OS-000256
#
   
# Rule ID: RHEL-06-000278_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000278
# Rule Title: The system package management tool must verify permissions 
# on all files and directories associated with the "audit" package.
#
# Vulnerability Discussion: Permissions on audit binaries and 
# configuration files that are too generous could allow an unauthorized 
# user to gain privileges that they should not have. The permissions set by 
# the vendor should be maintained. Any deviations from this baseline should 
# be investigated.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# The following command will list which audit files on the system have 
# permissions different from what is expected by the RPM database: 

# rpm -V audit | grep '^.M'

# If there is any output, for each file or directory found, compare the 
# RPM-expected permissions with the permissions on the file or directory:

# rpm -q --queryformat "[%{FILENAMES} %{FILEMODES:perms}\n]" audit | grep 
#  [filename]
# ls -lL [filename]

# If the existing permissions are more permissive than those expected by 
# RPM, this is a finding.
#
# Fix Text: 
#
# The RPM package management system can restore file access permissions 
# of the audit package files and directories. The following command will 
# update audit files with permissions different from what is expected by 
# the RPM database: 

# rpm --setperms audit

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000278
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

