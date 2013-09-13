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
# Group ID (Vulid): RHEL-06-000079
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000079_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000079
# Rule Title: The system must limit the ability of processes to have 
# simultaneous write and execute access to memory.
#
# Vulnerability Discussion: ExecShield uses the segmentation feature on 
# all x86 systems to prevent execution in memory higher than a certain 
# address. It writes an address as a limit in the code segment descriptor, 
# to control where code can be executed, on a per-process basis. When the 
# kernel places a process's memory regions such as the stack and heap 
# higher than this address, the hardware prevents execution in that address 
# range.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# The status of the "kernel.exec-shield" kernel parameter can be queried 
# by running the following command: 

# $ sysctl kernel.exec-shield

# The output of the command should indicate a value of "1". If this value 
# is not the default value, investigate how it could have been adjusted at 
# runtime, and verify it is not set improperly in "/etc/sysctl.conf". 
# If the correct value is not returned, this is a finding.
#
# Fix Text: 
#
# To set the runtime status of the "kernel.exec-shield" kernel parameter, 
# run the following command: 

# sysctl -w kernel.exec-shield=1

# If this is not the system's default value, add the following line to 
# "/etc/sysctl.conf": 

# kernel.exec-shield = 1

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000079
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY
KES=` sysctl kernel.exec-shield | awk '{ print $NF}'`

#END_CHECK
#BEGIN_REMEDY

if [ $KES -ne 1 ]
then
    grep "^kernel.exec-shield" /etc/sysctl.conf
    if [ $? != 0 ]
    then
        echo "kernel.exec-shield = 1" >> /etc/sysctl.conf
    fi

    sysctl -w kernel.exec-shield=1 > /dev/null
fi

