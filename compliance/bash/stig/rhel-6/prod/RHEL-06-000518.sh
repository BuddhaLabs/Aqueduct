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
# Group ID (Vulid): RHEL-06-000518
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000518_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000518
# Rule Title: The system package management tool must verify permissions 
# on all files and directories associated with packages.
#
# Vulnerability Discussion: Permissions on system binaries and 
# configuration files that are too generous could allow an unauthorized 
# user to gain privileges that they should not have. The permissions set by 
# the vendor should be maintained. Any deviations from this baseline should 
# be investigated.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# The following command will list which files and directories on the 
# system have permissions different from what is expected by the RPM 
# database: 

# rpm -Va  | grep '^.M'

# If there is any output, for each file or directory found, find the 
# associated RPM package and compare the RPM-expected permissions with the 
# actual permissions on the file or directory:

# rpm -qf [file or directory name]
# rpm -q --queryformat "[%{FILENAMES} %{FILEMODES:perms}\n]" [package] | 
# grep  [filename]
# ls -lL [filename]

# If the existing permissions are more permissive than those expected by 
# RPM, this is a finding.
#
# Fix Text: 
#
# The RPM package management system can restore file access permissions 
# of package files and directories. The following command will update 
# permissions on files and directories with permissions different from what 
# is expected by the RPM database: 

# rpm --setperms [package]

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000518
#
#This looks like one that is going to be a pain since its also checking log files.  Which
#is kind of a good thing since the fix will constantly keep some of the log files in spec
#However, my suspicion is that the STIG requirements for changing permissions for log file
#directories will conflict, and start throwing false positives.  
#
#Need to follow-up on this! (VCP June 8 2013)
#
#   Note that this generates over 13,000 lines of error code the first
#   time it is run. The filesystem rpm claims to have directories for
#   lots of man pages but does not actually create them.
#
#
#BEGIN_CHECK
BADRPMFILES=$(rpm -Va  | grep '^.M' | awk '{print $NF}')
BADNUMBER=$(echo $BADRPMFILES | wc -l)

#END_CHECK
#BEGIN_REMEDY

if [ $BADNUMBER -ne 0 ]
then
	for line in $BADRPMFILES
	do 
		rpm --setperms `rpm -qf $line`
	done
fi

#END_REMEDY

