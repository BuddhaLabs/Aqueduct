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
# Group ID (Vulid): V-4399
# Group Title: GEN006380
# Rule ID: SV-37739r1_rule
# Severity: high
# Rule Version (STIG-ID): GEN006380
# Rule Title: The system must not use UDP for NIS/NIS+.
#
# Vulnerability Discussion: Implementing Network Information Service 
# (NIS) or NIS+ under UDP may make the system more susceptible to a Denial 
# of Service attack and does not provide the same quality of service as TCP.
#
# Responsibility: System Administrator
# IAControls: ECSC-1
#
# Check Content:
#
# If the system does not use NIS or NIS+, this is not applicable.

# Check if NIS or NIS+ is implemented using UDP.

# Procedure:
# rpcinfo -p | grep yp | grep udp

# If NIS or NIS+ is implemented using UDP, this is a finding.


#
# Fix Text: 
#
# Configure the system to not use UDP for NIS and NIS+. Consult vendor 
# documentation for the required procedure.     
#######################DISA INFORMATION##################################
	
# Global Variables
PDI=GEN006380
	
# Start-Lockdown

# There is no built in way to do this, so lets go with redhat's recommendations
# for securing NIS and set a static port.  udp can be blocked with iptables.

rpm -q ypserv > /dev/null
if [ $? -eq 0 ]
then

  grep 'YPSERV_ARGS' /etc/sysconfig/network > /dev/null
  if [ $? -eq 0 ]
  then
    grep 'YPSERV_ARGS' /etc/sysconfig/network | grep '\-p 834' > /dev/null
    if [ $? -ne 0 ]
    then
      sed -i -e 's/YPSERV_ARGS.*/YPSERV_ARGS="-p 834"/g' /etc/sysconfig/network
    fi
  else
    echo "# Setting static NIS port for STIG $PDI" >> /etc/sysconfig/network
    echo 'YPSERV_ARGS="-p 834"' >> /etc/sysconfig/network
  fi

  grep 'YPXFRD_ARGS' /etc/sysconfig/network > /dev/null
  if [ $? -eq 0 ]
  then
    grep 'YPXFRD_ARGS' /etc/sysconfig/network | grep '\-p 835' > /dev/null
    if [ $? -ne 0 ]
    then
      sed -i -e 's/YPXFRD_ARGS.*/YPXFRD_ARGS="-p 835"/g' /etc/sysconfig/network
    fi
  else
    echo "# Setting static NIS port for STIG $PDI" >> /etc/sysconfig/network
    echo 'YPXFRD_ARGS="-p 835"' >> /etc/sysconfig/network
  fi

  grep 'INPUT \-p udp \-m udp \-\-dport 834 \-j DROP' /etc/sysconfig/iptables > /dev/null
  if [ $? -ne 0 ]
  then
    service iptables start > /dev/null
    iptables -I INPUT 1 -p udp -m udp --dport 834 -j DROP
    service iptables save > /dev/null
  fi

  grep 'INPUT \-p udp \-m udp \-\-dport 835 \-j DROP' /etc/sysconfig/iptables > /dev/null
  if [ $? -ne 0 ]
  then
    service iptables start > /dev/null
    iptables -I INPUT 1 -p udp -m udp --dport 835 -j DROP
    service iptables save > /dev/null
  fi

  service ypserv restart > /dev/null

fi