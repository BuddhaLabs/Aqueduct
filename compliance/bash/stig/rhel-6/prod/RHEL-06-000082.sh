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
# Group ID (Vulid): RHEL-06-000082
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000082_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000082
# Rule Title: IP forwarding for IPv4 must not be enabled, unless the 
# system is a router.
#
# Vulnerability Discussion: IP forwarding permits the kernel to forward 
# packets from one network interface to another. The ability to forward 
# packets between two networks is only appropriate for routers.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# If the system serves as a router, this is not applicable.

# The status of the "net.ipv4.ip_forward" kernel parameter can be queried 
# by running the following command: 

# $ sysctl net.ipv4.ip_forward

# The output of the command should indicate a value of "0". If this value 
# is not the default value, investigate how it could have been adjusted at 
# runtime, and verify it is not set improperly in "/etc/sysctl.conf". 
# If the correct value is not returned, this is a finding.
#
# Fix Text: 
#
# To set the runtime status of the "net.ipv4.ip_forward" kernel 
# parameter, run the following command: 

# sysctl -w net.ipv4.ip_forward=0

# If this is not the system's default value, add the following line to 
# "/etc/sysctl.conf": 

# net.ipv4.ip_forward = 0

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000082
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY

I4IF=` sysctl net.ipv4.ip_forward | awk '{ print $NF}'`

#END_CHECK
#BEGIN_REMEDY

if [ $I4IF -ne 0 ]
then
    grep "^net\.ipv4\.ip_forward" /etc/sysctl.conf
    if [ $? != 0 ]
    then
        echo "net.ipv4.ip_forward = 0" >> /etc/sysctl.conf
    fi

    sysctl -w net.ipv4.ip_forward=0 > /dev/null
fi

#END_REMEDY
