#!/bin/bash

(
    cd /tmp
    wget https://julialang-s3.julialang.org/bin/linux/x64/1.0/julia-1.0.0-linux-x86_64.tar.gz
    tar xfz julia-1.0.0-linux-x86_64.tar.gz
    sudo mv julia-1.0.0 /usr/local/julia
)
