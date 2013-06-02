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
# Group ID (Vulid): RHEL-06-000272
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000272_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000272
# Rule Title: The system must use SMB client signing for connecting to 
# samba servers using smbclient.
#
# Vulnerability Discussion: Packet signing can prevent man-in-the-middle 
# attacks which modify SMB packets in transit.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To verify that Samba clients running smbclient must use packet signing, 
# run the following command: 

# grep signing /etc/samba/smb.conf

# The output should show: 

# client signing = mandatory


# If it is not, this is a finding.
#
# Fix Text: 
#
# To require samba clients running "smbclient" to use packet signing, add 
# the following to the "[global]" section of the Samba configuration file 
# in "/etc/samba/smb.conf": 

# client signing = mandatory

# Requiring samba clients such as "smbclient" to use packet signing ensures 
# they can only communicate with servers that support packet signing.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000272
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

