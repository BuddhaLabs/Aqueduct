#!/bin/bash

##########################################################################
#Aqueduct - Compliance Remediation Content
#Copyright (C) 2011,2012  
#  Vincent C. Passaro (vincent.passaro@gmail.com)
#  Shannon Mitchell (shannon.mitchell@fusiontechnology-llc.com)
#
#This program is free software; you can redistribute it and/or
#modify it under the terms of the GNU General Public License
#as published by the Free Software Foundation; either version 2
#of the License, or (at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program; if not, write to the Free Software
#Foundation, Inc., 51 Franklin Street, Fifth Floor,
#Boston, MA  02110-1301, USA.
##########################################################################

###################### Fotis Networks LLC ###############################
# By Vincent C. Passaro                                                 #
# Fotis Networks LLC	                                                #
# Vincent[.]Passaro[@]fotisnetworks[.]com                               #
# www.fotisnetworks.com	                                                #
###################### Fotis Networks LLC ###############################
#
#  _____________________________________________________________________
# |  Version |   Change Information  |      Author        |    Date    |
# |__________|_______________________|____________________|____________|
# |    1.0   |   Initial Script      | Vincent C. Passaro | 1-Aug-2012 |
# |          |   Creation            |                    |            |
# |__________|_______________________|____________________|____________|
#	                                                                  
   
	
#######################DISA INFORMATION##################################
# Group ID (Vulid): V-4250
# Group Title: GEN008720
# Rule ID: SV-37942r1_rule
# Severity: medium
# Rule Version (STIG-ID): GEN008720
# Rule Title: The system's boot loader configuration file(s) must have 
# mode 0600 or less permissive.
#
# Vulnerability Discussion: File permissions greater than 0600 on boot 
# loader configuration files could allow an unauthorized user to view or 
# modify sensitive information pertaining to system boot instructions.
#
# Responsibility: System Administrator
# IAControls: ECLP-1
#
# Check Content:
#
# Check /boot/grub/grub.conf permissions:

# ls -lL /boot/grub/grub.conf

# If /boot/grub/grub.conf has a mode more permissive than 0600, then this 
# is a finding.

# For any bootloader other than GRUB which has been authorized, justified 
# and documented for use on the system refer to the vendor documentation 
# for the locatioin of the configuration file. If the bootloader 
# configuration file has a mode more permissive than 0600, this is a 
# finding.


#
# Fix Text: 
#
# Change the mode of the grub.conf file to 0600.

# chmod 0600 /boot/grub/grub.conf     
#######################DISA INFORMATION##################################
	
# Global Variables
PDI=GEN008720
	
# Start-Lockdown

if [ -a "/boot/grub/grub.conf" ]
  then

    # Pull the actual permissions
    FILEPERMS=`stat -L --format='%04a' /boot/grub/grub.conf`

    # Break the actual file octal permissions up per entity
    FILESPECIAL=${FILEPERMS:0:1}
    FILEOWNER=${FILEPERMS:1:1}
    FILEGROUP=${FILEPERMS:2:1}
    FILEOTHER=${FILEPERMS:3:1}

    # Run check by 'and'ing the unwanted mask(7177)
    if [ $(($FILESPECIAL&7)) != "0" ] || [ $(($FILEOWNER&1)) != "0" ] || [ $(($FILEGROUP&7)) != "0" ] || [ $(($FILEOTHER&7)) != "0" ]
      then
        chmod u-xs,g-rwxs,o-rwxt /boot/grub/grub.conf
    fi
fi
