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
# Group ID (Vulid): RHEL-06-000135
# Group Title: SRG-OS-000206
#
   
# Rule ID: RHEL-06-000135_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000135
# Rule Title: All rsyslog-generated log files must have mode 0600 or less 
# permissive.
#
# Vulnerability Discussion: Log files can contain valuable information 
# regarding system configuration. If the system log files are not 
# protected, unauthorized users could change the logged data, eliminating 
# their forensic value.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# The file permissions for all log files written by rsyslog should be set 
# to 600, or more restrictive. These log files are determined by the second 
# part of each Rule line in "/etc/rsyslog.conf" and typically all appear in 
# "/var/log". For each log file [LOGFILE] referenced in 
# "/etc/rsyslog.conf", run the following command to inspect the file's 
# permissions: 

# $ ls -l [LOGFILE]

# The permissions should be 600, or more restrictive. 
# If the permissions are not correct, this is a finding.
#
# Fix Text: 
#
# The file permissions for all log files written by rsyslog should be set 
# to 600, or more restrictive. These log files are determined by the second 
# part of each Rule line in "/etc/rsyslog.conf" and typically all appear in 
# "/var/log". For each log file [LOGFILE] referenced in 
# "/etc/rsyslog.conf", run the following command to inspect the file's 
# permissions:

# $ ls -l [LOGFILE]

# If the permissions are not 600 or more restrictive, run the following 
# command to correct this:

# chmod 0600 [LOGFILE]  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000135
#
#BEGIN_CHECK

LOGFILES=`grep '/' /etc/rsyslog.conf | grep -v ^# | awk '{ print $NF}' | sed 's/-//g'`

#END_CHECK
#BEGIN_REMEDY

for FILE in $LOGFILES
do
    if [ -f $FILE ]
    then
        PERMS=`stat -c %a $FILE`
        if [ "$PERMS" != "600" ]
        then
            chmod 0600 $FILE
        fi
	fi
done

#END_REMEDY

