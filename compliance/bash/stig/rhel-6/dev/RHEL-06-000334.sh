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
# Group ID (Vulid): RHEL-06-000334
# Group Title: SRG-OS-000003
#
   
# Rule ID: RHEL-06-000334_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000334
# Rule Title: Accounts must be locked upon 35 days of inactivity.
#
# Vulnerability Discussion: Disabling inactive accounts ensures that 
# accounts which may not have been responsibly removed are not available to 
# attackers who may have compromised their credentials.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To verify the "INACTIVE" setting, run the following command: 

# grep "INACTIVE" /etc/default/useradd

# The output should indicate the "INACTIVE" configuration option is set to 
# an appropriate integer as shown in the example below: 

# grep "INACTIVE" /etc/default/useradd
# INACTIVE=35

# If it does not, this is a finding.

#
# Fix Text: 
#
# To specify the number of days after a password expires (which signifies 
# inactivity) until an account is permanently disabled, add or correct the 
# following lines in "/etc/default/useradd", substituting "[NUM_DAYS]" 
# appropriately: 

# INACTIVE=[NUM_DAYS]

# A value of 35 is recommended. If a password is currently on the verge of 
# expiration, then 35 days remain until the account is automatically 
# disabled. However, if the password will not expire for another 60 days, 
# then 95 days could elapse until the account would be automatically 
# disabled. See the "useradd" man page for more information. Determining 
# the inactivity timeout must be done with careful consideration of the 
# length of a "normal" period of inactivity for users in the particular 
# environment. Setting the timeout too low incurs support costs and also 
# has the potential to impact availability of the system to legitimate 
# users.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000334
#
#BEGIN_CHECK

. ./aqueduct_functions
HAS_INACTIVE=`line_count INACTIVE /etc/default/useradd`

#END_CHECK
#BEGIN_REMEDY


NUM_DAYS=35

if [ $HAS_INACTIVE -gt 0 ]
then
	INACTIVE_VALUE=`grep ^INACTIVE /etc/default/useradd | awk -F"=" '{ print $NF}'`
	INACTIVE_VALUE=`expr 0 + $INACTIVE_VALUE`
	if [ $INACTIVE_VALUE -lt $NUM_DAYS ]
	then
	edit_file /etc/default/useradd $PDI 'INACTIVE=35' 'INACTIVE'
	fi
else
	DATE=`date +%Y-%j`
	backup_file /etc/default/useradd $PDI
	copy_perms /etc/default/useradd /etc/default/useradd.${DATE}.${PDI}
	echo "INACTIVE=$NUM_DAYS" >> /etc/default/useradd
	copy_perms  /etc/default/useradd.${DATE}.${PDI}  /etc/default/useradd
fi

#END_REMEDY

