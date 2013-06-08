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
# Group ID (Vulid): RHEL-06-000214
# Group Title: SRG-OS-000033
#
   
# Rule ID: RHEL-06-000214_rule
# Severity: high
# Rule Version (STIG-ID): RHEL-06-000214
# Rule Title: The rshd service must not be running.
#
# Vulnerability Discussion: The rsh service uses unencrypted network 
# communications, which means that data from the login session, including 
# passwords and all other information transmitted during the session, can 
# be stolen by eavesdroppers on the network.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check that the "rsh" service is disabled in system boot 
# configuration, run the following command: 

# chkconfig "rsh" --list

# Output should indicate the "rsh" service has either not been installed, 
# or has been disabled at all runlevels, as shown in the example below: 

# chkconfig "rsh" --list
# "rsh" 0:off 1:off 2:off 3:off 4:off 5:off 6:off

# Run the following command to verify "rsh" is disabled through current 
# runtime configuration: 

# service rsh status

# If the service is disabled the command will return the following output: 

# rsh is stopped


# If the service is running, this is a finding.
#
# Fix Text: 
#
# The "rsh" service, which is available with the "rsh-server" package and 
# runs as a service through xinetd, should be disabled. The "rsh" service 
# can be disabled with the following command: 

# chkconfig rsh off

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000214
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

