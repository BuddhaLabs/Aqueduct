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
# Group ID (Vulid): RHEL-06-000259
# Group Title: SRG-OS-000029
#
   
# Rule ID: RHEL-06-000259_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000259
# Rule Title: The graphical desktop environment must have automatic lock 
# enabled.
#
# Vulnerability Discussion: Enabling the activation of the screen lock 
# after an idle period ensures password entry will be required in order to 
# access the system, preventing access by passersby.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check the status of the idle screen lock activation, run the 
# following command: 

# $ gconftool-2 -g /apps/gnome-screensaver/lock_enabled

# If properly configured, the output should be "true". 
# If it is not, this is a finding.
#
# Fix Text: 
#
# Run the following command to activate locking of the screensaver in the 
# GNOME desktop when it is activated: 

# gconftool-2 --direct \
# --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory \
# --type bool \
# --set /apps/gnome-screensaver/lock_enabled true

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000259
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

