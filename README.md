# Dilopez DevOps #
This repo contains an Ubuntu 20.04 LTS Vagrantfile provisioned with:

* Ansible
* Rundeck
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
* 4GB RAM available for virtualization

### Dependencies ###
* VirtualBox
* Vagrant 

### Installation ###
* Please run `./install.sh` to install the application. 
  Note this will start a clean installation.
* Then access the virtual machine with `vagrant ssh`

## Important files and directories ##
After installing the application, use the following directories to customize your 
installation.

| Directory                              | Description                                                                            |
|----------------------------------------|----------------------------------------------------------------------------------------|
| /etc/rundeck/rundeck-config.properties | Change `grails.serverURL` to update the Rundeck URL.                                   |
| /etc/ansible/hosts                     | Add master nodes and server nodes here, they will be automatically updated on Rundeck. |
| /opt/dilopez-devops                    | Contains a copy of the repository.                                                     |

## Ports ##

| Application | Port |
|-------------|------|
| Rundeck     | 4440 |
