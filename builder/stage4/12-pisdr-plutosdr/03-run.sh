#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PlutoSDR"
cd 		    "/home/${FIRST_USER_NAME}/PlutoSDR"

if [ ! -d "SoapyPlutoSDR" ]; then
    git clone https://github.com/pothosware/SoapyPlutoSDR.git
fi

cd SoapyPlutoSDR
mkdir -p build
cd build
cmake -DCMAKE_CXX_FLAGS=-latomic ../
make -j$(nproc) install
ldconfig
EOF