#!/bin/bash

set -eux

echo "deb http://repo.sinew.in/ stable main" | sudo tee /etc/apt/sources.list.d/enpass.list > /dev/null

wget -O - https://dl.sinew.in/keys/enpass-linux.key | sudo apt-key add -

sudo apt-get update
sudo apt-get install enpass