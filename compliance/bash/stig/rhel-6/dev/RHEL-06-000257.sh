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
# Group ID (Vulid): RHEL-06-000257
# Group Title: SRG-OS-000029
#
   
# Rule ID: RHEL-06-000257_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000257
# Rule Title: The graphical desktop environment must set the idle timeout 
# to no more than 15 minutes.
#
# Vulnerability Discussion: Setting the idle delay controls when the 
# screensaver will start, and can be combined with screen locking to 
# prevent access from passersby.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check the current idle time-out value, run the following command: 

# $ gconftool-2 -g /apps/gnome-screensaver/idle_delay

# If properly configured, the output should be "15". 
# If it is not, this is a finding.
#
# Fix Text: 
#
# Run the following command to set the idle time-out value for inactivity 
# in the GNOME desktop to 15 minutes: 

# gconftool-2 \
# --direct \
# --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory \
# --type int \
# --set /apps/gnome-screensaver/idle_delay 15

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000257
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

