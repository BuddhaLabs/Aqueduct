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
# Group ID (Vulid): RHEL-06-000344
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000344_rule
# Severity: low
# Rule Version (STIG-ID): RHEL-06-000344
# Rule Title: The system default umask in /etc/profile must be 077.
#
# Vulnerability Discussion: The umask value influences the permissions 
# assigned to files when they are created. A misconfigured umask value 
# could result in files with excessive permissions that can be read and/or 
# written to by unauthorized users.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Verify the "umask" setting is configured correctly in the 
# "/etc/profile" file by running the following command: 

# grep "umask" /etc/profile

# All output must show the value of "umask" set to 077, as shown in the 
# below: 

# grep "umask" /etc/profile
# umask 077


# If the above command returns no output, or if the umask is configured 
# incorrectly, this is a finding.
#
# Fix Text: 
#
# To ensure the default umask controlled by "/etc/profile" is set 
# properly, add or correct the "umask" setting in "/etc/profile" to read as 
# follows: 

# umask 077

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000344
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY
#END_REMEDY

