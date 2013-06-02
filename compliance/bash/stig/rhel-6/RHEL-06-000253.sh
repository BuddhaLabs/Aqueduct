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
# Group ID (Vulid): RHEL-06-000253
# Group Title: SRG-OS-000113
#
   
# Rule ID: RHEL-06-000253_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000253
# Rule Title: The LDAP client must use a TLS connection using trust 
# certificates signed by the site CA.
#
# Vulnerability Discussion: The tls_cacertdir or tls_cacertfile 
# directives are required when tls_checkpeer is configured (which is the 
# default for openldap versions 2.1 and up). These directives define the 
# path to the trust certificates signed by the site CA.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# If the system does not use LDAP for authentication or account 
# information, this is not applicable.

# To ensure TLS is configured with trust certificates, run the following 
# command: 

# grep cert /etc/pam_ldap.conf


# If there is no output, or the lines are commented out, this is a finding.
#
# Fix Text: 
#
# Ensure a copy of the site's CA certificate has been placed in the file 
# "/etc/pki/tls/CA/cacert.pem". Configure LDAP to enforce TLS use and to 
# trust certificates signed by the site's CA. First, edit the file 
# "/etc/pam_ldap.conf", and add or correct either of the following lines: 

# tls_cacertdir /etc/pki/tls/CA

# or 

# tls_cacertfile /etc/pki/tls/CA/cacert.pem

# Then review the LDAP server and ensure TLS has been configured.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000253
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

