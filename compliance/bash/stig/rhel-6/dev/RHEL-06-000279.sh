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
# Group ID (Vulid): RHEL-06-000279
# Group Title: SRG-OS-000257
#
   
# Rule ID: RHEL-06-000279_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000279
# Rule Title: The system package management tool must verify ownership on 
# all files and directories associated with the "audit" package.
#
# Vulnerability Discussion: Ownership of audit binaries and configuration 
# files that is incorrect could allow an unauthorized user to gain 
# privileges that they should not have. The ownership set by the vendor 
# should be maintained. Any deviations from this baseline should be 
# investigated.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# The following command will list which audit files on the system have 
# ownership different from what is expected by the RPM database: 

# rpm -V audit | grep '^.....U'


# If there is output, this is a finding.
#
# Fix Text: 
#
# The RPM package management system can restore file ownership of the 
# audit package files and directories. The following command will update 
# audit files with ownership different from what is expected by the RPM 
# database: 

# rpm --setugids audit

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000279
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

