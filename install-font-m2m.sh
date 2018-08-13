#!/bin/bash

cd /tmp
wget "https://osdn.net/frs/redir.php?m=pumath&f=mplus-fonts%2F62344%2Fmplus-TESTFLIGHT-063.tar.xz"
tar xf mplus-TESTFLIGHT-063.tar.xz
mkdir -p ~/.fonts
cp mplus-TESTFLIGHT-063/mplus-2m* ~/.fonts

fc-cache -fv