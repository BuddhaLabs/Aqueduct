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
# Group ID (Vulid): RHEL-06-000099
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000099_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000099
# Rule Title: The system must ignore ICMPv6 redirects by default.
#
# Vulnerability Discussion: An illicit ICMP redirect message could result 
# in a man-in-the-middle attack.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# The status of the "net.ipv6.conf.default.accept_redirects" kernel 
# parameter can be queried by running the following command: 

# $ sysctl net.ipv6.conf.default.accept_redirects

# The output of the command should indicate a value of "0". If this value 
# is not the default value, investigate how it could have been adjusted at 
# runtime, and verify it is not set improperly in "/etc/sysctl.conf". 
# If the correct value is not returned, this is a finding.
#
# Fix Text: 
#
# To set the runtime status of the 
# "net.ipv6.conf.default.accept_redirects" kernel parameter, run the 
# following command: 

# sysctl -w net.ipv6.conf.default.accept_redirects=0

# If this is not the system's default value, add the following line to 
# "/etc/sysctl.conf": 

# net.ipv6.conf.default.accept_redirects = 0

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000099
#
#BEGIN_CHECK

. ./aqueduct_functions
NI6CDAR=`sysctl net.ipv6.conf.default.accept_redirects | awk '{ print $NF}'`

#END_CHECK
#BEGIN_REMEDY

if [ $NI6CDAR -gt 0 ]
then
        edit_file  "/etc/sysctl.conf" $PDI "net.ipv6.conf.default.accept_redirects = 0" "net.ipv6.conf.default.accept_redirects"
        sysctl -w net.ipv6.conf.default.accept_redirects=0
fi

#END_REMEDY

