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
#    1.1     |  Script add test and fix |  Leam Hall         | 3-OCT-2013
#	                                                                  
   
#	
#######################DISA INFORMATION##################################
# Group ID (Vulid): RHEL-06-000331
# Group Title: SRG-OS-000034
#
   
# Rule ID: RHEL-06-000331_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000331
# Rule Title: The Bluetooth service must be disabled.
#
# Vulnerability Discussion: Disabling the "bluetooth" service prevents 
# the system from attempting connections to Bluetooth devices, which 
# entails some security risk. Nevertheless, variation in this risk decision 
# may be expected due to the utility of Bluetooth connectivity and its 
# limited range.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check that the "bluetooth" service is disabled in system boot 
# configuration, run the following command: 

# chkconfig "bluetooth" --list

# Output should indicate the "bluetooth" service has either not been 
# installed, or has been disabled at all runlevels, as shown in the example 
# below: 

# chkconfig "bluetooth" --list
# "bluetooth" 0:off 1:off 2:off 3:off 4:off 5:off 6:off

# Run the following command to verify "bluetooth" is disabled through 
# current runtime configuration: 

# service bluetooth status

# If the service is disabled the command will return the following output: 

# bluetooth is stopped


# If the service is running, this is a finding.
#
# Fix Text: 
#
# The "bluetooth" service can be disabled with the following command: 

# chkconfig bluetooth off



# service bluetooth stop

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000331
#
#BEGIN_CHECK

. ./aqueduct_functions

IS_RUNNING=`is_status_running bluetooth`
IS_ON=`is_chkconfig_on bluetooth`

#END_CHECK
#BEGIN_REMEDY

if [ if $IS_RUNNING ]
then
	set_status_off bluetooth 
fi

if [ if $IS_ON ]
then
	set_chkconfig_off bluetooth
fi
	
#END_REMEDY

