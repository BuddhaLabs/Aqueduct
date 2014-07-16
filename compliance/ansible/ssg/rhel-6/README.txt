Harden Role
===========

Ansible-based method to harden a system to meet requirements from Security
Content Automation Protocol (SCAP, see
https://fedorahosted.org/scap-security-guide/). Most items covered 
n the SCAP oscap profile "Upstream STIG for RHEL 6 Server"
(stig-rhel6-server-upstream) are configured.

This is an Ansible role for use in a playbook, similar to idea of Chef
cookbooks.  See http://www.ansible.com/home for information on Ansible.
Recommend using Ansible 1.6 or later.

Initial target is RedHat Enterprise Linux 6.x (RHEL 6.x) based  systems. Centos
6.x systems are addressed the same. Provisions are in place to address Debian-based
systems in future versions and other RHEL versions.

No warranty of any kind is implied, use at your own risk and responsibility.



---
Copyright (C) 2014 Bill Carlson http://apgtm.com/
