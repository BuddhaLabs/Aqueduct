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
# Group ID (Vulid): RHEL-06-000091
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000091_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000091
# Rule Title: The system must ignore IPv4 ICMP redirect messages.
#
# Vulnerability Discussion: This feature of the IPv4 protocol has few 
# legitimate uses. It should be disabled unless it is absolutely required.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# The status of the "net.ipv4.conf.default.accept_redirects" kernel 
# parameter can be queried by running the following command: 

# $ sysctl net.ipv4.conf.default.accept_redirects

# The output of the command should indicate a value of "0". If this value 
# is not the default value, investigate how it could have been adjusted at 
# runtime, and verify it is not set improperly in "/etc/sysctl.conf". 
# If the correct value is not returned, this is a finding.
#
# Fix Text: 
#
# To set the runtime status of the 
# "net.ipv4.conf.default.accept_redirects" kernel parameter, run the 
# following command: 

# sysctl -w net.ipv4.conf.default.accept_redirects=0

# If this is not the system's default value, add the following line to 
# "/etc/sysctl.conf": 

# net.ipv4.conf.default.accept_redirects = 0

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000091
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

