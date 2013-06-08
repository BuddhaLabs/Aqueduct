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
# Group ID (Vulid): RHEL-06-000519
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000519_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000519
# Rule Title: The system package management tool must verify contents of 
# all files associated with packages.
#
# Vulnerability Discussion: The hash on important files like system 
# executables should match the information given by the RPM database. 
# Executables with erroneous hashes could be a sign of nefarious activity 
# on the system.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# The following command will list which files on the system have file 
# hashes different from what is expected by the RPM database. 

# rpm -Va | grep '$1 ~ /..5/ && $2 != "c"'


# If there is output, this is a finding.
#
# Fix Text: 
#
# The RPM package management system can check the hashes of installed 
# software packages, including many that are important to system security. 
# Run the following command to list which files on the system have hashes 
# that differ from what is expected by the RPM database: 

# rpm -Va | grep '^..5'

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
PDI=RHEL-06-000519
#
#This could get ugly, so were gonna assume that the system is bound to some sort of REPO
#that can reinstall packages should they fall out of sync with the RPMDB.
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

