#!/bin/bash

set -eux

# sudo apt install -y neovim

mkdir -p ~/.config/nvim/
ln -s $(pwd)/init.vim ~/.config/nvim/init.vim