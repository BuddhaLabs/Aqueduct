#!/bin/bash

##########################################################################
#Aqueduct - Compliance Remediation Content
#Copyright (C) 2011,2012  
#  Vincent C. Passaro (vincent.passaro@gmail.com)
#  Shannon Mitchell (shannon.mitchell@fusiontechnology-llc.com)
#
#This program is free software; you can redistribute it and/or
#modify it under the terms of the GNU General Public License
#as published by the Free Software Foundation; either version 2
#of the License, or (at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program; if not, write to the Free Software
#Foundation, Inc., 51 Franklin Street, Fifth Floor,
#Boston, MA  02110-1301, USA.
##########################################################################

###################### Fotis Networks LLC ###############################
# By Vincent C. Passaro                                                 #
# Fotis Networks LLC	                                                #
# Vincent[.]Passaro[@]fotisnetworks[.]com                               #
# www.fotisnetworks.com	                                                #
###################### Fotis Networks LLC ###############################
#
#  _____________________________________________________________________
# |  Version |   Change Information  |      Author        |    Date    |
# |__________|_______________________|____________________|____________|
# |    1.0   |   Initial Script      | Vincent C. Passaro | 1-Aug-2012 |
# |          |   Creation            |                    |            |
# |__________|_______________________|____________________|____________|
#	                                                                  
   
	
#######################DISA INFORMATION##################################
# Group ID (Vulid): V-22449
# Group Title: GEN005307
# Rule ID: SV-37695r1_rule
# Severity: medium
# Rule Version (STIG-ID): GEN005307
# Rule Title: The SNMP service must require the use of a FIPS 140-2 
# approved encryption algorithm for protecting the privacy of SNMP messages.
#
# Vulnerability Discussion: The SNMP service must use AES or a FIPS 140-2 
# approved successor algorithm for protecting the privacy of communications.
#
# Responsibility: System Administrator
# IAControls: DCNR-1
#
# Check Content:
#
# Verify the SNMP daemon uses AES for SNMPv3 users.

# Procedure:
# Examine the default install location /etc/snmp/snmpd.conf
# or:
# find / -name snmpd.conf 


# grep -v '^#' <snmpd.conf file> | grep -i createuser | grep -vi AES
# If any line is present this is a finding.

#
# Fix Text: 
#
# Edit /etc/snmp/snmpd.conf and add the AES keyword for any create user 
# statement without one.
# Restart the SNMP service.
# service snmpd restart  
#######################DISA INFORMATION##################################
	
# Global Variables
PDI=GEN005307
	
# Start-Lockdown
# Confirm that we actually have net-snmp installed.  Both the directory holding the files for this GEN
# as well as the net-snmp RPM must be missing in order for this check to stop execution of the script
if [ ! -d /etc/snmp ] && ! rpm -q net-snmp >/dev/null 2>&1 ; then
        exit 0
fi


# man snmpd.conf
# ...
# createUser [-e ENGINEID] username  (MD5|SHA)  authpassphrase  [DES|AES] [privpassphrase]
# ...
# Based on the man pages the only option to SHA is MD5, so lets just change it.i
# Depending on how its used, changing it from MD5 to SHA may require manual
# changes.

grep 'createUser' /etc/snmp/snmpd.conf | grep 'DES' > /dev/null
if [ $? -eq 0 ]
then
  sed -i 's/^\(createUser.*\)DES\(.*\)/\1AES\2/g' /etc/snmp/snmpd.conf
fi
