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
# Group ID (Vulid): RHEL-06-000248
# Group Title: SRG-OS-000056
#
   
# Rule ID: RHEL-06-000248_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000248
# Rule Title: The system clock must be synchronized to an authoritative 
# DoD time source.
#
# Vulnerability Discussion: Synchronizing with an NTP server makes it 
# possible to collate system logs from multiple sources or correlate 
# computer events with real time events. Using a trusted NTP server 
# provided by your organization is recommended.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# A remote NTP server should be configured for time synchronization. To 
# verify one is configured, open the following file. 

# /etc/ntp.conf

# In the file, there should be a section similar to the following: 

# --- OUR TIMESERVERS -----
# server [ntpserver]


# If this is not the case, this is a finding.
#
# Fix Text: 
#
# To specify a remote NTP server for time synchronization, edit the file 
# "/etc/ntp.conf". Add or correct the following lines, substituting the IP 
# or hostname of a remote NTP server for ntpserver. 

# server [ntpserver]

# This instructs the NTP software to contact that remote server to obtain 
# time data.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000248
#
#BEGIN_CHECK

. ./aqueduct_functions
line_count server /etc/ntp.conf 

#END_CHECK
#BEGIN_REMEDY

if [ $? -eq 0 ]
then
	echo "Please put a valid remote timeserver in /etc/ntp.conf"
fi


#END_REMEDY

