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
# Group ID (Vulid): RHEL-06-000282
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000282_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000282
# Rule Title: There must be no world-writable files on the system.
#
# Vulnerability Discussion: Data in world-writable files can be modified 
# by any user on the system. In almost all circumstances, files can be 
# configured using a combination of user and group permissions to support 
# whatever legitimate access is needed without the risk caused by 
# world-writable files.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To find world-writable files, run the following command: 

# find / -xdev -type f -perm -002


# If there is output, this is a finding.
#
# Fix Text: 
#
# It is generally a good idea to remove global (other) write access to a 
# file when it is discovered. However, check with documentation for 
# specific applications before making changes. Also, monitor for recurring 
# world-writable files, as these may be symptoms of a misconfigured 
# application or user account.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000282
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

