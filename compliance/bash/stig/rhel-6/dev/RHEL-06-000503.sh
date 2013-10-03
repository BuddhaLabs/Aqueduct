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
# Group ID (Vulid): RHEL-06-000503
# Group Title: SRG-OS-000273
#
   
# Rule ID: RHEL-06-000503_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000503
# Rule Title: The operating system must enforce requirements for the 
# connection of mobile devices to operating systems.
#
# Vulnerability Discussion: USB storage devices such as thumb drives can 
# be used to introduce unauthorized software and other vulnerabilities. 
# Support for these devices should be disabled and the devices themselves 
# should be tightly controlled.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# If the system is configured to prevent the loading of the "usb-storage" 
# kernel module, it will contain lines inside any file in "/etc/modprobe.d" 
# or the deprecated"/etc/modprobe.conf". These lines instruct the module 
# loading system to run another program (such as "/bin/true") upon a module 
# "install" event. Run the following command to search for such lines in 
# all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf": 

# $ grep -r usb-storage /etc/modprobe.conf /etc/modprobe.d


# If no line is returned, this is a finding.
#
# Fix Text: 
#
# To prevent USB storage devices from being used, configure the kernel 
# module loading system to prevent automatic loading of the USB storage 
# driver. To configure the system to prevent the "usb-storage" kernel 
# module from being loaded, add the following line to a file in the 
# directory "/etc/modprobe.d": 

# install usb-storage /bin/true

# This will prevent the "modprobe" program from loading the "usb-storage" 
# module, but will not prevent an administrator (or another program) from 
# using the "insmod" program to load the module manually.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000503
#
#BEGIN_CHECK

HAS_USB=`grep -r usb-storage /etc/modprobe.d | grep ':install' |  wc -l`

#END_CHECK
#BEGIN_REMEDY

if [ "$HAS_USB" -lt 1 ]
then
    echo "install usb-storage /bin/true" > /etc/modprobe.d/usb.conf
fi

#END_REMEDY

