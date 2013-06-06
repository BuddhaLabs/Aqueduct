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
# Group ID (Vulid): RHEL-06-000341
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000341_rule
# Severity: high
# Rule Version (STIG-ID): RHEL-06-000341
# Rule Title: The snmpd service must not use a default password.
#
# Vulnerability Discussion: Presence of the default SNMP password enables 
# querying of different system aspects and could result in unauthorized 
# knowledge of the system.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To ensure the default password is not set, run the following command: 

# grep -v "^#" /etc/snmp/snmpd.conf| grep public

# There should be no output. 
# If there is output, this is a finding.
#
# Fix Text: 
#
# Edit "/etc/snmp/snmpd.conf", remove default community string "public". 
# Upon doing that, restart the SNMP service: 

# service snmpd restart

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000341
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

