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
# Group ID (Vulid): RHEL-06-000281
# Group Title: SRG-OS-000278
#
   
# Rule ID: RHEL-06-000281_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000281
# Rule Title: The system package management tool must verify contents of 
# all files associated with the audit package.
#
# Vulnerability Discussion: The hash on important files like audit system 
# executables should match the information given by the RPM database. Audit 
# executables  with erroneous hashes could be a sign of nefarious activity 
# on the system.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# The following command will list which audit files on the system have 
# file hashes different from what is expected by the RPM database. 

# rpm -V audit | grep '$1 ~ /..5/ && $2 != "c"'


# If there is output, this is a finding.
#
# Fix Text: 
#
# The RPM package management system can check the hashes of audit system 
# package files. Run the following command to list which audit files on the 
# system have hashes that differ from what is expected by the RPM database: 

# rpm -V audit | grep '^..5'

# A "c" in the second column indicates that a file is a configuration file, 
# which may appropriately be expected to change. If the file that has 
# changed was not expected to then refresh from distribution media or 
# online repositories. 

# rpm -Uvh [affected_package]

# OR 

# yum reinstall [affected_package]

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000281
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

