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
# Group ID (Vulid): RHEL-06-000261
# Group Title: SRG-OS-000096
#
   
# Rule ID: RHEL-06-000261_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000261
# Rule Title: The Automatic Bug Reporting Tool (abrtd) service must not 
# be running.
#
# Vulnerability Discussion: Mishandling crash data could expose sensitive 
# information about vulnerabilities in software executing on the local 
# machine, as well as sensitive information from within a process's address 
# space or registers.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check that the "abrtd" service is disabled in system boot 
# configuration, run the following command: 

# chkconfig "abrtd" --list

# Output should indicate the "abrtd" service has either not been installed, 
# or has been disabled at all runlevels, as shown in the example below: 

# chkconfig "abrtd" --list
# "abrtd" 0:off 1:off 2:off 3:off 4:off 5:off 6:off

# Run the following command to verify "abrtd" is disabled through current 
# runtime configuration: 

# service abrtd status

# If the service is disabled the command will return the following output: 

# abrtd is stopped


# If the service is running, this is a finding.
#
# Fix Text: 
#
# The Automatic Bug Reporting Tool ("abrtd") daemon collects and reports 
# crash data when an application crash is detected. Using a variety of 
# plugins, abrtd can email crash reports to system administrators, log 
# crash reports to files, or forward crash reports to a centralized issue 
# tracking system such as RHTSupport. The "abrtd" service can be disabled 
# with the following command: 

# chkconfig abrtd off

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000261
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

