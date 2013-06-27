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
# Group ID (Vulid): RHEL-06-000066
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000066_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000066
# Rule Title: The system boot loader configuration file(s) must be 
# group-owned by root.
#
# Vulnerability Discussion: The "root" group is a highly-privileged 
# group. Furthermore, the group-owner of this file should not have any 
# access privileges anyway.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check the group ownership of "/etc/grub.conf", run the command: 

# $ ls -lL /etc/grub.conf

# If properly configured, the output should indicate the following 
# group-owner. "root" 
# If it does not, this is a finding.
#
# Fix Text: 
#
# The file "/etc/grub.conf" should be group-owned by the "root" group to 
# prevent destruction or modification of the file. To properly set the 
# group owner of "/etc/grub.conf", run the command: 

# chgrp root /etc/grub.conf 

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000066
#
#BEGIN_CHECK

GROUP=`ls -lL /etc/grub.conf | awk '{ print $4}'`
FILE=`ls -l /etc/grub.conf | awk '{ print $NF}'`
FILE=/etc/$FILE

#END_CHECK
#BEGIN_REMEDY

if [ "$OWNER" != "root" ]
then
    chgrp root $FILE
fi

#END_REMEDY

