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
# Group ID (Vulid): RHEL-06-000320
# Group Title: SRG-OS-000147
#
   
# Rule ID: RHEL-06-000320_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000320
# Rule Title: The system's local firewall must implement a deny-all, 
# allow-by-exception policy for forwarded packets.
#
# Vulnerability Discussion: In "iptables" the default policy is applied 
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
# Run the following command to ensure the default "FORWARD" policy is 
# "DROP": 

# grep ":FORWARD" /etc/sysconfig/iptables

# The output must be the following: 

# grep ":FORWARD" /etc/sysconfig/iptables
# :FORWARD DROP [0:0]

# If it is not, this is a finding.


#
# Fix Text: 
#
# To set the default policy to DROP (instead of ACCEPT) for the built-in 
# FORWARD chain which processes packets that will be forwarded from one 
# interface to another, add or correct the following line in 
# "/etc/sysconfig/iptables": 

# :FORWARD DROP [0:0]

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000320
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

