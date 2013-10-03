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
#    1.1     |  Script add test and fix |  Leam Hall         | 3-OCT-2013
#	                                                                  
   
#	
#######################DISA INFORMATION##################################
# Group ID (Vulid): RHEL-06-000040
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000040_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000040
# Rule Title: The /etc/passwd file must be group-owned by root.
#
# Vulnerability Discussion: The "/etc/passwd" file contains information 
# about the users that are configured on the system. Protection of this 
# file is critical for system security.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check the group ownership of "/etc/passwd", run the command: 

# $ ls -l /etc/passwd

# If properly configured, the output should indicate the following 
# group-owner. "root" 
# If it does not, this is a finding.
#
# Fix Text: 
#
# To properly set the group owner of "/etc/passwd", run the command: 

# chgrp root /etc/passwd 

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000040
#
#BEGIN_CHECK
if [ -a "/etc/passwd" ]
then
    CURGOWN=`stat -c %G /etc/passwd`;
fi

if [ "$CURGOWN" != "root" ]
then

#END_CHECK
#BEGIN_REMEDY
    chgrp root /etc/passwd
fi

#END_REMEDY

