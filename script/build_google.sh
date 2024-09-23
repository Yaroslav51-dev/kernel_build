#!/bin/bash
cd $HOME/kernel/
curl https://raw.githubusercontent.com/akhilnarang/scripts/master/setup/android_build_env.sh | bash -

make -s ARCH=arm64 O=out liuqin_defconfig -j$(nproc --all)
make -j$(nproc --all) O=out DTC_EXT=dtc ARCH=arm64 CC=clang CLANG_TRIPLE=aarch64-linux-gnu- CROSS_COMPILE=aarch64-linux-gnu-
