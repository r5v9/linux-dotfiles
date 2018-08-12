#!/bin/bash

set -eux

echo oracle-java10-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

sudo add-apt-repository ppa:linuxuprising/java
sudo apt update
sudo apt install -y oracle-java10-installer
sudo apt install -y oracle-java10-set-default