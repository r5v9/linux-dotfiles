#!/bin/bash

set -eux

(
    cd /tmp
    rm -rf hosts
    git clone https://github.com/StevenBlack/hosts
    cd hosts
    pip install -r requirements.txt
    python3 updateHostsFile.py --auto
    sudo cp hosts /etc/hosts
)