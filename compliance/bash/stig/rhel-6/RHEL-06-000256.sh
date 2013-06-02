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
# Group ID (Vulid): RHEL-06-000256
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000256_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000256
# Rule Title: The openldap-servers package must not be installed unless 
# required.
#
# Vulnerability Discussion: Unnecessary packages should not be installed 
# to decrease the attack surface of the system.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To verify the "openldap-servers" package is not installed, run the 
# following command: 

# $ rpm -q openldap-servers

# The output should show the following. 

# package openldap-servers is not installed


# If it does not, this is a finding.
#
# Fix Text: 
#
# The "openldap-servers" package should be removed if not in use. Is this 
# machine the OpenLDAP server? If not, remove the package. 

# yum erase openldap-servers

# The openldap-servers RPM is not installed by default on RHEL6 machines. 
# It is needed only by the OpenLDAP server, not by the clients which use 
# LDAP for authentication. If the system is not intended for use as an LDAP 
# Server it should be removed.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000256
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

