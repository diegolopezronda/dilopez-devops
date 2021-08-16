#!/bin/bash
rm -rf */.vagrant
cd master
vagrant up
cd ../agent
vagrant up
