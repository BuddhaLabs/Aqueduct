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
# Group ID (Vulid): RHEL-06-000267
# Group Title: SRG-OS-000096
#
   
# Rule ID: RHEL-06-000267_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000267
# Rule Title: The qpidd service must not be running.
#
# Vulnerability Discussion: The qpidd service is automatically installed 
# when the "base" package selection is selected during installation. The 
# qpidd service listens for network connections which increases the attack 
# surface of the system. If the system is not intended to receive AMQP 
# traffic then the "qpidd" service is not needed and should be disabled or 
# removed.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check that the "qpidd" service is disabled in system boot 
# configuration, run the following command: 

# chkconfig "qpidd" --list

# Output should indicate the "qpidd" service has either not been installed, 
# or has been disabled at all runlevels, as shown in the example below: 

# chkconfig "qpidd" --list
# "qpidd" 0:off 1:off 2:off 3:off 4:off 5:off 6:off

# Run the following command to verify "qpidd" is disabled through current 
# runtime configuration: 

# service qpidd status

# If the service is disabled the command will return the following output: 

# qpidd is stopped


# If the service is running, this is a finding.
#
# Fix Text: 
#
# The "qpidd" service provides high speed, secure, guaranteed delivery 
# services. It is an implementation of the Advanced Message Queuing 
# Protocol. By default the qpidd service will bind to port 5672 and listen 
# for connection attempts. The "qpidd" service can be disabled with the 
# following command: 

# chkconfig qpidd off

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000267
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

