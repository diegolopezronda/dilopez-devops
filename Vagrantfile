# -*- mode: ruby -*-
# vi: set ft=ruby :
# https://docs.vagrantup.com
Vagrant.configure("2") do |config|
  # This is a Virtual Machine called master
  config.vm.define "master" do |master|
    # The image we are implementing is Ubuntu 20.04 LTS
    master.vm.box = "ubuntu/focal64"
    # The hostname is dilopezmaster
    master.vm.hostname = "dilopezmaster"
    # We want to have internet connection
    master.vm.network "public_network"
    # We don't want to use VirtualBox guest aditions.
    master.vm.synced_folder '.', '/vagrant', disabled: true
    # The RAM of the Virtual Machine is 1Gb
    master.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
    end
    # The directory toolchain of the repository will be copied 
    # to the home of the  of the virtual machine
    master.vm.provision "file", 
      source: "./toolchain", 
      destination: "/home/vagrant/toolchain"
    # Provision your machine here
    # You can use shell commands like apt, cd, mv, mkdir, etc.
    master.vm.provision "shell", inline: <<-SHELL
      # Your commands here
    SHELL
  end
end
