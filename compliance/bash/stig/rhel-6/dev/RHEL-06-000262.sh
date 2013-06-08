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
# Group ID (Vulid): RHEL-06-000262
# Group Title: SRG-OS-000096
#
   
# Rule ID: RHEL-06-000262_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000262
# Rule Title: The atd service must be disabled.
#
# Vulnerability Discussion: The "atd" service could be used by an 
# unsophisticated insider to carry out activities outside of a normal login 
# session, which could complicate accountability. Furthermore, the need to 
# schedule tasks with "at" or "batch" is not common.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# If the system uses the "atd" service, this is not applicable.

# To check that the "atd" service is disabled in system boot configuration, 
# run the following command: 

# chkconfig "atd" --list

# Output should indicate the "atd" service has either not been installed, 
# or has been disabled at all runlevels, as shown in the example below: 

# chkconfig "atd" --list
# "atd" 0:off 1:off 2:off 3:off 4:off 5:off 6:off

# Run the following command to verify "atd" is disabled through current 
# runtime configuration: 

# service atd status

# If the service is disabled the command will return the following output: 

# atd is stopped


# If the service is running, this is a finding.
#
# Fix Text: 
#
# The "at" and "batch" commands can be used to schedule tasks that are 
# meant to be executed only once. This allows delayed execution in a manner 
# similar to cron, except that it is not recurring. The daemon "atd" keeps 
# track of tasks scheduled via "at" and "batch", and executes them at the 
# specified time. The "atd" service can be disabled with the following 
# command: 

# chkconfig atd off

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000262
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

