# Dilopez DevOps #
This repo contains an Ubuntu 20.04 LTS Vagrantfile provisioned with:

* Ansible
* Git
* Vim 
  * Tab spacing
  * Highlights line 80
  * Shows line numbers
  * Molokai as color scheme
* Docker
* Docker Compose

The installation of these tools is scripted as ansible playbooks, so Ansible is
provided first by the Vagrantfile and then Ansible takes over.

## Virtual Machine Environment Instructions ##

### System Requirements ###
* Virtualization-enabled CPU
* 1GB RAM available for virtualization

### Dependencies ###
* VirtualBox
* Vagrant 

### Installation ###
* Please run `./install.sh` to install the application. 
  Note this will start a clean installation.
* Then access the virtual machine with `vagrant ssh`
