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
# Group ID (Vulid): RHEL-06-000340
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000340_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000340
# Rule Title: The snmpd service must use only SNMP protocol version 3 or 
# newer.
#
# Vulnerability Discussion: Earlier versions of SNMP are considered 
# insecure, as they potentially allow unauthorized access to detailed 
# system management information.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To ensure only SNMPv3 or newer is used, run the following command: 

# grep 'v1\|v2c\|com2sec' /etc/snmp/snmpd.conf | grep -v '^#'

# There should be no output. 
# If there is output, this is a finding.
#
# Fix Text: 
#
# Edit "/etc/snmp/snmpd.conf", removing any references to "v1", "v2c", or 
# "com2sec". Upon doing that, restart the SNMP service: 

# service snmpd restart

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000340
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

