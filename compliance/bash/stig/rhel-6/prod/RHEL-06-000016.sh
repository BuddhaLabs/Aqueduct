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
# Group ID (Vulid): RHEL-06-000016
# Group Title: SRG-OS-000232
#
   
# Rule ID: RHEL-06-000016_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000016
# Rule Title: A file integrity tool must be installed.
#
# Vulnerability Discussion: The AIDE package must be installed if it is 
# to be available for integrity checking.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# If another file integrity tool is installed, this is not a finding.

# Run the following command to determine if the "aide" package is 
# installed: 

# rpm -q aide


# If the package is not installed, this is a finding.
#
# Fix Text: 
#
# Install the AIDE package with the command: 

# yum install aide

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000016
#
#BEGIN_CHECK
#Think this is on by default...but not 100% since the check isn't very specific 
rpm -q aide > /dev/null
if [ $? -ne 0 ]
#END_CHECK
#BEGIN_REMEDY
then
  yum install aide -y
fi
# Start out by getting all file check definitions(line starting with a /)
# to get a list of used check groups.
#if [ -e /etc/aide.conf ]
#then
#  for GROUP in `awk '/^\//{print $2}' /etc/aide.conf | sort | uniq`
#  do
#    CONFLINE=`awk "/^${GROUP}/{print \\$3}" /etc/aide.conf`
#    if [[ "$CONFLINE" != *sha512* ]]
#    then
#      NEWCONFLINE="${CONFLINE}+sha512"
#      sed -i -e "s/^${GROUP}.*/${GROUP} = $NEWCONFLINE/g" /etc/aide.conf
#    fi
#    
    # Remove all other checksum types to make sure sha512 is used
    # Turns out that FIPS modes keeps aide from initializing if you
    # disable the other checksums. Lets keep this in just in case this
    # gets fixed in the future.
#    sed -i -e "s/^\(${GROUP}.*\)md5\(.*\)/\1\2/g" /etc/aide.conf | grep DATA
#    sed -i -e "s/^\(${GROUP}.*\)sha1\(.*\)/\1\2/g" /etc/aide.conf | grep DATA
#    sed -i -e "s/^\(${GROUP}.*\)sha256\(.*\)/\1\2/g" /etc/aide.conf | grep DATA
#    sed -i -e "s/^\(${GROUP}.*\)rmd160\(.*\)/\1\2/g" /etc/aide.conf | grep DATA
#    sed -i -e "s/^\(${GROUP}.*\)tiger\(.*\)/\1\2/g" /etc/aide.conf | grep DATA
#    sed -i -e "s/^\(${GROUP}.*\)haval\(.*\)/\1\2/g" /etc/aide.conf | grep DATA
#    sed -i -e "s/^\(${GROUP}.*\)gost\(.*\)/\1\2/g" /etc/aide.conf | grep DATA
#    sed -i -e "s/^\(${GROUP}.*\)crc32\(.*\)/\1\2/g" /etc/aide.conf | grep DATA
#    sed -i -e "s/^\(${GROUP}.*\)whirlpool\(.*\)/\1\2/g" /etc/aide.conf | grep DATA
    # Replace two or mor +s with a single + to fix the damage from removing
    # the checksum types
#    sed -i -e 's/\+\++/+/g' /etc/aide.conf
#  done
#fi
#END_REMEDY

