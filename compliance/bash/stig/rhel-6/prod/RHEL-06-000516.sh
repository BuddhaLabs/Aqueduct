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
# Group ID (Vulid): RHEL-06-000516
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000516_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000516
# Rule Title: The system package management tool must verify ownership on 
# all files and directories associated with packages.
#
# Vulnerability Discussion: Ownership of system binaries and 
# configuration files that is incorrect could allow an unauthorized user to 
# gain privileges that they should not have. The ownership set by the 
# vendor should be maintained. Any deviations from this baseline should be 
# investigated.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# The following command will list which files on the system have 
# ownership different from what is expected by the RPM database: 

# rpm -Va | grep '^.....U'


# If there is output, this is a finding.
#
# Fix Text: 
#
# The RPM package management system can restore ownership of package 
# files and directories. The following command will update files and 
# directories with ownership different from what is expected by the RPM 
# database: 

# rpm -qf [file or directory name]
# rpm --setugids [package]

  
#######################DISA INFORMATION##################################
#	
#

# Global Variables
PDI=RHEL-06-000516

#BEGIN_CHECK

BADRPMFILES=$(rpm -Va | grep '^.....U' | awk '{print $NF}')
BADNUMBER=$(echo $BADRPMFILES | wc -l)

#END_CHECK

#BEGIN_REMEDY

if [ $BADNUMBER -ne 0 ]
then
	for line in $BADRPMFILES
	do 
		rpm --setugids `rpm -qf $line`
	done
fi

#END_REMEDY

