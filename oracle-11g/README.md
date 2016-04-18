# try-me oracle-11g
Try Oracle 11g
## Overview
This project implements a test database using the code from
[Oracle Database puppet module](https://github.com/biemond/biemond-oradb) and Vagrant.
## Usage
Install
[Vagrant](https://www.vagrantup.com/downloads.html) and ensure you have a
working
[Vagrant provider](https://docs.vagrantup.com/v2/getting-started/providers.html)
such as [VirtualBox](https://www.virtualbox.org/). Then run the following
commands:
````bash
# Start and provision vagrant environment
vagrant up
# Log into vagrant machine
vagrant ssh
