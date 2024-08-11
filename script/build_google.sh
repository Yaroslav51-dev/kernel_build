#!/bin/bash
cd $HOME/vayu/

export PLATFORM_VERSION=13
export ANDROID_MAJOR_VERSION=t

make -j$(nproc) -C 0=out mrproper
make -j$(nproc) -C CC=clang CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 LD=ld.lld AR=llvm-ar NM=llvm-nmOBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf OBJSIZE=llvm-size STRIP=llvm-strip LLVM_AR=llvm-ar LLVM_DIS=llvm-dis CROSS_COMPILE_ARM32=arm-linux-gnueabi- SUBARCH=arm64 LLVM=1 LLVM_IAS=1 DTC_EXT=dtc 0=out vayu_user_defconfig
make -j$(nproc) -C CC=clang CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 LD=ld.lld AR=llvm-ar NM=llvm-nmOBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf OBJSIZE=llvm-size STRIP=llvm-strip LLVM_AR=llvm-ar LLVM_DIS=llvm-dis CROSS_COMPILE_ARM32=arm-linux-gnueabi- SUBARCH=arm64 LLVM=1 LLVM_IAS=1 DTC_EXT=dtc 0=out
