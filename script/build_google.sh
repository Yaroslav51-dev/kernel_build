#!/bin/bash
cd $HOME/vayu/

export PLATFORM_VERSION=13
export ANDROID_MAJOR_VERSION=t

ARGS="
CC=clang
CROSS_COMPILE=aarch64-linux-gnu-
ARCH=arm64
LD=ld.lld
AR=llvm-ar
NM=llvm-nm
OBJCOPY=llvm-objcopy
OBJDUMP=llvm-objdump
READELF=llvm-readelf
OBJSIZE=llvm-size
STRIP=llvm-strip
LLVM_AR=llvm-ar
LLVM_DIS=llvm-dis
CROSS_COMPILE_ARM32=arm-linux-gnueabi-
ARCH=arm64
SUBARCH=arm64
LLVM=1
LLVM_IAS=1
DTC_EXT=dtc
"

make -j$(nproc) -C O=$HOME/out ${ARGS} clean && make -j8 -C O=$HOME/out ${ARGS} mrproper
make -j$(nproc) -C O=$HOME/out ${ARGS} vayu_user_defconfig
make -j$(nproc) -C O=$HOME/out ${ARGS}
