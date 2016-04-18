# try-me oracle-11g
Try Oracle 11g
## Overview
This project implements a test database using the code from
[Oracle Database puppet module](https://github.com/biemond/biemond-oradb) and Vagrant.
## Usage
Install
[Vagrant(https://www.vagrantup.com/downloads.html) and ensure you have a
working
[Vagrant provider](https://docs.vagrantup.com/v2/getting-started/providers.html)
such as [VirtualBox](https://www.virtualbox.org/).
You also need the Oracle 11g installation files. Specifically, you need to download
the two zip files for version 11.2.0.1 from
[here](http://www.oracle.com/technetwork/database/enterprise-edition/downloads/112010-linx8664soft-100572.html)
(registration required) and place them in the sources directory. Then run the following commands:
````bash
# Start and provision vagrant environment
vagrant up
# Log into vagrant machine
vagrant ssh

You should now be connected to a test database with the sqlplus interactive tool.
