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
# Group ID (Vulid): RHEL-06-000073
# Group Title: SRG-OS-000228
#
   
# Rule ID: RHEL-06-000073_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000073
# Rule Title: The Department of Defense (DoD) login banner must be 
# displayed immediately prior to, or as part of, console login prompts.
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
# To check if the system login banner is compliant, run the following 
# command: 

# $ cat /etc/issue


# If it does not display the required banner, this is a finding.
#
# Fix Text: 
#
# To configure the system login banner: 

# Edit "/etc/issue". Replace the default text with a message compliant with 
# the local site policy or a legal disclaimer. The DoD required text is 
# either: 

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
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000073
#
#BEGIN_CHECK

grep 'U\.S\.Government' /etc/issue > /dev/null

#END_CHECK
#BEGIN_REMEDY

if [ $? != 0 ]
then

  cat <<EOF > /etc/issue
##########################################################################
# You are accessing a U.S. Government (USG) Information System (IS)      #
# that is provided for USG-authorized use only.                          #
#                                                                        #
# By using this IS (which includes any device attached to this IS),      #
# you consent to the following conditions:                               #
#                                                                        #
# -The USG routinely intercepts and monitors communications on this      #
# IS for purposes including, but not limited to, penetration testing,    #
# COMSEC monitoring, network operations and defense, personnel           #
# misconduct (PM), law enforcement (LE), and counterintelligence (CI)    #
# investigations.                                                        #
#                                                                        #
# -At any time, the USG may inspect and seize data stored on this IS.    #
#                                                                        #
# -Communications using, or data stored on, this IS are not private,     #
# are subject to routine monitoring, interception, and search, and       #
# may be disclosed or used for any USG-authorized purpose.               #
#                                                                        #
# -This IS includes security measures (e.g., authentication and access   #
# controls) to protect USG interests--not for your personal benefit or   #
# privacy.                                                               #
#                                                                        #
# -Notwithstanding the above, using this IS does not constitute consent  #
# to PM, LE or CI investigative searching or monitoring of the content   #
# of privileged communications, or work product, related to personal     #
# representation or services by attorneys, psychotherapists, or clergy,  #
# and their assistants. Such communications and work product are private #
# and confidential. See User Agreement for details.                      #
##########################################################################
        
EOF


fi

#END_REMEDY
