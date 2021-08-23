#!/bin/bash
# Destroy existent virtual machine
vagrant destroy -f
# Remove left-overs
rm -rf .vagrant
# Create virtual machine
vagrant up
