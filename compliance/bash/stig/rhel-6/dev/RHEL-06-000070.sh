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
# Group ID (Vulid): RHEL-06-000070
# Group Title: SRG-OS-000080
#
   
# Rule ID: RHEL-06-000070_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000070
# Rule Title: The system must not permit interactive boot.
#
# Vulnerability Discussion: Using interactive boot, the console user 
# could disable auditing, firewalls, or other services, weakening system 
# security.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check whether interactive boot is disabled, run the following 
# command: 

# $ grep PROMPT /etc/sysconfig/init

# If interactive boot is disabled, the output will show: 

# PROMPT=no


# If it does not, this is a finding.
#
# Fix Text: 
#
# To disable the ability for users to perform interactive startups, edit 
# the file "/etc/sysconfig/init". Add or correct the line: 

# PROMPT=no

# The "PROMPT" option allows the console user to perform an interactive 
# system startup, in which it is possible to select the set of services 
# which are started on boot.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000070
#
#BEGIN_CHECK

grep "^PROMPT=no" /etc/sysconfig/init > /dev/null

#END_CHECK
#BEGIN_REMEDY

if [ $? != 0 ]
then
    sed -i 's/^PROMPT/#PROMPT/' /etc/sysconfig/init
    echo "PROMPT=no" >> /etc/sysconfig/init 
fi

#END_REMEDY

