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
# Group ID (Vulid): RHEL-06-000067
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000067_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000067
# Rule Title: The system boot loader configuration file(s) must have mode 
# 0600 or less permissive.
#
# Vulnerability Discussion: Proper permissions ensure that only the root 
# user can modify important boot parameters.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check the permissions of "/etc/grub.conf", run the command: 

# $ ls -lL /etc/grub.conf

# If properly configured, the output should indicate the following 
# permissions: "-rw-------" 
# If it does not, this is a finding.
#
# Fix Text: 
#
# File permissions for "/etc/grub.conf" should be set to 600, which is 
# the default. To properly set the permissions of "/etc/grub.conf", run the 
# command: 

# chmod 600 /etc/grub.conf

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000067
#
#BEGIN_CHECK

FILE=`ls -l /etc/grub.conf | awk '{ print $NF}'`
FILE=/etc/$FILE
ls -l $FILE | grep '^-rw-------' > /dev/null

#END_CHECK
#BEGIN_REMEDY

if [ $? -ne 0 ]
then
    chmod 0600 $FILE
fi


#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

