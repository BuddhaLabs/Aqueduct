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
# Group ID (Vulid): RHEL-06-000346
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000346_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000346
# Rule Title: The system default umask for daemons must be 027 or 022.
#
# Vulnerability Discussion: The umask influences the permissions assigned 
# to files created by a process at run time. An unnecessarily permissive 
# umask could result in files being created with insecure permissions.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check the value of the "umask", run the following command: 

# $ grep umask /etc/init.d/functions

# The output should show either "022" or "027". 
# If it does not, this is a finding.
#
# Fix Text: 
#
# The file "/etc/init.d/functions" includes initialization parameters for 
# most or all daemons started at boot time. The default umask of 022 
# prevents creation of group- or world-writable files. To set the default 
# umask for daemons, edit the following line, inserting 022 or 027 for 
# [UMASK] appropriately: 

# umask [UMASK]

# Setting the umask to too restrictive a setting can cause serious errors 
# at runtime. Many daemons on the system already individually restrict 
# themselves to a umask of 077 in their own init scripts.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000346
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

