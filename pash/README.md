# try-me pash
Try PowerShell in Ubuntu

## Overview
This project lets you try out the
[Pash shell](https://github.com/Pash-Project/Pash) using Vagrant. The
interactive user's shell is changed from bash to Pash.
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

You should now be logged into the machine running PowerShell.
