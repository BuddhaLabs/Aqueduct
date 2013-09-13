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
# Group ID (Vulid): RHEL-06-000046
# Group Title: SRG-OS-000259
#
   
# Rule ID: RHEL-06-000046_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000046
# Rule Title: Library files must be owned by root.
#
# Vulnerability Discussion: Files from shared library directories are 
# loaded into the address space of processes (including privileged ones) or 
# of the kernel itself at runtime. Proper ownership is necessary to protect 
# the integrity of the system.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# System-wide shared library files, which are linked to executables 
# during process load time or run time, are stored in the following 
# directories by default: 

# /lib
# /lib64
# /usr/lib
# /usr/lib64


# Kernel modules, which can be added to the kernel during runtime, are 
# stored in "/lib/modules". All files in these directories should not be 
# group-writable or world-writable.  To find shared libraries that are not 
# owned by "root", run the following command for each directory [DIR] which 
# contains shared libraries: 

# $ find -L [DIR] \! -user root


# If any of these files are not owned by root, this is a finding.
#
# Fix Text: 
#
# System-wide shared library files, which are linked to executables 
# during process load time or run time, are stored in the following 
# directories by default: 

# /lib
# /lib64
# /usr/lib
# /usr/lib64

# If any file in these directories is found to be owned by a user other 
# than root, correct its ownership with the following command: 

# chown root [FILE]

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000046
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
for LIBDIR in /usr/lib /usr/lib64 /lib /lib64
do
  if [ -d $LIBDIR ]
  then
    find -L $LIBDIR -type f \! -user root -exec chown root {} \; 
  fi
done

#END_REMEDY

