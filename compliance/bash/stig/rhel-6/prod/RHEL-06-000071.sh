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
# Group ID (Vulid): RHEL-06-000071
# Group Title: SRG-OS-000030
#
   
# Rule ID: RHEL-06-000071_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000071
# Rule Title: The system must allow locking of the console screen in text 
# mode.
#
# Vulnerability Discussion: Installing "screen" ensures a console locking 
# capability is available for users who may need to suspend console logins.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Run the following command to determine if the "screen" package is 
# installed: 

# rpm -q screen


# If the package is not installed, this is a finding.
#
# Fix Text: 
#
# To enable console screen locking when in text mode, install the 
# "screen" package: 

# yum install screen

# Instruct users to begin new terminal sessions with the following command: 

# $ screen

# The console can now be locked with the following key combination: 

# ctrl+a x

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000071
#
#BEGIN_CHECK

rpm -q screen > /dev/null

#END_CHECK
#BEGIN_REMEDY

if [ $? != 0 ]
then
    yum -y install screen --skip-broken > /dev/null 2>&1
fi


#END_REMEDY

