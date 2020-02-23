############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu, giri@nwrk.biz)
############################################################################
SETTINGS_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(SETTINGS_DIR)/build_settings/globals.mk

# General compiler settings
GCC_HOST_PREFIX=x86_64-linux-gnu # GCC prefix for the architecture of this machine
GCC_PREFIX=x86_64-linux-gnu
GCC_PATH=/usr/bin
ARCH_BIT=64

# Output settings for 3rd party libraries 
OUT_TARGET=linux_x86_64_gnu
OUT_PREFIX=$(OUTDIR)/$(OUT_TARGET)
OUT_LIB=$(OUT_PREFIX)/lib
OUT_BIN=$(OUT_PREFIX)/bin
OUT_INCLUDE=$(OUT_PREFIX)/include

export LD_LIBRARY_PATH:=$(OUT_LIB)

### FLAGS
DEFAULT_CFLAGS=-m64 -fPIC -static-libgcc -O3
DEFAULT_CXXFLAGS=-m64 -fPIC -static-libgcc -static-libstdc++ -O3
DEFAULT_LDFLAGS=-m64 -static -static-libgcc -static-libstdc++ -lpthread -ldl

CFLAGS=-I$(OUT_INCLUDE) $(DEFAULT_CFLAGS)
CXXFLAGS=-I$(OUT_INCLUDE) $(DEFAULT_CXXFLAGS)
LDFLAGS=-L$(OUT_LIB) $(DEFAULT_LDFLAGS)
FFLAGS=-O3 -frecursive

### Customize CFG/CMK
CUSTOM_CMK=
CUSTOM_CFG=

### Package Related CFG
OPENSSL_CFG=linux-x86_64