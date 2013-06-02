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
# Group ID (Vulid): RHEL-06-000289
# Group Title: SRG-OS-000096
#
   
# Rule ID: RHEL-06-000289_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000289
# Rule Title: The netconsole service must be disabled unless required.
#
# Vulnerability Discussion: The "netconsole" service is not necessary 
# unless there is a need to debug kernel panics, which is not common.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check that the "netconsole" service is disabled in system boot 
# configuration, run the following command: 

# chkconfig "netconsole" --list

# Output should indicate the "netconsole" service has either not been 
# installed, or has been disabled at all runlevels, as shown in the example 
# below: 

# chkconfig "netconsole" --list
# "netconsole" 0:off 1:off 2:off 3:off 4:off 5:off 6:off

# Run the following command to verify "netconsole" is disabled through 
# current runtime configuration: 

# service netconsole status

# If the service is disabled the command will return the following output: 

# netconsole is stopped


# If the service is running, this is a finding.
#
# Fix Text: 
#
# The "netconsole" service is responsible for loading the netconsole 
# kernel module, which logs kernel printk messages over UDP to a syslog 
# server. This allows debugging of problems where disk logging fails and 
# serial consoles are impractical. The "netconsole" service can be disabled 
# with the following command: 

# chkconfig netconsole off

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000289
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

