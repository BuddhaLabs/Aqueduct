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
# Group ID (Vulid): RHEL-06-000286
# Group Title: SRG-OS-999999
#
   
# Rule ID: RHEL-06-000286_rule
# Severity: high
# Rule Version (STIG-ID): RHEL-06-000286
# Rule Title: The x86 Ctrl-Alt-Delete key sequence must be disabled.
#
# Vulnerability Discussion: A locally logged-in user who presses 
# Ctrl-Alt-Delete, when at the console, can reboot the system. If 
# accidentally pressed, as could happen in the case of mixed OS 
# environment, this can create the risk of short-term loss of availability 
# of systems due to unintentional reboot. In the GNOME graphical 
# environment, risk of unintentional reboot from the Ctrl-Alt-Delete 
# sequence is reduced because the user will be prompted before any action 
# is taken.
#
# Responsibility: 
# IAControls: 
#
# Check Content:
#
# Determine what actions the system takes when the Ctrl-Alt-Delete key 
# sequence is pressed, run the following command:

#  cat `grep -l control-alt-delete /etc/init/*`

# Examine all lines following the "start on control-alt-delete" line in any 
# files found.  By default, the system uses 
# "/etc/init/control-alt-delete.conf" to reboot the system with the 
# following command when the Ctrl-Alt-Delete key sequence is pressed: 

# exec /sbin/shutdown -r now "Control-Alt-Delete pressed"

# If the system is configured to run any shutdown command, this is a 
# finding.
#
# Fix Text: 
#
# Configure the system to log a message instead of rebooting the system 
# by altering the "shutdown" line in "/etc/init/control-alt-delete.conf" to 
# read as follows: 

# exec /usr/bin/logger -p security.info "Ctrl-Alt-Delete pressed"

  
#######################DISA INFORMATION##################################
#	
# Global Variables
PDI=RHEL-06-000286
#
#BEGIN_CHECK

. ./aqueduct_functions
DOES_SHUTDOWN=`grep -l '^exec /sbin/shutdown' /etc/init/* | grep -v $PDI | wc -l`

#END_CHECK
#BEGIN_REMEDY

DATE=`date +%Y-%j`

if [ $DOES_SHUTDOWN -ne 0 ]
then
	for i in `grep -l '^exec /sbin/shutdown' /etc/init/* | grep -v $PDI`
	do
		cp $i ${i}.${DATE}.${PDI}
		copy_perms $i ${i}.${DATE}.${PDI}
		grep -v '^exec /sbin/shutdown' ${i}.${DATE}.${PDI} >  $i
		echo "# Fixed: $PDI" >> $i
		echo 'exec /usr/bin/logger -p security.info "Ctrl-Alt-Delete pressed"' >> $i
		copy_perms  ${i}.${DATE}.${PDI} $i
	done
fi
	
#END_REMEDY

