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
# Group ID (Vulid): RHEL-06-000126
# Group Title: SRG-OS-000096
#
   
# Rule ID: RHEL-06-000126_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000126
# Rule Title: The Reliable Datagram Sockets (RDS) protocol must be 
# disabled unless required.
#
# Vulnerability Discussion: Disabling RDS protects the system against 
# exploitation of any flaws in its implementation.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# If the system is configured to prevent the loading of the "rds" kernel 
# module, it will contain lines inside any file in "/etc/modprobe.d" or the 
# deprecated"/etc/modprobe.conf". These lines instruct the module loading 
# system to run another program (such as "/bin/true") upon a module 
# "install" event. Run the following command to search for such lines in 
# all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf": 

# $ grep -r rds /etc/modprobe.conf /etc/modprobe.d


# If no line is returned, this is a finding.
#
# Fix Text: 
#
# The Reliable Datagram Sockets (RDS) protocol is a transport layer 
# protocol designed to provide reliable high- bandwidth, low-latency 
# communications between nodes in a cluster. To configure the system to 
# prevent the "rds" kernel module from being loaded, add the following line 
# to a file in the directory "/etc/modprobe.d": 

# install rds /bin/true

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000126
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

