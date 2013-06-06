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
# Group ID (Vulid): RHEL-06-000523
# Group Title: SRG-OS-000231
#
   
# Rule ID: RHEL-06-000523_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000523
# Rule Title: The system's local IPv6 firewall must implement a deny-all, 
# allow-by-exception policy for inbound packets.
#
# Vulnerability Discussion: In "ip6tables" the default policy is applied 
# only after all the applicable rules in the table are examined for a 
# match. Setting the default policy to "DROP" implements proper design for 
# a firewall, i.e., any packets which are not explicitly permitted should 
# not be accepted.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Inspect the file "/etc/sysconfig/ip6tables" to determine the default 
# policy for the INPUT chain. It should be set to DROP. 

# grep ":INPUT" /etc/sysconfig/ip6tables

# If the default policy for the INPUT chain is not set to DROP, this is a 
# finding.
#
# Fix Text: 
#
# To set the default policy to DROP (instead of ACCEPT) for the built-in 
# INPUT chain which processes incoming packets, add or correct the 
# following line in "/etc/sysconfig/ip6tables": 

# :INPUT DROP [0:0]

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000523
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

