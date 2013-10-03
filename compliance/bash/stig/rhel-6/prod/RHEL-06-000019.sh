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
# Group ID (Vulid): RHEL-06-000019
# Group Title: SRG-OS-000248
#
   
# Rule ID: RHEL-06-000019_rule
# Severity: high
# Rule Version (STIG-ID): RHEL-06-000019
# Rule Title: There must be no .rhosts or hosts.equiv files on the system.
#
# Vulnerability Discussion: Trust files are convenient, but when used in 
# conjunction with the R-services, they can allow unauthenticated access to 
# a system.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# The existence of the file "/etc/hosts.equiv" or a file named ".rhosts" 
# inside a user home directory indicates the presence of an Rsh trust 
# relationship. 
# If these files exist, this is a finding.
#
# Fix Text: 
#
# The files "/etc/hosts.equiv" and "~/.rhosts" (in each user's home 
# directory) list remote hosts and users that are trusted by the local 
# system when using the rshd daemon. To remove these files, run the 
# following command to delete them from any location. 

# rm /etc/hosts.equiv



# $ rm ~/.rhosts

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000019
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
if [ -f  /etc/hosts.equiv ]
then
    rm /etc/hosts.equiv
fi

for i in `cat /etc/passwd | awk -F":" '{ print $6 }' `
do
    if [ -f ${i}/.rhosts ]
    then
        rm ${i}/.rhosts
    fi
done
#END_REMEDY

