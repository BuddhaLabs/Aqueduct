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
# Group ID (Vulid): RHEL-06-000078
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000078_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000078
# Rule Title: The system must implement virtual address space 
# randomization.
#
# Vulnerability Discussion: Address space layout randomization (ASLR) 
# makes it more difficult for an attacker to predict the location of attack 
# code he or she has introduced into a process's address space during an 
# attempt at exploitation. Additionally, ASLR also makes it more difficult 
# for an attacker to know the location of existing code in order to 
# repurpose it using return oriented programming (ROP) techniques.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# The status of the "kernel.randomize_va_space" kernel parameter can be 
# queried by running the following command: 

# $ sysctl kernel.randomize_va_space

# The output of the command should indicate a value of at least "1" 
# (preferably "2"). If this value is not the default value, investigate how 
# it could have been adjusted at runtime, and verify it is not set 
# improperly in "/etc/sysctl.conf". 
# If the correct value is not returned, this is a finding.
#
# Fix Text: 
#
# To set the runtime status of the "kernel.randomize_va_space" kernel 
# parameter, run the following command: 

# sysctl -w kernel.randomize_va_space=2

# If this is not the system's default value, add the following line to 
# "/etc/sysctl.conf": 

# kernel.randomize_va_space = 2

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000078
#
#BEGIN_CHECK


KRVS=` sysctl kernel.randomize_va_space | awk '{ print $NF}'`

#END_CHECK
#BEGIN_REMEDY

if [ $KRVS -lt 2 ]
then
    grep "^kernel.randomize_va_space" /etc/sysctl.conf
    if [ $? != 0 ]
    then
        echo "kernel.randomize_va_space = 2" >> /etc/sysctl.conf
    fi

    sysctl -w kernel.randomize_va_space=2 > /dev/null
fi

#END_REMEDY

