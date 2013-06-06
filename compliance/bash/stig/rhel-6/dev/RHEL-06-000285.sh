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
# Group ID (Vulid): RHEL-06-000285
# Group Title: SRG-OS-000196
#
   
# Rule ID: RHEL-06-000285_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000285
# Rule Title: The system must have a host-based intrusion detection tool 
# installed.
#
# Vulnerability Discussion: Adding host-based intrusion detection tools 
# can provide the capability to automatically take actions in response to 
# malicious behavior, which can provide additional agility in reacting to 
# network threats. These tools also often include a reporting capability to 
# provide network awareness of system, which may not otherwise exist in an 
# organization's systems management regime.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Inspect the system to determine if intrusion detection software has 
# been installed. Verify the intrusion detection software is active. 
# If no host-based intrusion detection tools are installed, this is a 
# finding.
#
# Fix Text: 
#
# The base Red Hat platform already includes a sophisticated auditing 
# system that can detect intruder activity, as well as SELinux, which 
# provides host-based intrusion prevention capabilities by confining 
# privileged programs and user sessions which may become compromised. 

# Install an additional intrusion detection tool to provide complementary 
# or duplicative monitoring, reporting, and reaction capabilities to those 
# of the base platform. For DoD systems, the McAfee Host-based Security 
# System is provided to fulfill this role.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000285
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

