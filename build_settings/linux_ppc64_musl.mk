############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu, giri@nwrk.biz)
# BUILD NOT TESTED AT ALL!
############################################################################
SETTINGS_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(SETTINGS_DIR)/build_settings/globals.mk

# Output settings for 3rd party libraries 
OUT_TARGET=linux_ppc64_musl
OUT_PREFIX=$(OUTDIR)/$(OUT_TARGET)
OUT_LIB=$(OUT_PREFIX)/lib
OUT_BIN=$(OUT_PREFIX)/bin
OUT_INCLUDE=$(OUT_PREFIX)/include

export LD_LIBRARY_PATH:=$(OUT_LIB)
export PATH:=$(OUT_BIN):$(PATH):.

# General compiler settings
GCC_HOST_PREFIX=x86_64-linux-gnu # GCC prefix for the architecture of this machine
GCC_PREFIX=powerpc64-linux-musl
GCC_PATH=$(OUT_BIN)/
ARCH_BIT=64

### FLAGS
DEFAULT_CFLAGS=-fPIC -static-libgcc -O3 -mabi=elfv1
DEFAULT_CXXFLAGS=-fPIC -static-libgcc -static-libstdc++ -O3 -mabi=elfv1
DEFAULT_LDFLAGS=--static -static-libgcc -static-libstdc++ -lpthread -ldl -mabi=elfv1

CFLAGS=-I$(OUT_INCLUDE) $(DEFAULT_CFLAGS)
CXXFLAGS=-I$(OUT_INCLUDE) $(DEFAULT_CXXFLAGS)
LDFLAGS=-L$(OUT_LIB) $(DEFAULT_LDFLAGS)
FFLAGS=-O3 -frecursive

### Meson related configs
CPU=ppc64
CPU_FAMILY=ppc64
ENDIAN=big
OS=linux
CUSTOM_MSN=

### Customize CFG/CMK
CUSTOM_CMK=-DCMAKE_SYSTEM_PROCESSOR=ppc64 -DCMAKE_SYSTEM_NAME=Linux -DCMAKE_C_FLAGS="$(CFLAGS) -D'__TBB_machine_fetchadd4(addr, val)=__sync_fetch_and_add(addr, val)'" -DCMAKE_CXX_FLAGS="$(CXXFLAGS) -D'__TBB_machine_fetchadd4(addr, val)=__sync_fetch_and_add(addr, val)'"
CUSTOM_CFG=

### Package Related CFG
OPENSSL_CFG=linux-ppc64
FFMPEG_CFG=--target-os=linux