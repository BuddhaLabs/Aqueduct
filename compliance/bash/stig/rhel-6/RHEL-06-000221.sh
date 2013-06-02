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
# Group ID (Vulid): RHEL-06-000221
# Group Title: SRG-OS-000096
#
   
# Rule ID: RHEL-06-000221_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000221
# Rule Title: The ypbind service must not be running.
#
# Vulnerability Discussion: Disabling the "ypbind" service ensures the 
# system is not acting as a client in a NIS or NIS+ domain.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check that the "ypbind" service is disabled in system boot 
# configuration, run the following command: 

# chkconfig "ypbind" --list

# Output should indicate the "ypbind" service has either not been 
# installed, or has been disabled at all runlevels, as shown in the example 
# below: 

# chkconfig "ypbind" --list
# "ypbind" 0:off 1:off 2:off 3:off 4:off 5:off 6:off

# Run the following command to verify "ypbind" is disabled through current 
# runtime configuration: 

# service ypbind status

# If the service is disabled the command will return the following output: 

# ypbind is stopped


# If the service is running, this is a finding.
#
# Fix Text: 
#
# The "ypbind" service, which allows the system to act as a client in a 
# NIS or NIS+ domain, should be disabled. The "ypbind" service can be 
# disabled with the following command: 

# chkconfig ypbind off

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000221
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

