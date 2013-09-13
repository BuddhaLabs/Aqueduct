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
# Group ID (Vulid): RHEL-06-000124
# Group Title: SRG-OS-000096
#
   
# Rule ID: RHEL-06-000124_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000124
# Rule Title: The Datagram Congestion Control Protocol (DCCP) must be 
# disabled unless required.
#
# Vulnerability Discussion: Disabling DCCP protects the system against 
# exploitation of any flaws in its implementation.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# If the system is configured to prevent the loading of the "dccp" kernel 
# module, it will contain lines inside any file in "/etc/modprobe.d" or the 
# deprecated"/etc/modprobe.conf". These lines instruct the module loading 
# system to run another program (such as "/bin/true") upon a module 
# "install" event. Run the following command to search for such lines in 
# all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf": 

# $ grep -r dccp /etc/modprobe.conf /etc/modprobe.d


# If no line is returned, this is a finding.
#
# Fix Text: 
#
# The Datagram Congestion Control Protocol (DCCP) is a relatively new 
# transport layer protocol, designed to support streaming media and 
# telephony. To configure the system to prevent the "dccp" kernel module 
# from being loaded, add the following line to a file in the directory 
# "/etc/modprobe.d": 

# install dccp /bin/true

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000124
#
#BEGIN_CHECK

. ./aqueduct_functions
HAS_DCCP=`grep -r dccp /etc/modprobe.d | grep ':install' |  wc -l`

#END_CHECK
#BEGIN_REMEDY

if [ "$HAS_DCCP" -eq 0 ]
then
        echo "install dccp /bin/true" > /etc/modprobe.d/dccp.conf
fi

#END_REMEDY

