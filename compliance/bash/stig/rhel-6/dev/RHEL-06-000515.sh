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
# Group ID (Vulid): RHEL-06-000515
# Group Title: SRG-OS-000104
#
   
# Rule ID: RHEL-06-000515_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000515
# Rule Title: The NFS server must not have the all_squash option enabled.
#
# Vulnerability Discussion: The "all_squash" option maps all client 
# requests to a single anonymous uid/gid on the NFS server, negating the 
# ability to track file access by user ID.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# If the NFS server is read-only, in support of unrestricted access to 
# organizational content, this is not applicable.

# The related "root_squash" option provides protection against remote 
# administrator-level access to NFS server content.  Its use is not a 
# finding.

# To verify the "all_squash" option has been disabled, run the following 
# command:

# grep all_squash /etc/exports


# If there is output, this is a finding.
#
# Fix Text: 
#
# Remove any instances of the "all_squash" option from the file 
# "/etc/exports".  Restart the NFS daemon for the changes to take effect.

# service nfs restart  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000515
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

