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
# Group ID (Vulid): RHEL-06-000203
# Group Title: SRG-OS-000096
#
   
# Rule ID: RHEL-06-000203_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000203
# Rule Title: The xinetd service must be disabled if no network services 
# utilizing it are enabled.
#
# Vulnerability Discussion: The xinetd service provides a dedicated 
# listener service for some programs, which is no longer necessary for 
# commonly-used network services. Disabling it ensures that these uncommon 
# services are not running, and also prevents attacks against xinetd itself.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# If network services are using the xinetd service, this is not 
# applicable.

# To check that the "xinetd" service is disabled in system boot 
# configuration, run the following command: 

# chkconfig "xinetd" --list

# Output should indicate the "xinetd" service has either not been 
# installed, or has been disabled at all runlevels, as shown in the example 
# below: 

# chkconfig "xinetd" --list
# "xinetd" 0:off 1:off 2:off 3:off 4:off 5:off 6:off

# Run the following command to verify "xinetd" is disabled through current 
# runtime configuration: 

# service xinetd status

# If the service is disabled the command will return the following output: 

# xinetd is stopped


# If the service is running, this is a finding.
#
# Fix Text: 
#
# The "xinetd" service can be disabled with the following command: 

# chkconfig xinetd off

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000203
#
#BEGIN_CHECK

. ./aqueduct_functions

is_chkconfig_on xinetd


#END_CHECK
#BEGIN_REMEDY

if [ $? -eq 0 ]
then
	set_chkconfig_off xinetd 
fi

#END_REMEDY

