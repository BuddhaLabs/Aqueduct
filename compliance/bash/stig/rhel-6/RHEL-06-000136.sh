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
# Group ID (Vulid): RHEL-06-000136
# Group Title: SRG-OS-000215
#
   
# Rule ID: RHEL-06-000136_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000136
# Rule Title: The operating system must back up audit records on an 
# organization defined frequency onto a different system or media than the 
# system being audited.
#
# Vulnerability Discussion: A log server (loghost) receives syslog 
# messages from one or more systems. This data can be used as an additional 
# log source in the event a system is compromised and its local logs are 
# suspect. Forwarding log messages to a remote loghost also provides system 
# administrators with a centralized place to view the status of multiple 
# hosts within the enterprise.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To ensure logs are sent to a remote host, examine the file 
# "/etc/rsyslog.conf". If using UDP, a line similar to the following should 
# be present: 

# *.* @[loghost.example.com]

# If using TCP, a line similar to the following should be present: 

# *.* @@[loghost.example.com]

# If using RELP, a line similar to the following should be present: 

# *.* :omrelp:[loghost.example.com]


# If none of these are present, this is a finding.
#
# Fix Text: 
#
# To configure rsyslog to send logs to a remote log server, open 
# "/etc/rsyslog.conf" and read and understand the last section of the file, 
# which describes the multiple directives necessary to activate remote 
# logging. Along with these other directives, the system can be configured 
# to forward its logs to a particular log server by adding or correcting 
# one of the following lines, substituting "[loghost.example.com]" 
# appropriately. The choice of protocol depends on the environment of the 
# system; although TCP and RELP provide more reliable message delivery, 
# they may not be supported in all environments. 
# To use UDP for log message delivery: 

# *.* @[loghost.example.com]


# To use TCP for log message delivery: 

# *.* @@[loghost.example.com]


# To use RELP for log message delivery: 

# *.* :omrelp:[loghost.example.com]

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000136
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

