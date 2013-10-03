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
# Group ID (Vulid): RHEL-06-000096
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000096_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000096
# Rule Title: The system must use a reverse-path filter for IPv4 network 
# traffic when possible on all interfaces.
#
# Vulnerability Discussion: Enabling reverse path filtering drops packets 
# with source addresses that should not have been able to be received on 
# the interface they were received on. It should not be used on systems 
# which are routers for complicated networks, but is helpful for end hosts 
# and routers serving small networks.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# The status of the "net.ipv4.conf.all.rp_filter" kernel parameter can be 
# queried by running the following command: 

# $ sysctl net.ipv4.conf.all.rp_filter

# The output of the command should indicate a value of "1". If this value 
# is not the default value, investigate how it could have been adjusted at 
# runtime, and verify it is not set improperly in "/etc/sysctl.conf". 
# If the correct value is not returned, this is a finding.
#
# Fix Text: 
#
# To set the runtime status of the "net.ipv4.conf.all.rp_filter" kernel 
# parameter, run the following command: 

# sysctl -w net.ipv4.conf.all.rp_filter=1

# If this is not the system's default value, add the following line to 
# "/etc/sysctl.conf": 

# net.ipv4.conf.all.rp_filter = 1

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000096
#
#BEGIN_CHECK

. ./aqueduct_functions

I4CARP=`sysctl net.ipv4.conf.all.rp_filter | awk '{ print $NF }'`

#END_CHECK
#BEGIN_REMEDY

if [ $I4CARP -ne 1 ]
then
	edit_file /etc/sysctl.conf $PDI "net.ipv4.conf.all.rp_filter = 1" "net.ipv4.conf.all.rp_filter"
fi

sysctl -p > /dev/null

#END_REMEDY

