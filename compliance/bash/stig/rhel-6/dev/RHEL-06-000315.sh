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
# Group ID (Vulid): RHEL-06-000315
# Group Title: SRG-OS-000034
#
   
# Rule ID: RHEL-06-000315_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000315
# Rule Title: The Bluetooth kernel module must be disabled.
#
# Vulnerability Discussion: If Bluetooth functionality must be disabled, 
# preventing the kernel from loading the kernel module provides an 
# additional safeguard against its activation.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# If the system is configured to prevent the loading of the "bluetooth" 
# kernel module, it will contain lines inside any file in "/etc/modprobe.d" 
# or the deprecated"/etc/modprobe.conf". These lines instruct the module 
# loading system to run another program (such as "/bin/true") upon a module 
# "install" event. Run the following command to search for such lines in 
# all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf": 

# $ grep -r bluetooth /etc/modprobe.conf /etc/modprobe.d

# If the system is configured to prevent the loading of the "net-pf-31" 
# kernel module, it will contain lines inside any file in "/etc/modprobe.d" 
# or the deprecated"/etc/modprobe.conf". These lines instruct the module 
# loading system to run another program (such as "/bin/true") upon a module 
# "install" event. Run the following command to search for such lines in 
# all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf": 

# $ grep -r net-pf-31 /etc/modprobe.conf /etc/modprobe.d


# If no line is returned, this is a finding.
#
# Fix Text: 
#
# The kernel's module loading system can be configured to prevent loading 
# of the Bluetooth module. Add the following to the appropriate 
# "/etc/modprobe.d" configuration file to prevent the loading of the 
# Bluetooth module: 

# install net-pf-31 /bin/true
# install bluetooth /bin/true

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000315
#
#BEGIN_CHECK

. ./aqueduct_functions
HAS_NET_PF_31=`grep -r  net-pf-31 /etc/modprobe.conf /etc/modprobe.d  | grep ':install' |  wc -l`

#END_CHECK
#BEGIN_REMEDY

if [ "$HAS_NET_PF_31" -lt 1 ]
then
	echo "install net-pf-31 /bin/true" >> /etc/modprobe.d/bluetooth.conf
	echo "install bluetooth /bin/true" >> /etc/modprobe.d/bluetooth.conf
fi

#END_REMEDY

