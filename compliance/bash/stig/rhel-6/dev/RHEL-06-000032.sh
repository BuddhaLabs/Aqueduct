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
# Group ID (Vulid): RHEL-06-000032
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000032_rule
# Severity: medium
# Rule Version (STIG-ID): RHEL-06-000032
# Rule Title: The root account must be the only account having a UID of 0.
#
# Vulnerability Discussion: An account has root authority if it has a UID 
# of 0. Multiple accounts with a UID of 0 afford more opportunity for 
# potential intruders to guess a password for a privileged account. Proper 
# configuration of sudo is recommended to afford multiple system 
# administrators access to root privileges in an accountable manner.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# To list all password file entries for accounts with UID 0, run the 
# following command: 

# awk -F: '($3 == "0") {print}' /etc/passwd

# This should print only one line, for the user root. 
# If any account other than root has a UID of 0, this is a finding.
#
# Fix Text: 
#
# If any account other than root has a UID of 0, this misconfiguration 
# should be investigated and the accounts other than root should be removed 
# or have their UID changed.  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000032
#
#BEGIN_CHECK
#END_CHECK
#BEGIN_REMEDY

ROOTACCOUNTLIST=`awk -F ':' '!/^root/{if($3 == 0)print $1}' /etc/passwd`
if [ "$ROOTACCOUNTLIST" != "" ]
then
  echo "------------------------------" > $PDI-ROOTACCOUNTS.log
  date >> $PDI-ROOTACCOUNTS.log
  echo " " >> $PDI-ROOTACCOUNTS.log
  echo "The following accounts are sharing the UID 0" >> $PDI-ROOTACCOUNTS.log
  echo " " >> $PDI-ROOTACCOUNTS.log
  echo $ROOTACCOUNTLIST >> $PDI-ROOTACCOUNTS.log
  echo "------------------------------" >> $PDI-ROOTACCOUNTS.log
fi


#END_REMEDY

