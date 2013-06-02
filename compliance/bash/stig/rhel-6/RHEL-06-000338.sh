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
# Group ID (Vulid): RHEL-06-000338
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000338_rule
# Severity: high
# Rule Version (STIG-ID): RHEL-06-000338
# Rule Title: The TFTP daemon must operate in "secure mode" which 
# provides access only to a single directory on the host file system.
#
# Vulnerability Discussion: Using the "-s" option causes the TFTP service 
# to only serve files from the given directory. Serving files from an 
# intentionally specified directory reduces the risk of sharing files which 
# should remain private.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Verify "tftp" is configured by with the "-s" option by running the 
# following command: 

# grep "server_args" /etc/xinetd.d/tftp

# The output should indicate the "server_args" variable is configured with 
# the "-s" flag, matching the example below:

# grep "server_args" /etc/xinetd.d/tftp
# server_args = -s /var/lib/tftpboot

# If it does not, this is a finding.

#
# Fix Text: 
#
# If running the "tftp" service is necessary, it should be configured to 
# change its root directory at startup. To do so, ensure 
# "/etc/xinetd.d/tftp" includes "-s" as a command line argument, as shown 
# in the following example (which is also the default): 

# server_args = -s /var/lib/tftpboot

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000338
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

