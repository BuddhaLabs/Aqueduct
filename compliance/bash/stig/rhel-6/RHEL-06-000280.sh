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
# Group ID (Vulid): RHEL-06-000280
# Group Title: SRG-OS-000258
#
   
# Rule ID: RHEL-06-000280_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000280
# Rule Title: The system package management tool must verify 
# group-ownership on all files and directories associated with the "audit" 
# package.
#
# Vulnerability Discussion: Group-ownership of audit binaries and 
# configuration files that is incorrect could allow an unauthorized user to 
# gain privileges that they should not have. The group-ownership set by the 
# vendor should be maintained. Any deviations from this baseline should be 
# investigated.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# The following command will list which audit files on the system have 
# group-ownership different from what is expected by the RPM database: 

# rpm -V audit | grep '^......G'


# If there is output, this is a finding.
#
# Fix Text: 
#
# The RPM package management system can restore file group-ownership of 
# the audit package files and directories. The following command will 
# update audit files with group-ownership different from what is expected 
# by the RPM database: 

# rpm --setugids audit

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000280
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

