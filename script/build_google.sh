#!/bin/bash
cd $HOME/vayu/
sudo apt-get update
sudo apt-get install -y curl git ftp lftp wget libarchive-tools ccache python2 python2-dev python3
sudo apt-get install -y pngcrush schedtool dpkg-dev liblz4-tool make optipng maven device-tree-compiler 
sudo apt-get install -y libc6-dev-i386 lib32ncurses5-dev libx11-dev lib32z-dev libgl1-mesa-dev xsltproc
sudo apt-get install -y libxml2-utils libbz2-dev libbz2-1.0 libghc-bzlib-dev squashfs-tools lzop flex tree
sudo apt-get install -y build-essential bc gcc-aarch64-linux-gnu gcc-arm-linux-gnueabi libssl-dev libfl-dev
sudo apt-get install -y pwgen libswitch-perl policycoreutils minicom libxml-sax-base-perl libxml-simple-perl 
sudo apt-get install -y zip unzip tar gzip bzip2 rar unrar llvm g++-multilib bison gperf zlib1g-dev automake
export KBUILD_BUILD_HOST=Yaroslavkryt
export KBUILD_BUILD_USER=t.me

make -s ARCH=arm64 O=out vayu_user_defconfig -j$(nproc --all) SUBARCH=arm64
make -j$(nproc --all) O=out ARCH=arm64 SUBARCH=arm64 LLVM=1 LLVM_IAS=1 DTC_EXT=dtc REAL_CC=clang CLANG_TRIPLE="aarch64-linux-gnu-" CROSS_COMPILE="aarch64-linux-gnu-" CROSS_COMPILE_ARM32="arm-linux-gnueabi-"
