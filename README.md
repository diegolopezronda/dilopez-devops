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

![Modules](docs/images/modules.svg)

* The APT packages are provisioned on each Vagrant file.

## Installation ##

### First Steps ###
Each step asumes you are in the repository root directory.

* Start the Tools virtual machine with :
  * `cd tools; vagrant up` 
* Start the Agent virtual machine with :
  * `cd puppet; vagrant up` 
