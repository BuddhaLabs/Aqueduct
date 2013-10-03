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
# Group ID (Vulid): RHEL-06-000311
# Group Title: SRG-OS-000048
#
   
# Rule ID: RHEL-06-000311_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000311
# Rule Title: The audit system must provide a warning when allocated 
# audit record storage volume reaches a documented percentage of maximum 
# audit record storage capacity.
#
# Vulnerability Discussion: Notifying administrators of an impending disk 
# space problem may allow them to take corrective action prior to any 
# disruption.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Inspect "/etc/audit/auditd.conf" and locate the following line to 
# determine whether the system is configured to email the administrator 
# when disk space is starting to run low: 

# grep space_left /etc/audit/auditd.conf 

# space_left = [num_megabytes]


# If the "num_megabytes" value does not correspond to a documented value 
# for remaining audit partition capacity or if there is no locally 
# documented value for remaining audit partition capacity, this is a 
# finding.
#
# Fix Text: 
#
# The "auditd" service can be configured to take an action when disk 
# space starts to run low. Edit the file "/etc/audit/auditd.conf". Modify 
# the following line, substituting [ACTION] appropriately: 

# space_left = [num_megabytes]

# The "num_megabytes" value should be set to a fraction of the total audit 
# storage capacity available that will allow a system administrator to be 
# notified with enough time to respond to the situation causing the 
# capacity issues.  This value must also be documented locally.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000311
#
#BEGIN_CHECK

. ./aqueduct_functions


SPACE_LEFT=0
line_count 'space_left' /etc/audit/auditd.conf

if [ $? -ge 1 ]
then
	# This intentionally has a space in the search string to not get space_left_action
	SPACE_LEFT=`grep '^space_left ' /etc/audit/auditd.conf  | awk '{ print $NF}'`
fi


#END_CHECK
#BEGIN_REMEDY

DATE=`date +%Y-%j`

if [ $SPACE_LEFT  -eq 0 ]
then
	backup_file /etc/audit/auditd.conf $PDI
	copy_perms /etc/audit/auditd.conf /etc/audit/auditd.conf.${DATE}.$PDI

	echo "# Modified per PDI $PDI" >> /etc/audit/auditd.conf 
	echo "space_left = 100" >> /etc/audit/auditd.conf

	copy_perms /etc/audit/auditd.conf.${DATE}.$PDI /etc/audit/auditd.conf
fi
	
#END_REMEDY

