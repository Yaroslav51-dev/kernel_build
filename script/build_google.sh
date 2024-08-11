#!/bin/bash
cd $HOME/vayu/
rm -r /out
sudo apt-get update
sudo apt-get install -y curl git ftp lftp wget libarchive-tools ccache python2 python2-dev python3
sudo apt-get install -y pngcrush schedtool dpkg-dev liblz4-tool make optipng maven device-tree-compiler 
sudo apt-get install -y libc6-dev-i386 lib32ncurses5-dev libx11-dev lib32z-dev libgl1-mesa-dev xsltproc
sudo apt-get install -y libxml2-utils libbz2-dev libbz2-1.0 libghc-bzlib-dev squashfs-tools lzop flex tree
sudo apt-get install -y build-essential bc gcc-aarch64-linux-gnu gcc-arm-linux-gnueabi libssl-dev libfl-dev
sudo apt-get install -y pwgen libswitch-perl policycoreutils minicom libxml-sax-base-perl libxml-simple-perl 
sudo apt-get install -y zip unzip tar gzip bzip2 rar unrar llvm g++-multilib bison gperf zlib1g-dev automake

export PLATFORM_VERSION=13
export ANDROID_MAJOR_VERSION=t

make -j$(nproc) -C 0=out mrproper
make -j$(nproc) -C CC=clang CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 LD=ld.lld AR=llvm-ar NM=llvm-nmOBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf OBJSIZE=llvm-size STRIP=llvm-strip LLVM_AR=llvm-ar LLVM_DIS=llvm-dis CROSS_COMPILE_ARM32=arm-linux-gnueabi- SUBARCH=arm64 LLVM=1 LLVM_IAS=1 DTC_EXT=dtc 0=out vayu_user_defconfig
make -j$(nproc) -C CC=clang CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 LD=ld.lld AR=llvm-ar NM=llvm-nmOBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf OBJSIZE=llvm-size STRIP=llvm-strip LLVM_AR=llvm-ar LLVM_DIS=llvm-dis CROSS_COMPILE_ARM32=arm-linux-gnueabi- SUBARCH=arm64 LLVM=1 LLVM_IAS=1 DTC_EXT=dtc 0=out
