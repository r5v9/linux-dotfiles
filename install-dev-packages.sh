#!/bin/bash

sudo apt install -y build-essential libc6-dev linux-source linux-headers-`uname -r` \
    libgdbm-dev zlib1g-dev libbz2-dev libsqlite3-dev libssl-dev openssl \
    libtk8.5 tk-dev libgdm-dev libdb4o-cil-dev libpcap-dev \
    libreadline-gplv2-dev libncurses5-dev libncursesw5-dev \
    libxml2-dev libxml2-utils libxslt-dev zlib1g-dev

sudo apt install -y libopencv-apps-dev libopencv-calib3d-dev libopencv-contrib-dev libopencv-core-dev libopencv-dev \
    libopencv-features2d-dev libopencv-flann-dev libopencv-highgui-dev libopencv-imgcodecs-dev \
    libopencv-imgproc-dev libopencv-ml-dev libopencv-objdetect-dev libopencv-photo-dev \
    libopencv-shape-dev libopencv-stitching-dev libopencv-superres-dev libopencv-ts-dev \
    libopencv-video-dev libopencv-videoio-dev libopencv-videostab-dev libopencv-viz-dev


