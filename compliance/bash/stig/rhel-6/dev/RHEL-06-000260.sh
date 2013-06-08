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
# Group ID (Vulid): RHEL-06-000260
# Group Title: SRG-OS-000031
#
   
# Rule ID: RHEL-06-000260_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000260
# Rule Title: The system must display a publicly-viewable pattern during 
# a graphical desktop environment session lock.
#
# Vulnerability Discussion: Setting the screensaver mode to blank-only 
# conceals the contents of the display from passersby.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To ensure the screensaver is configured to be blank, run the following 
# command: 

# $ gconftool-2 -g /apps/gnome-screensaver/mode

# If properly configured, the output should be "blank-only" 
# If it is not, this is a finding.
#
# Fix Text: 
#
# Run the following command to set the screensaver mode in the GNOME 
# desktop to a blank screen: 

# gconftool-2
# --direct \
# --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory \
# --type string \
# --set /apps/gnome-screensaver/mode blank-only

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000260
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

