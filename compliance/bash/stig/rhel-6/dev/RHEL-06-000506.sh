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
# Group ID (Vulid): RHEL-06-000506
# Group Title: SRG-OS-000025
#
   
# Rule ID: RHEL-06-000506_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000506
# Rule Title: The operating system, upon successful logon, must display 
# to the user the date and time of the last logon or access via a local 
# console or tty.
#
# Vulnerability Discussion: Users need to be aware of activity that 
# occurs regarding their accounts. Providing users with information 
# regarding the date and time of their last successful login allows the 
# user to determine if any unauthorized activity has occurred and gives 
# them an opportunity to notify administrators.

# At console or tty logon, a user must be presented with the last 
# successful login date and time.  The "hushlogin" file determines whether 
# this occurs.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Verify there are no "hushlogin" files active on the system:

# ls -l /etc/hushlogins

# For each home directory stored in "/etc/passwd":

# ls ~<userid>/.hushlogin

# If there are any "hushlogin" files on the system, this is a finding.

#
# Fix Text: 
#
# Remove any "hushlogin" files from the system:

# rm /etc/hushlogins
# rm ~<userid>/.hushlogin  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000506
#
#BEGIN_CHECK

. ./aqueduct_functions
updatedb

#END_CHECK
#BEGIN_REMEDY

if [ -f /etc/hushlogin ]
then
	rm /etc/hushlogin
fi

for i in `locate .hushlogin`
do
	rm $i
done

updatedb

#END_REMEDY

