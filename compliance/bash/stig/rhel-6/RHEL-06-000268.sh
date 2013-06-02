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
# Group ID (Vulid): RHEL-06-000268
# Group Title: SRG-OS-000096
#
   
# Rule ID: RHEL-06-000268_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000268
# Rule Title: The rdisc service must not be running.
#
# Vulnerability Discussion: General-purpose systems typically have their 
# network and routing information configured statically by a system 
# administrator. Workstations or some special-purpose systems often use 
# DHCP (instead of IRDP) to retrieve dynamic network configuration 
# information.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check that the "rdisc" service is disabled in system boot 
# configuration, run the following command: 

# chkconfig "rdisc" --list

# Output should indicate the "rdisc" service has either not been installed, 
# or has been disabled at all runlevels, as shown in the example below: 

# chkconfig "rdisc" --list
# "rdisc" 0:off 1:off 2:off 3:off 4:off 5:off 6:off

# Run the following command to verify "rdisc" is disabled through current 
# runtime configuration: 

# service rdisc status

# If the service is disabled the command will return the following output: 

# rdisc is stopped


# If the service is running, this is a finding.
#
# Fix Text: 
#
# The "rdisc" service implements the client side of the ICMP Internet 
# Router Discovery Protocol (IRDP), which allows discovery of routers on 
# the local subnet. If a router is discovered then the local routing table 
# is updated with a corresponding default route. By default this daemon is 
# disabled. The "rdisc" service can be disabled with the following command: 

# chkconfig rdisc off

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000268
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

