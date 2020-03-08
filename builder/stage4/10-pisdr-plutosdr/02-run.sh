#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Radios"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Radios"

if [ ! -d "gr-iio" ]; then
    git clone https://github.com/analogdevicesinc/gr-iio
fi

cd gr-iio
mkdir -p build
cd build
cmake ../ -DINSTALL_UDEV_RULE=ON
make -j$(nproc) install
ldconfig
EOF