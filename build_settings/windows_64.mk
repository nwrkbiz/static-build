############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu, giri@nwrk.biz)
############################################################################
SETTINGS_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(SETTINGS_DIR)/build_settings/globals.mk

# General compiler settings
GCC_HOST_PREFIX=x86_64-linux-gnu # GCC prefix for the architecture of this machine
GCC_PREFIX=x86_64-w64-mingw32
GCC_PATH=/usr/bin
ARCH_BIT=64

# Output settings for 3rd party libraries 
OUT_TARGET=windows_64
OUT_PREFIX=$(OUTDIR)/$(OUT_TARGET)
OUT_LIB=$(OUT_PREFIX)/lib
OUT_BIN=$(OUT_PREFIX)/bin
OUT_INCLUDE=$(OUT_PREFIX)/include

export LD_LIBRARY_PATH=$(OUT_LIB)

### FLAGS
DEFAULT_CFLAGS=-fPIC -static-libgcc -O3
DEFAULT_CXXFLAGS=-fPIC -static-libgcc -static-libstdc++ -O3
DEFAULT_LDFLAGS=-static -static-libgcc -static-libstdc++ -lpthread

CFLAGS=-I$(OUT_INCLUDE) $(DEFAULT_CFLAGS)
CXXFLAGS=-I$(OUT_INCLUDE) $(DEFAULT_CXXFLAGS)
LDFLAGS=-L$(OUT_LIB) $(DEFAULT_LDFLAGS)
FFLAGS=-O3 -frecursive

### Customize CFG/CMK
CUSTOM_CMK=-DWIN32=true -D_WIN32=true -DMINGW=true -DCMAKE_SYSTEM_NAME=Windows -DCMAKE_RC_COMPILER=$(GCC_PATH)/$(GCC_PREFIX)-windres
CUSTOM_CFG=GCC_WINDRES=$(GCC_PATH)/$(GCC_PREFIX)-windres WINDRES=$(GCC_PATH)/$(GCC_PREFIX)-windres

### Package Related CFG
OPENSSL_CFG=mingw64