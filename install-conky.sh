#!/bin/bash

set -eux

sudo apt install -y conky-all
ln -s $(pwd)/conkyrc ~/.conkyrc
mkdir -p ~/.config/autostart/
ln -s $(pwd)/conky.desktop ~/.config/autostart/conky.desktop