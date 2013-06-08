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
# Group ID (Vulid): RHEL-06-000266
# Group Title: SRG-OS-000096
#
   
# Rule ID: RHEL-06-000266_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000266
# Rule Title: The oddjobd service must not be running.
#
# Vulnerability Discussion: The "oddjobd" service may provide necessary 
# functionality in some environments but it can be disabled if it is not 
# needed. Execution of tasks by privileged programs, on behalf of 
# unprivileged ones, has traditionally been a source of privilege 
# escalation security issues.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check that the "oddjobd" service is disabled in system boot 
# configuration, run the following command: 

# chkconfig "oddjobd" --list

# Output should indicate the "oddjobd" service has either not been 
# installed, or has been disabled at all runlevels, as shown in the example 
# below: 

# chkconfig "oddjobd" --list
# "oddjobd" 0:off 1:off 2:off 3:off 4:off 5:off 6:off

# Run the following command to verify "oddjobd" is disabled through current 
# runtime configuration: 

# service oddjobd status

# If the service is disabled the command will return the following output: 

# oddjobd is stopped


# If the service is running, this is a finding.
#
# Fix Text: 
#
# The "oddjobd" service exists to provide an interface and access control 
# mechanism through which specified privileged tasks can run tasks for 
# unprivileged client applications. Communication with "oddjobd" is through 
# the system message bus. The "oddjobd" service can be disabled with the 
# following command: 

# chkconfig oddjobd off

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000266
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

