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
# Group ID (Vulid): RHEL-06-000273
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000273_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000273
# Rule Title: The system must use SMB client signing for connecting to 
# samba servers using mount.cifs.
#
# Vulnerability Discussion: Packet signing can prevent man-in-the-middle 
# attacks which modify SMB packets in transit.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To verify that Samba clients using mount.cifs must use packet signing, 
# run the following command: 

# grep sec /etc/fstab

# The output should show either "krb5i" or "ntlmv2i" in use. 
# If it does not, this is a finding.
#
# Fix Text: 
#
# Require packet signing of clients who mount Samba shares using the 
# "mount.cifs" program (e.g., those who specify shares in "/etc/fstab"). To 
# do so, ensure signing options (either "sec=krb5i" or "sec=ntlmv2i") are 
# used. 

# See the "mount.cifs(8)" man page for more information. A Samba client 
# should only communicate with servers who can support SMB packet signing.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000273
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

