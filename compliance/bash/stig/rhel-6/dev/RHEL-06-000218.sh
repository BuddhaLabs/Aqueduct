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
# Group ID (Vulid): RHEL-06-000218
# Group Title: SRG-OS-000248
#
   
# Rule ID: RHEL-06-000218_rule
# Severity: high
# Rule Version (STIG-ID): RHEL-06-000218
# Rule Title: The rlogind service must not be running.
#
# Vulnerability Discussion: The rlogin service uses unencrypted network 
# communications, which means that data from the login session, including 
# passwords and all other information transmitted during the session, can 
# be stolen by eavesdroppers on the network.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check that the "rlogin" service is disabled in system boot 
# configuration, run the following command: 

# chkconfig "rlogin" --list

# Output should indicate the "rlogin" service has either not been 
# installed, or has been disabled at all runlevels, as shown in the example 
# below: 

# chkconfig "rlogin" --list
# "rlogin" 0:off 1:off 2:off 3:off 4:off 5:off 6:off

# Run the following command to verify "rlogin" is disabled through current 
# runtime configuration: 

# service rlogin status

# If the service is disabled the command will return the following output: 

# rlogin is stopped


# If the service is running, this is a finding.
#
# Fix Text: 
#
# The "rlogin" service, which is available with the "rsh-server" package 
# and runs as a service through xinetd, should be disabled. The "rlogin" 
# service can be disabled with the following command: 

# chkconfig rlogin off

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000218
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

