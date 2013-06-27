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
# Group ID (Vulid): RHEL-06-000048
# Group Title: SRG-OS-000259
#
   
# Rule ID: RHEL-06-000048_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000048
# Rule Title: All system command files must be owned by root.
#
# Vulnerability Discussion: System binaries are executed by privileged 
# users as well as system services, and restrictive permissions are 
# necessary to ensure that their execution of these programs cannot be 
# co-opted.
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
# world-writable. To find system executables that are not owned by "root", 
# run the following command for each directory [DIR] which contains system 
# executables: 

# $ find -L [DIR] \! -user root


# If any system executables are found to not be owned by root, this is a 
# finding.
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

# If any file [FILE] in these directories is found to be owned by a user 
# other than root, correct its ownership with the following command: 

# chown root [FILE]

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000048
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
for BINDIR in /bin /usr/bin /usr/local/bin /sbin  /usr/sbin /usr/local/sbin
do
    if [ -d $BINDIR ]
    then
        find -L $BINDIR -type f \! -user root -exec chown root {} \;
    fi
done

#END_REMEDY

