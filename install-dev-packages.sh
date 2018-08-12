#!/bin/bash

sudo apt install -y build-essential libc6-dev linux-source linux-headers-`uname -r` \
    libgdbm-dev zlib1g-dev libbz2-dev libsqlite3-dev libssl-dev openssl \
    libtk8.5 tk-dev libgdm-dev libdb4o-cil-dev libpcap-dev \
    libreadline-gplv2-dev libncurses5-dev libncursesw5-dev
