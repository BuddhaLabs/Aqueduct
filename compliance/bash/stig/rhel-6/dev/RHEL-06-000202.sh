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
# Group ID (Vulid): RHEL-06-000202
# Group Title: SRG-OS-000064
#
   
# Rule ID: RHEL-06-000202_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000202
# Rule Title: The audit system must be configured to audit the loading 
# and unloading of dynamic kernel modules.
#
# Vulnerability Discussion: The addition/removal of kernel modules can be 
# used to alter the behavior of the kernel and potentially introduce 
# malicious code into kernel space. It is important to have an audit trail 
# of modules that have been introduced into the kernel.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To determine if the system is configured to audit calls to the 
# "init_module" system call, run the following command: 

# auditctl -l | grep syscall | grep init_module

# If the system is configured to audit this activity, it will return a 
# line. To determine if the system is configured to audit calls to the 
# "delete_module" system call, run the following command: 

# auditctl -l | grep syscall | grep delete_module

# If the system is configured to audit this activity, it will return a 
# line. 
# If no line is returned, this is a finding.
#
# Fix Text: 
#
# Add the following to "/etc/audit/audit.rules" in order to capture 
# kernel module loading and unloading events, setting ARCH to either b32 or 
# b64 as appropriate for your system: 

# -w /sbin/insmod -p x -k modules
# -w /sbin/rmmod -p x -k modules
# -w /sbin/modprobe -p x -k modules
# -a always,exit -F arch=[ARCH] -S init_module -S delete_module -k modules

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000202
#
#BEGIN_CHECK

HAS_INIT_MODULE=`grep init_module /etc/audit/audit.rules | wc -l`

#END_CHECK
#BEGIN_REMEDY

if [ $HAS_INIT_MODULE -lt 1 ]
then
	FILE='/etc/audit/audit.rules'
	DATE=`date +%Y-%j`
	cp $FILE ${FILE}.${DATE}.${PDI}
    OWNER=`stat -c "%U" $FILE`
    GROUP=`stat -c "%G" $FILE`
    PERMS=`stat -c "%a" $FILE`
	echo "-w /sbin/insmod -p x -k modules" >> $FILE
	echo "-w /sbin/rmmod -p x -k modules" >> $FILE
	echo "-w /sbin/modprobe -p x -k modules" >> $FILE
	echo "-a always,exit -F arch=b32 -S init_module -S delete_module -k modules"  >> $FILE
	echo "-a always,exit -F arch=b64 -S init_module -S delete_module -k modules"  >> $FILE
	chown ${OWNER}:${GROUP} $FILE
	chmod $PERMS $FILE
fi


#END_REMEDY

