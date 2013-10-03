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
#    1.1     |  Script add test and fix |  Leam Hall         | 3-OCT-2013
#	                                                                  
   
#	
#######################DISA INFORMATION##################################
# Group ID (Vulid): RHEL-06-000258
# Group Title: SRG-OS-000029
#
   
# Rule ID: RHEL-06-000258_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000258
# Rule Title: The graphical desktop environment must automatically lock 
# after 15 minutes of inactivity and the system must require user to 
# re-authenticate to unlock the environment.
#
# Vulnerability Discussion: Enabling idle activation of the screen saver 
# ensures the screensaver will be activated after the idle delay. 
# Applications requiring continuous, real-time screen display (such as 
# network management products) require the login session does not have 
# administrator rights and the display station is located in a 
# controlled-access area.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To check the screensaver mandatory use status, run the following 
# command: 

# $ gconftool-2 -g /apps/gnome-screensaver/idle_activation_enabled

# If properly configured, the output should be "true". 
# If it is not, this is a finding.
#
# Fix Text: 
#
# Run the following command to activate the screensaver in the GNOME 
# desktop after a period of inactivity: 

# gconftool-2 --direct \
# --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory \
# --type bool \
# --set /apps/gnome-screensaver/idle_activation_enabled true

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000258
#
#BEGIN_CHECK

. ./aqueduct_functions

what_runlevel

#END_CHECK
#BEGIN_REMEDY

if [ $? -ne 3 ]
then
	if [ -x /usr/bin/gconftool-2 ]
	then
		IDLE_ACTIVATION_ENABLED=`gconftool-2 -g /apps/gnome-screensaver/idle_activation_enabled`
		if [ "$IDLE_ACTIVATION_ENABLED" != "true" ]
		then
			gconftool-2 --direct \
				--config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory \
				--type bool \
				--set /apps/gnome-screensaver/idle_activation_enabled true
		fi
	fi
fi

#END_REMEDY

