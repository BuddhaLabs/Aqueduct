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
# Group ID (Vulid): RHEL-06-000009
# Group Title: SRG-OS-000096
#
   
# Rule ID: RHEL-06-000009_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000009
# Rule Title: The Red Hat Network Service (rhnsd) service must not be 
# running, unless using RHN or an RHN Satellite.
#
# Vulnerability Discussion: Although systems management and patching is 
# extremely important to system security, management by a system outside 
# the enterprise enclave is not desirable for some environments. However, 
# if the system is being managed by RHN or RHN Satellite Server the "rhnsd" 
# daemon can remain on.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# If the system uses RHN or is an RHN Satellite, this is not applicable.

# To check that the "rhnsd" service is disabled in system boot 
# configuration, run the following command: 

# chkconfig "rhnsd" --list

# Output should indicate the "rhnsd" service has either not been installed, 
# or has been disabled at all runlevels, as shown in the example below: 

# chkconfig "rhnsd" --list
# "rhnsd" 0:off 1:off 2:off 3:off 4:off 5:off 6:off

# Run the following command to verify "rhnsd" is disabled through current 
# runtime configuration: 

# service rhnsd status

# If the service is disabled the command will return the following output: 

# rhnsd is stopped


# If the service is running, this is a finding.
#
# Fix Text: 
#
# The Red Hat Network service automatically queries Red Hat Network 
# servers to determine whether there are any actions that should be 
# executed, such as package updates. This only occurs if the system was 
# registered to an RHN server or satellite and managed as such. The "rhnsd" 
# service can be disabled with the following command: 

# chkconfig rhnsd off

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000009
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

#BEGIN_COMMENT
# This is not a finding if you are using RHN, Satellite, or manually 
# updating your servers. 
#END_COMMENT

