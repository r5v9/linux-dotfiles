#!/bin/bash

set -eux

VERSION="3.7.0"

sudo apt-get install -y build-essential checkinstall \
    libreadline-gplv2-dev libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev \
    libffi-dev

mkdir -p ~/tmp
(
    cd ~/tmp
    rm -rf Python-${VERSION}*
    wget https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz
    tar xfz Python-${VERSION}.tgz
    cd Python-${VERSION}

    sudo rm -rf /usr/local/python/${VERSION}
    ./configure --prefix=/usr/local/python/${VERSION} --enable-optimizations
    make && sudo make install

)

mkdir -p $HOME/.virtualenvs
rm -f $HOME/.virtualenvs/python3bin/pip3 install virtualenv
sudo /usr/local/python/${VERSION}/bin/pip3 install virtualenv
/usr/local/python/${VERSION}/bin/virtualenv --python=/usr/local/python/${VERSION}/bin/python3 $HOME/.virtualenvs/python3