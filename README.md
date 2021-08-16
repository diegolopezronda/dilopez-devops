#  Dilopez DevOps #
This repository provides tools for testing, building, packaging, provisioning 
and orchestrating software as well as monitoring infrastructure.

## System Requirements ## 

* Unix based operating system
* 8GB RAM
* Virtualization-enabled CPU
* SSH key configured

## Dependencies ##
This development is meant to be deployed on a local machine with the following 
software installed:

* VirtualBox
* Vagrant 

## Tools ## 
The following diagrams shows the different tools included and how they are 
distributed.

![Modules](/docs/images/tools.svg)

* The APT packages are provisioned on each Vagrant file.

## Installation ##

### Installing Virtual Machines ###
From the repository root directory run:
  * `./install.sh` 

#### Notes #####
* You may need to choose your bridged network interface for both virtual machines.
* Don't worry about this error:
```
Vagrant was unable to mount VirtualBox shared folders. This is usually
because the filesystem "vboxsf" is not available. This filesystem is
made available via the VirtualBox Guest Additions and kernel module.
Please verify that these guest additions are properly installed in the
guest. This is not a bug in Vagrant and is usually caused by a faulty
Vagrant box. For context, the command attempted was:

mount -t vboxsf -o uid=1000,gid=1000,_netdev vagrant /vagrant

The error output from the command was:

/sbin/mount.vboxsf: mounting failed with the error: Invalid argument
```

