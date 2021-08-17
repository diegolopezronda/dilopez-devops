#!/bin/bash
vagrant destroy -f
rm -rf .vagrant
vagrant up
vagrant ssh master -c "sudo ansible-playbook /home/vagrant/toolkit/ansible/playbooks/puppetagent.yaml"
