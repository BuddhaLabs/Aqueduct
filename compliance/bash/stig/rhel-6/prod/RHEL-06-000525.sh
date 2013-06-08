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
# Group ID (Vulid): RHEL-06-000525
# Group Title: SRG-OS-000062
#
   
# Rule ID: RHEL-06-000525_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000525
# Rule Title: Auditing must be enabled at boot by setting a kernel 
# parameter.
#
# Vulnerability Discussion: Each process on the system carries an 
# "auditable" flag which indicates whether its activities can be audited. 
# Although "auditd" takes care of enabling this for all processes which 
# launch after it does, adding the kernel argument ensures it is set for 
# every process during boot.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Inspect the kernel boot arguments (which follow the word "kernel") in 
# "/etc/grub.conf". If they include "audit=1", then auditing is enabled at 
# boot time. 
# If auditing is not enabled at boot time, this is a finding.
#
# Fix Text: 
#
# To ensure all processes can be audited, even those which start prior to 
# the audit daemon, add the argument "audit=1" to the kernel line in 
# "/etc/grub.conf", in the manner below: 

# kernel /vmlinuz-version ro vga=ext root=/dev/VolGroup00/LogVol00 rhgb 
# quiet audit=1

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000525
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
sed -i '/^[^#].*kernel/ {/audit/! s/.*/& audit=1/}' /boot/grub/grub.conf
#END_REMEDY

