#!/bin/bash

set -eux

sudo apt install -y zsh fasd

chsh -s /bin/zsh

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

mkdir -p ~/.zsh
cd ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/olivierverdier/zsh-git-prompt

git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh

rm $HOME/.zshrc
ln -s $(pwd)/zshrc $HOME/.zshrc