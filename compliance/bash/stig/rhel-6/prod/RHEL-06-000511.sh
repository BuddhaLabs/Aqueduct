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
# Group ID (Vulid): RHEL-06-000511
# Group Title: SRG-OS-000047
#
   
# Rule ID: RHEL-06-000511_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000511
# Rule Title: The audit system must take appropriate action when there 
# are disk errors on the audit storage volume.
#
# Vulnerability Discussion: Taking appropriate action in case of disk 
# errors will minimize the possibility of losing audit records.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Inspect "/etc/audit/auditd.conf" and locate the following line to 
# determine if the system is configured to take appropriate action when 
# disk errors occur:

# grep disk_error_action /etc/audit/auditd.conf
# disk_error_action = [ACTION]


# If the system is configured to "suspend" when disk errors occur or 
# "ignore" them, this is a finding.
#
# Fix Text: 
#
# Edit the file "/etc/audit/auditd.conf". Modify the following line, 
# substituting [ACTION] appropriately: 

# disk_error_action = [ACTION]

# Possible values for [ACTION] are described in the "auditd.conf" man page. 
# These include: 

# "ignore"
# "syslog"
# "exec"
# "suspend"
# "single"
# "halt"


# Set this to "syslog", "exec", "single", or "halt".  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000511
AUDITLOGFILE='/etc/audit/auditd.conf'
#
#So the breakdown is this:
#Suspend with suspend the system (bad if this is an Amazon image or something)
#Single will put the system into single usermode (bad again if AMI)
#Halt will halt the system (bad again)
#exec will execute a command (Thats ok..just don't know what everyone would want it to be)
##If for some reason in the future syslog wasn't allowed, we could do exec + the logger 
##command and get the same result *giggles*.  We could also push to WALL and notify everyone thats
##actually on the System.
#
#So were going to assume that people followed the STIG guidance and configured a syslog
#server (and actually watch the logs) HA!
#
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#Default is IGNORE
sed -i 's/disk_full_action = IGNORE/disk_full_action = SYSLOG/g' $AUDITLOGFILE
sed -i 's/disk_error_action = IGNORE/disk_error_action = SYSLOG/g' $AUDITLOGFILE
#Remove if set to SUSPEND since that's not allowed either. 
sed -i 's/disk_full_action = SUSPEND/disk_full_action = SYSLOG/g' $AUDITLOGFILE
sed -i 's/disk_error_action = SUSPEND/disk_error_action = SYSLOG/g' $AUDITLOGFILE
#END_REMEDY

