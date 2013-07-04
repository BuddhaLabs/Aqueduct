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
# Group ID (Vulid): RHEL-06-000088
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000088_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000088
# Rule Title: The system must log Martian packets.
#
# Vulnerability Discussion: The presence of "martian" packets (which have 
# impossible addresses) as well as spoofed packets, source-routed packets, 
# and redirects could be a sign of nefarious network activity. Logging 
# these packets enables this activity to be detected.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# The status of the "net.ipv4.conf.all.log_martians" kernel parameter can 
# be queried by running the following command: 

# $ sysctl net.ipv4.conf.all.log_martians

# The output of the command should indicate a value of "1". If this value 
# is not the default value, investigate how it could have been adjusted at 
# runtime, and verify it is not set improperly in "/etc/sysctl.conf". 
# If the correct value is not returned, this is a finding.
#
# Fix Text: 
#
# To set the runtime status of the "net.ipv4.conf.all.log_martians" 
# kernel parameter, run the following command: 

# sysctl -w net.ipv4.conf.all.log_martians=1

# If this is not the system's default value, add the following line to 
# "/etc/sysctl.conf": 

# net.ipv4.conf.all.log_martians = 1

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000088
#
#BEGIN_CHECK

I4CALM=` sysctl net.ipv4.conf.all.log_martians | awk '{ print $NF}'`

#END_CHECK
#BEGIN_REMEDY

if [ $I4CALM -ne 1 ]
then
    grep "^net.ipv4.conf.all.log_martians = 1" /etc/sysctl.conf
    if [ $? != 0 ]
    then
        echo "net.ipv4.conf.all.log_martians = 1" >> /etc/sysctl.conf
    fi

    sysctl -w net.ipv4.conf.all.log_martians=1 > /dev/null
fi

#END_REMEDY

