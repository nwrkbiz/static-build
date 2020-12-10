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
export PATH:=$(OUT_BIN):$(PATH):.

### FLAGS
DEFAULT_CFLAGS=-m64 -fPIC -static-libgcc -O3 -D_WIN32 -D_WIN64 -DMINGW
DEFAULT_CXXFLAGS=-m64 -fPIC -static-libgcc -static-libstdc++ -O3  -D_WIN32 -D_WIN64 -DMINGW
DEFAULT_LDFLAGS=-m64 -static -static-libgcc -static-libstdc++ -lpthread

CFLAGS=-I$(OUT_INCLUDE) $(DEFAULT_CFLAGS)
CXXFLAGS=-I$(OUT_INCLUDE) $(DEFAULT_CXXFLAGS)
LDFLAGS=-L$(OUT_LIB) $(DEFAULT_LDFLAGS)
FFLAGS=-O3 -frecursive

### Meson related configs
CPU=x86_64
CPU_FAMILY=x86_64
ENDIAN=little
OS=windows
CUSTOM_MSN=

### Customize CFG/CMK
CUSTOM_CMK=-DCMAKE_SYSTEM_PROCESSOR=x86_64 -DWIN32=true  -D_WIN32=true -DWIN64=true -D_WIN64=true -DMINGW=true -DCMAKE_SYSTEM_NAME=Windows -DCMAKE_RC_COMPILER=$(GCC_PATH)/$(GCC_PREFIX)-windres -DHB_HAVE_UNISCRIBE=true -DHAVE_MMAP=false -DHAVE_STRTOD_L=false
CUSTOM_CFG=GCC_WINDRES=$(GCC_PATH)/$(GCC_PREFIX)-windres WINDRES=$(GCC_PATH)/$(GCC_PREFIX)-windres LIBS="-lssp -lusp10 -lole32 -luuid -lcomctl32 -lwsock32 -lws2_32 -lksuser -lwinmm -lrpcrt4 -lcrypt32 -lgdi32"

### Package Related CFG
OPENSSL_CFG=mingw64