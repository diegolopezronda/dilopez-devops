# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
    # The most common configuration options are documented and commented below.
    # For a complete reference, please see the online documentation at
    # https://docs.vagrantup.com.

  config.vm.define "master" do |master|
    # Every Vagrant development environment requires a box. You can search for
    # boxes at https://vagrantcloud.com/search.
    master.vm.box = "ubuntu/focal64"
    master.vm.hostname = "dilopezmaster"

    # Disable automatic box update checking. If you disable this, then
    # boxes will only be checked for updates when the user runs
    # `vagrant box outdated`. This is not recommended.
    # config.vm.box_check_update = false

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # NOTE: This will enable public access to the opened port
    # config.vm.network "forwarded_port", guest: 80, host: 8080

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine and only allow access
    # via 127.0.0.1 to disable public access
    # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    # config.vm.network "private_network", ip: "192.168.33.10"

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    master.vm.network "public_network"

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    # config.vm.synced_folder "../data", "/vagrant_data"
    master.vm.synced_folder '.', '/vagrant', disabled: true

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    master.vm.provider "virtualbox" do |vb|
    #     # Display the VirtualBox GUI when booting the machine
    #     vb.gui = true
    #
    #     # Customize the amount of memory on the VM:
      vb.memory = "2048"
    end
    #
    # View the documentation for the provider you are using for more
    # information on available options.

    # Enable provisioning with a shell script. Additional provisioners such as
    # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
    # documentation for more information about their specific syntax and use.
    master.vm.provision "file", source: "./toolkit", destination: "/home/vagrant/toolkit"
    master.vm.provision "shell", inline: <<-SHELL
      apt update
      apt upgrade -y
      apt install -y build-essential sed openjdk-11-jdk wget vim git net-tools iptables ansible
      # ANSIBLE
      cp /home/vagrant/toolkit/ansible/ansible.cfg /etc/ansible/ansible.cfg
      # PUPPET
      # https://puppet.com/docs/puppet/7/server/install_from_packages.html
      wget https://apt.puppet.com/puppet7-release-focal.deb
      dpkg -i puppet7-release-focal.deb
      apt update
      apt-get install -y puppetserver
      cat /home/vagrant/toolkit/puppet.conf >> /etc/puppetlabs/puppet/puppet.conf 
      sed -i 's/Xms2g/Xms256m/g' /etc/default/puppetserver
      sed -i 's/Xmx2g/Xmx1g/g' /etc/default/puppetserver
      systemctl start puppetserver
      systemctl enable puppetserver
      # R10K
      echo "PATH=$PATH:/opt/puppetlabs/puppet/bin" >> /home/vagrant/.profile
      echo "PATH=$PATH:$HOME/bin" >> /home/vagrant/.profile
      source /home/vagrant/.profile	
      sed -i '/mesg/i PATH=$PATH:/opt/puppetlabs/puppet/bin' /root/.profile
      sed -i '/mesg/i PATH=$PATH:$HOME/bin' /root/.profile
      source /root/.profile	
      gem install r10k
      mkdir /etc/puppetlabs/r10k
      cp /home/vagrant/toolkit/r10k.yaml /etc/puppetlabs/r10k/r10k.yaml
    SHELL
  end

  config.vm.define "agent" do |agent|
    # Every Vagrant development environment requires a box. You can search for
    # boxes at https://vagrantcloud.com/search.
    agent.vm.box = "ubuntu/focal64"
    agent.vm.hostname = "dilopezagent"

    # Disable automatic box update checking. If you disable this, then
    # boxes will only be checked for updates when the user runs
    # `vagrant box outdated`. This is not recommended.
    # config.vm.box_check_update = false

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # NOTE: This will enable public access to the opened port
    # config.vm.network "forwarded_port", guest: 80, host: 8080

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine and only allow access
    # via 127.0.0.1 to disable public access
    # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    # config.vm.network "private_network", ip: "192.168.33.10"

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    agent.vm.network "public_network"

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    # config.vm.synced_folder "../data", "/vagrant_data"
    agent.vm.synced_folder '.', '/vagrant', disabled: true

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    # config.vm.provider "virtualbox" do |vb|
    #     # Display the VirtualBox GUI when booting the machine
    #     vb.gui = true
    #
    #     # Customize the amount of memory on the VM:
    #     vb.memory = "1024"
    # end
    #
    # View the documentation for the provider you are using for more
    # information on available options.

    # Enable provisioning with a shell script. Additional provisioners such as
    # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
    # documentation for more information about their specific syntax and use.
    agent.vm.provision "shell", inline: <<-SHELL
      apt update
      apt upgrade -y
      apt install -y build-essential openjdk-11-jdk wget vim git net-tools iptables
      # PUPPET
      # https://puppet.com/docs/puppet/7/install_agents.html
      wget https://apt.puppet.com/puppet7-release-focal.deb
      dpkg -i puppet7-release-focal.deb
      apt update
      apt install -y puppet-agent
      /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
      source /etc/profile.d/puppet-agent.sh
      export PATH=/opt/puppetlabs/bin:$PATH
      puppet config set server dilopezmaster --section main
    SHELL
  end
end
