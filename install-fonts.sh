#!/bin/bash

set -eux

sudo apt install -y ttf-mscorefonts-installer
sudo apt install -y fonts-open-sans
sudo apt install -y ttf-anonymous-pro 

cd /tmp
wget "https://osdn.net/frs/redir.php?m=pumath&f=mplus-fonts%2F62344%2Fmplus-TESTFLIGHT-063.tar.xz" -O mplus-TESTFLIGHT-063.tar.xz
tar xf mplus-TESTFLIGHT-063.tar.xz
mkdir -p ~/.fonts
cp mplus-TESTFLIGHT-063/mplus-2m* ~/.fonts

fc-cache -fv
