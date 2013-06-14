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
# Group ID (Vulid): RHEL-06-000011
# Group Title: SRG-OS-000191
#
   
# Rule ID: RHEL-06-000011_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000011
# Rule Title: System security patches and updates must be installed and 
# up-to-date.
#
# Vulnerability Discussion: Installing software updates is a fundamental 
# mitigation against the exploitation of publicly-known vulnerabilities.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# If the system is joined to the Red Hat Network, a Red Hat Satellite 
# Server, or a yum server which provides updates, invoking the following 
# command will indicate if updates are available: 

# yum check-update

# If the system is not configured to update from one of these sources, run 
# the following command to list when each package was last updated: 

# $ rpm -qa -last

# Compare this to Red Hat Security Advisories (RHSA) listed at 
# https://access.redhat.com/security/updates/active/ to determine whether 
# the system is missing applicable security and bugfix  updates. 
# If updates are not installed, this is a finding.
#
# Fix Text: 
#
# If the system is joined to the Red Hat Network, a Red Hat Satellite 
# Server, or a yum server, run the following command to install updates: 

# yum update

# If the system is not configured to use one of these sources, updates (in 
# the form of RPM packages) can be manually downloaded from the Red Hat 
# Network and installed using "rpm".  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000011
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
yum -y update
#END_REMEDY

