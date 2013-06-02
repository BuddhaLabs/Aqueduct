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
# Group ID (Vulid): RHEL-06-000309
# Group Title: SRG-OS-000104
#
   
# Rule ID: RHEL-06-000309_rule
# Severity: high
# Rule Version (STIG-ID): RHEL-06-000309
# Rule Title: The NFS server must not have the insecure file locking 
# option enabled.
#
# Vulnerability Discussion: Allowing insecure file locking could allow 
# for sensitive data to be viewed or edited by an unauthorized user.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To verify insecure file locking has been disabled, run the following 
# command: 

# grep insecure_locks /etc/exports


# If there is output, this is a finding.
#
# Fix Text: 
#
# By default the NFS server requires secure file-lock requests, which 
# require credentials from the client in order to lock a file. Most NFS 
# clients send credentials with file lock requests, however, there are a 
# few clients that do not send credentials when requesting a file-lock, 
# allowing the client to only be able to lock world-readable files. To get 
# around this, the "insecure_locks" option can be used so these clients can 
# access the desired export. This poses a security risk by potentially 
# allowing the client access to data for which it does not have 
# authorization. Remove any instances of the "insecure_locks" option from 
# the file "/etc/exports".  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000309
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

