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
# Group ID (Vulid): RHEL-06-000509
# Group Title: SRG-OS-000043
#
   
# Rule ID: RHEL-06-000509_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000509
# Rule Title: The system must forward audit records to the syslog service.
#
# Vulnerability Discussion: The auditd service does not include the 
# ability to send audit records to a centralized server for management 
# directly.  It does, however, include an audit event multiplexor plugin 
# (audispd) to pass audit records to the local syslog server.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Verify the audispd plugin is active:

# grep active /etc/audisp/plugins.d/syslog.conf

# If the "active" setting is missing or set to "no", this is a finding.
#
# Fix Text: 
#
# Set the "active" line in "/etc/audisp/plugins.d/syslog.conf" to "yes".  
# Restart the auditd process.

# service auditd restart  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000509
#
#BEGIN_CHECK
ACTIVESETTING=$(cat /etc/audisp/plugins.d/syslog.conf | grep 'active = no' | wc -l)
if [ $ACTIVESETTING -ne 0 ]
	then
#END_CHECK
#BEGIN_REMEDY
		sed -i 's/active = no/active = yes/g'  /etc/audisp/plugins.d/syslog.conf
fi
#END_REMEDY

