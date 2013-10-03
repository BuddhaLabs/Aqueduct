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
# Group ID (Vulid): RHEL-06-000517
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000517_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000517
# Rule Title: The system package management tool must verify 
# group-ownership on all files and directories associated with packages.
#
# Vulnerability Discussion: Group-ownership of system binaries and 
# configuration files that is incorrect could allow an unauthorized user to 
# gain privileges that they should not have. The group-ownership set by the 
# vendor should be maintained. Any deviations from this baseline should be 
# investigated.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# The following command will list which files on the system have 
# group-ownership different from what is expected by the RPM database: 

# rpm -Va | grep '^......G'


# If there is output, this is a finding.
#
# Fix Text: 
#
# The RPM package management system can restore group-ownership of the 
# package files and directories. The following command will update files 
# and directories with group-ownership different from what is expected by 
# the RPM database: 

# rpm -qf [file or directory name]
# rpm --setugids [package]

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000517
BADRPMFILES=$(rpm -Va | grep '^......G' | awk '{print $2}')
BADNUMBER=$(echo $BADRPMFILES | wc -l)
#END_CHECK
if [ $BADNUMBER -ne 0 ]
	then
		for line in $BADRPMFILES
			do 
				rpm --setugids `rpm -qf $line`
		done
fi
