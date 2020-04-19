############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu, giri@nwrk.biz)
############################################################################
SETTINGS_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(SETTINGS_DIR)/build_settings/globals.mk

# Output settings for 3rd party libraries 
OUT_TARGET=linux_mipsel_musl
OUT_PREFIX=$(OUTDIR)/$(OUT_TARGET)
OUT_LIB=$(OUT_PREFIX)/lib
OUT_BIN=$(OUT_PREFIX)/bin
OUT_INCLUDE=$(OUT_PREFIX)/include

export LD_LIBRARY_PATH:=$(OUT_LIB)
export PATH:=$(OUT_BIN):$(PATH)

# General compiler settings
GCC_HOST_PREFIX=x86_64-linux-gnu # GCC prefix for the architecture of this machine
GCC_PREFIX=mipsel-linux-musl
GCC_PATH=$(OUT_BIN)/
ARCH_BIT=32

### FLAGS
DEFAULT_CFLAGS=-fPIC -O3 -D__MIPSEL__
DEFAULT_CXXFLAGS=-fPIC -static-libstdc++ -O3 -D__MIPSEL__
DEFAULT_LDFLAGS=-static -static-libstdc++ -lpthread -ldl

CFLAGS=-I$(OUT_INCLUDE) $(DEFAULT_CFLAGS)
CXXFLAGS=-I$(OUT_INCLUDE) $(DEFAULT_CXXFLAGS)
LDFLAGS=-L$(OUT_LIB) $(DEFAULT_LDFLAGS)
FFLAGS=-O3 -frecursive

### Customize CFG/CMK
CUSTOM_CMK=-DCMAKE_C_FLAGS="$(CFLAGS) -march=mips32 -D'__TBB_machine_fetchadd4(addr, val)=__sync_fetch_and_add(addr, val)'" -DCMAKE_CXX_FLAGS="$(CXXFLAGS) -march=mips32 -D'__TBB_machine_fetchadd4(addr, val)=__sync_fetch_and_add(addr, val)'"
CUSTOM_CFG=

### Package Related CFG
OPENSSL_CFG=linux-mips32