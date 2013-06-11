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
# Group ID (Vulid): RHEL-06-000045
# Group Title: SRG-OS-000259
#
   
# Rule ID: RHEL-06-000045_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000045
# Rule Title: Library files must have mode 0755 or less permissive.
#
# Vulnerability Discussion: Files from shared library directories are 
# loaded into the address space of processes (including privileged ones) or 
# of the kernel itself at runtime. Restrictive permissions are necessary to 
# protect the integrity of the system.
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
# group-writable or world-writable. To find shared libraries that are 
# group-writable or world-writable, run the following command for each 
# directory [DIR] which contains shared libraries: 

# $ find -L [DIR] -perm /022


# If any of these files are group-writable or world-writable, this is a 
# finding.
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

# If any file in these directories is found to be group-writable or 
# world-writeable correct its permission with the following command: 

# chmod go-w [FILE]

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000045
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY

for LIBDIR in /usr/lib /usr/lib64 /lib /lib64
do
  if [ -d $LIBDIR ]
  then
    for BADLIBFILE in `find $LIBDIR -type f -perm /7022 \( -name *.so* -o -name *.a* \)`
    do
      chmod go-w $BADLIBFILE
    done
  fi
done


#END_REMEDY

