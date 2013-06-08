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
# Group ID (Vulid): RHEL-06-000508
# Group Title: SRG-OS-000030
#
   
# Rule ID: RHEL-06-000508_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000508
# Rule Title: The system must allow locking of graphical desktop sessions.
#
# Vulnerability Discussion: The ability to lock graphical desktop 
# sessions manually allows users to easily secure their accounts should 
# they need to depart from their workstations temporarily.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Verify the keybindings for the Gnome screensaver:

# gconftool-2 --direct --config-source 
# xml:readwrite:/etc/gconf/gconf.xml.mandatory --get 
# /apps/gnome_settings_daemon/keybindings/screensaver

# If no output is visible, this is a finding.
#
# Fix Text: 
#
# Run the following command to set the Gnome desktop keybinding for 
# locking the screen:

# gconftool-2
# --direct \
# --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory \
# --type string \
# --set /apps/gnome_settings_daemon/keybindings/screensaver 
# "<Control><Alt>l"

# Another keyboard sequence may be substituted for "<Control><Alt>l", which 
# is the default for the Gnome desktop.
  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000508
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

