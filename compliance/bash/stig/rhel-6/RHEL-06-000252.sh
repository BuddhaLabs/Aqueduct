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
# Group ID (Vulid): RHEL-06-000252
# Group Title: SRG-OS-000250
#
   
# Rule ID: RHEL-06-000252_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000252
# Rule Title: If the system is using LDAP for authentication or account 
# information, the system must use a TLS connection using FIPS 140-2 
# approved cryptographic algorithms.
#
# Vulnerability Discussion: The ssl directive specifies whether to use 
# ssl or not. If not specified it will default to "no". It should be set to 
# "start_tls" rather than doing LDAP over SSL.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# If the system does not use LDAP for authentication or account 
# information, this is not applicable.

# To ensure LDAP is configured to use TLS for all transactions, run the 
# following command: 

# $ grep start_tls /etc/pam_ldap.conf


# If no lines are returned, this is a finding.
#
# Fix Text: 
#
# Configure LDAP to enforce TLS use. First, edit the file 
# "/etc/pam_ldap.conf", and add or correct the following lines: 

# ssl start_tls

# Then review the LDAP server and ensure TLS has been configured.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000252
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

