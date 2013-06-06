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
# Group ID (Vulid): RHEL-06-000326
# Group Title: SRG-OS-000228
#
   
# Rule ID: RHEL-06-000326_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000326
# Rule Title: The Department of Defense (DoD) login banner must be 
# displayed immediately prior to, or as part of, graphical desktop 
# environment login prompts.
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
# To ensure login warning banner text is properly set, run the following: 

# $ gconftool-2 -g /apps/gdm/simple-greeter/banner_message_text

# If properly configured, the proper banner text will appear within this 
# schema. 

# The DoD required text is either: 

# "You are accessing a U.S. Government (USG) Information System (IS) that 
# is provided for USG-authorized use only. By using this IS (which includes 
# any device attached to this IS), you consent to the following conditions: 
# -The USG routinely intercepts and monitors communications on this IS for 
# purposes including, but not limited to, penetration testing, COMSEC 
# monitoring, network operations and defense, personnel misconduct (PM), 
# law enforcement (LE), and counterintelligence (CI) investigations. 
# -At any time, the USG may inspect and seize data stored on this IS. 
# -Communications using, or data stored on, this IS are not private, are 
# subject to routine monitoring, interception, and search, and may be 
# disclosed or used for any USG-authorized purpose. 
# -This IS includes security measures (e.g., authentication and access 
# controls) to protect USG interests -- not for your personal benefit or 
# privacy. 
# -Notwithstanding the above, using this IS does not constitute consent to 
# PM, LE or CI investigative searching or monitoring of the content of 
# privileged communications, or work product, related to personal 
# representation or services by attorneys, psychotherapists, or clergy, and 
# their assistants. Such communications and work product are private and 
# confidential. See User Agreement for details." 

# OR: 

# "I've read & consent to terms in IS user agreem't."

# If the DoD required banner text is not appear in the schema, this is a 
# finding.
#
# Fix Text: 
#
# To set the text shown by the GNOME Display Manager in the login screen, 
# run the following command: 

# sudo -u gdm gconftool-2 \
# --type string \
# --set /apps/gdm/simple-greeter/banner_message_text \
# "[DoD required text]"

# Where the DoD required text is either: 

# "You are accessing a U.S. Government (USG) Information System (IS) that 
# is provided for USG-authorized use only. By using this IS (which includes 
# any device attached to this IS), you consent to the following conditions: 
# -The USG routinely intercepts and monitors communications on this IS for 
# purposes including, but not limited to, penetration testing, COMSEC 
# monitoring, network operations and defense, personnel misconduct (PM), 
# law enforcement (LE), and counterintelligence (CI) investigations. 
# -At any time, the USG may inspect and seize data stored on this IS. 
# -Communications using, or data stored on, this IS are not private, are 
# subject to routine monitoring, interception, and search, and may be 
# disclosed or used for any USG-authorized purpose. 
# -This IS includes security measures (e.g., authentication and access 
# controls) to protect USG interests -- not for your personal benefit or 
# privacy. 
# -Notwithstanding the above, using this IS does not constitute consent to 
# PM, LE or CI investigative searching or monitoring of the content of 
# privileged communications, or work product, related to personal 
# representation or services by attorneys, psychotherapists, or clergy, and 
# their assistants. Such communications and work product are private and 
# confidential. See User Agreement for details." 

# OR: 

# "I've read & consent to terms in IS user agreem't."

# When entering a warning banner that spans several lines, remember to 
# begin and end the string with """. This command writes directly to the 
# file "/var/lib/gdm/.gconf/apps/gdm/simple-greeter/%gconf.xml", and this 
# file can later be edited directly if necessary.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000326
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

