#!/bin/bash

set -eux

cd /tmp
# rm -rf ideaIC*
# wget https://download-cf.jetbrains.com/idea/ideaIC-2018.2.1.tar.gz
# tar xfz ideaIC-2018.2.1.tar.gz

sudo rm -rf /usr/local/intellij
sudo mv /tmp/idea-IC-182.3911.36 /usr/local/intellij

/usr/local/intellij/bin/idea.sh
