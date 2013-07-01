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
# Group ID (Vulid): RHEL-06-000069
# Group Title: SRG-OS-000080
#
   
# Rule ID: RHEL-06-000069_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000069
# Rule Title: The system must require authentication upon booting into 
# single-user and maintenance modes.
#
# Vulnerability Discussion: This prevents attackers with physical access 
# from trivially bypassing security on the machine and gaining root access. 
# Such accesses are further prevented by configuring the bootloader 
# password.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check if authentication is required for single-user mode, run the 
# following command: 

# $ grep SINGLE /etc/sysconfig/init

# The output should be the following: 

# SINGLE=/sbin/sulogin


# If the output is different, this is a finding.
#
# Fix Text: 
#
# Single-user mode is intended as a system recovery method, providing a 
# single user root access to the system by providing a boot option at 
# startup. By default, no authentication is performed if single-user mode 
# is selected. 

# To require entry of the root password even if the system is started in 
# single-user mode, add or correct the following line in the file 
# "/etc/sysconfig/init": 

# SINGLE=/sbin/sulogin

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000069
#
#BEGIN_CHECK

grep "^SINGLE=/sbin/sulogin" /etc/sysconfig/init > /dev/null

#END_CHECK
#BEGIN_REMEDY

if [ $? != 0 ]
then
    sed -i 's/SINGLE/#SINGLE/' /etc/sysconfig/init
    echo "SINGLE=/sbin/sulogin" >> /etc/sysconfig/init
fi
#END_REMEDY

