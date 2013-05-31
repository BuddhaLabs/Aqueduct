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
# Group ID (Vulid): V-22557
# Group Title: GEN008020
# Rule ID: SV-37632r1_rule
# Severity: medium
# Rule Version (STIG-ID): GEN008020
# Rule Title: If the system is using LDAP for authentication or account 
# information, the LDAP TLS connection must require the server provide a 
# certificate with a valid trust path to a trusted CA.
#
# Vulnerability Discussion: The NSS LDAP service provides user mappings 
# which are a vital component of system security.  Communication between an 
# LDAP server and a host using LDAP for NSS require authentication.
#
# Responsibility: System Administrator
# IAControls: DCNR-1
#
# Check Content:
#
# Check if the system is using NSS LDAP.
# grep -v '^#' /etc/nsswitch.conf | grep ldap
# If no lines are returned, this vulnerability is not applicable.

# Verify a server certificate is required and verified by the NSS LDAP 
# configuration.
# grep -i '^tls_checkpeer' /etc/ldap.conf
# If no line is returned, or the value is not "yes", this is a finding.


#
# Fix Text: 
#
# Edit "/etc/ldap.conf" and add or set the "tls_checkpeer" setting to 
# "yes".    
#######################DISA INFORMATION##################################
	
# Global Variables
PDI=GEN008020
	
# Start-Lockdown

# The nsswitch check above doesn't include if ldap is configure for 
# authentication. Lets check for that and for pam_ldap as well. 

RUNFIX=0
grep -v '^#' /etc/nsswitch.conf | grep ldap > /dev/null
if [ $? -eq 0 ]
then
  RUNFIX=1
fi

grep -v '^#' /etc/pam.d/* | grep pam_ldap > /dev/null
if [ $? -eq 0 ]
then
  RUNFIX=1
fi


if [ $RUNFIX -eq 1 ]
then
  if [ -e /etc/ldap.conf ]
  then
    grep '^tls_checkpeer ' /etc/ldap.conf > /dev/null
    if [ $? -eq 0 ]
    then
      grep '^tls_checkpeer yes$' /etc/ldap.conf > /dev/null
      if [ $? -ne 0 ]
      then
        sed -i -e 's/^tls_checkpeer .*/tls_checkpeer yes/g' /etc/ldap.conf
      fi
    else
      echo "#Entry added by STIG check $PDI" >> /etc/ldap.conf
      echo "tls_checkpeer yes" >> /etc/ldap.conf
    fi
  fi
fi

