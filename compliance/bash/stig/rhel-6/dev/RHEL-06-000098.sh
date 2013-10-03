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
# Group ID (Vulid): RHEL-06-000098
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000098_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000098
# Rule Title: The IPv6 protocol handler must not be bound to the network 
# stack unless needed.
#
# Vulnerability Discussion: Any unnecessary network stacks - including 
# IPv6 - should be disabled, to reduce the vulnerability to exploitation.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# If the system uses IPv6, this is not applicable.

# If the system is configured to prevent the loading of the "ipv6" kernel 
# module, it will contain a line of the form: 

# options ipv6 disable=1

# Such lines may be inside any file in "/etc/modprobe.d" or the 
# deprecated"/etc/modprobe.conf". This permits insertion of the IPv6 kernel 
# module (which other parts of the system expect to be present), but 
# otherwise keeps it inactive. Run the following command to search for such 
# lines in all files in "/etc/modprobe.d" and the deprecated 
# "/etc/modprobe.conf": 

# $ grep -r ipv6 /etc/modprobe.conf /etc/modprobe.d


# If the IPv6 kernel module is loaded, this is a finding.
#
# Fix Text: 
#
# To prevent the IPv6 kernel module ("ipv6") from loading the IPv6 
# networking stack, add the following line to 
# "/etc/modprobe.d/disabled.conf" (or another file in "/etc/modprobe.d"): 

# options ipv6 disable=1

# This permits the IPv6 module to be loaded (and thus satisfy other modules 
# that depend on it), while disabling support for the IPv6 protocol.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000098
#
#BEGIN_CHECK
. ./aqueduct_functions
HAS_IPV6=`grep -r ipv6 /etc/modprobe.d | grep ':options' |  wc -l`

#END_CHECK
#BEGIN_REMEDY


#END_CHECK
#BEGIN_REMEDY

if [ "$HAS_IPV6" -lt 1 ]
then
        echo "options ipv6 disable=1" > /etc/modprobe.d/ipv6.conf
fi

#END_REMEDY

