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
# Group ID (Vulid): RHEL-06-000125
# Group Title: SRG-OS-000096
#
   
# Rule ID: RHEL-06-000125_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000125
# Rule Title: The Stream Control Transmission Protocol (SCTP) must be 
# disabled unless required.
#
# Vulnerability Discussion: Disabling SCTP protects the system against 
# exploitation of any flaws in its implementation.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# If the system is configured to prevent the loading of the "sctp" kernel 
# module, it will contain lines inside any file in "/etc/modprobe.d" or the 
# deprecated"/etc/modprobe.conf". These lines instruct the module loading 
# system to run another program (such as "/bin/true") upon a module 
# "install" event. Run the following command to search for such lines in 
# all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf": 

# $ grep -r sctp /etc/modprobe.conf /etc/modprobe.d


# If no line is returned, this is a finding.
#
# Fix Text: 
#
# The Stream Control Transmission Protocol (SCTP) is a transport layer 
# protocol, designed to support the idea of message-oriented communication, 
# with several streams of messages within one connection. To configure the 
# system to prevent the "sctp" kernel module from being loaded, add the 
# following line to a file in the directory "/etc/modprobe.d": 

# install sctp /bin/true

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000125
#
#BEGIN_CHECK


. ./aqueduct_functions
HAS_SCTP=`grep -r sctp /etc/modprobe.d | grep ':install' |  wc -l`

#END_CHECK
#BEGIN_REMEDY

if [ "$HAS_SCTP" -eq 0  ]
then
        echo "install sctp /bin/true" > /etc/modprobe.d/sctp.conf
fi

#END_REMEDY

