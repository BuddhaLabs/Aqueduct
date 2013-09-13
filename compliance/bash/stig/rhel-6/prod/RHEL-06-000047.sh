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
# Group ID (Vulid): RHEL-06-000047
# Group Title: SRG-OS-000259
#
   
# Rule ID: RHEL-06-000047_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000047
# Rule Title: All system command files must have mode 0755 or less 
# permissive.
#
# Vulnerability Discussion: System binaries are executed by privileged 
# users, as well as system services, and restrictive permissions are 
# necessary to ensure execution of these programs cannot be co-opted.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# System executables are stored in the following directories by default: 

# /bin
# /usr/bin
# /usr/local/bin
# /sbin
# /usr/sbin
# /usr/local/sbin

# All files in these directories should not be group-writable or 
# world-writable. To find system executables that are group-writable or 
# world-writable, run the following command for each directory [DIR] which 
# contains system executables: 

# $ find -L [DIR] -perm /022


# If any system executables are found to be group-writable or 
# world-writable, this is a finding.
#
# Fix Text: 
#
# System executables are stored in the following directories by default: 

# /bin
# /usr/bin
# /usr/local/bin
# /sbin
# /usr/sbin
# /usr/local/sbin

# If any file in these directories is found to be group-writable or 
# world-writable, correct its permission with the following command: 

# chmod go-w [FILE]

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000047
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY

for BINDIR in /bin /usr/bin /usr/local/bin /sbin  /usr/sbin /usr/local/sbin
do
    if [ -d $BINDIR ]
    then
        find -L $BINDIR -type f -perm /022 -exec chmod go-w {} \;
    fi
done

#END_REMEDY

