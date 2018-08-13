#!/bin/bash

set -eux

sudo apt install -y conky-all
cp conkyrc ~/.conkyrc
mkdir -p ~/.config/autostart/
cp start-conky.desktop ~/.config/autostart/