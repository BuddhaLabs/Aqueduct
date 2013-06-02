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
# Group ID (Vulid): RHEL-06-000324
# Group Title: SRG-OS-000024
#
   
# Rule ID: RHEL-06-000324_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000324
# Rule Title: A login banner must be displayed immediately prior to, or 
# as part of, graphical desktop environment login prompts.
#
# Vulnerability Discussion: An appropriate warning message reinforces 
# policy awareness during the logon process and facilitates possible legal 
# action against attackers.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To ensure a login warning banner is enabled, run the following: 

# $ gconftool-2 -g /apps/gdm/simple-greeter/banner_message_enable

# Search for the "banner_message_enable" schema. If properly configured, 
# the "default" value should be "true". 
# If it is not, this is a finding.
#
# Fix Text: 
#
# To enable displaying a login warning banner in the GNOME Display 
# Manager's login screen, run the following command: 

# sudo -u gdm gconftool-2 \
# --type bool \
# --set /apps/gdm/simple-greeter/banner_message_enable true

# To display a banner, this setting must be enabled and then banner text 
# must also be set.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000324
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

