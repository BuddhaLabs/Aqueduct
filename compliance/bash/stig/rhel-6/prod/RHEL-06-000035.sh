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
# Group ID (Vulid): RHEL-06-000035
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000035_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000035
# Rule Title: The /etc/shadow file must have mode 0000.
#
# Vulnerability Discussion: The "/etc/shadow" file contains the list of 
# local system accounts and stores password hashes. Protection of this file 
# is critical for system security. Failure to give ownership of this file 
# to root provides the designated owner with access to sensitive 
# information which could weaken the system security posture.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check the permissions of "/etc/shadow", run the command: 

# $ ls -l /etc/shadow

# If properly configured, the output should indicate the following 
# permissions: "----------" 
# If it does not, this is a finding.
#
# Fix Text: 
#
# To properly set the permissions of "/etc/shadow", run the command: 

# chmod 0000 /etc/shadow

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000035
#
#BEGIN_CHECK
if [ -a "/etc/shadow" ]
  then
    # Pull the actual permissions
    FILEPERMS=`stat -L --format='%04a' /etc/shadow`

    # Break the actual file octal permissions up per entity
    FILESPECIAL=${FILEPERMS:0:1}
    FILEOWNER=${FILEPERMS:1:1}
    FILEGROUP=${FILEPERMS:2:1}
    FILEOTHER=${FILEPERMS:3:1}

    # Run check by 'and'ing the unwanted mask(7777)
    if [ $(($FILESPECIAL&7)) != "0" ] || [ $(($FILEOWNER&7)) != "0" ] || [ $(($FILEGROUP&7)) != "0" ] || [ $(($FILEOTHER&7)) != "0" ]
    then
#END_CHECK
#BEGIN_REMEDY
        chmod 0000 /etc/shadow
    fi
fi
#END_REMEDY

