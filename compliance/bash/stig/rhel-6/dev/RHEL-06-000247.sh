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
# Group ID (Vulid): RHEL-06-000247
# Group Title: SRG-OS-000056
#
   
# Rule ID: RHEL-06-000247_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000247
# Rule Title: The system clock must be synchronized continuously, or at 
# least daily.
#
# Vulnerability Discussion: Enabling the "ntpd" service ensures that the 
# "ntpd" service will be running and that the system will synchronize its 
# time to any servers specified. This is important whether the system is 
# configured to be a client (and synchronize only its own clock) or it is 
# also acting as an NTP server to other systems. Synchronizing time is 
# essential for authentication services such as Kerberos, but it is also 
# important for maintaining accurate logs and auditing possible security 
# breaches.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Run the following command to determine the current status of the "ntpd" 
# service: 

# service ntpd status

# If the service is enabled, it should return the following: 

# ntpd is running...


# If the service is not running, this is a finding.
#
# Fix Text: 
#
# The "ntpd" service can be enabled with the following command: 

# chkconfig ntpd on
# service ntpd start
  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000247
#
#BEGIN_CHECK

. ./aqueduct_functions

#END_CHECK
#BEGIN_REMEDY


is_chkconfig_on ntpd

if [ $? -ne 0 ]
then
	set_chkconfig_on ntpd
fi

is_status_running ntpd
if [ $? -ne 0 ]
then
	set_status_running ntpd
fi


#END_REMEDY

