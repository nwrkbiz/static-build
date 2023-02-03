############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu, giri@nwrk.biz)
############################################################################
SETTINGS_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(SETTINGS_DIR)/build_settings/globals.mk

# Output settings for 3rd party libraries 
OUT_TARGET=windows_64
OUT_PREFIX=$(OUTDIR)/$(OUT_TARGET)
OUT_LIB=$(OUT_PREFIX)/lib
OUT_BIN=$(OUT_PREFIX)/bin
OUT_INCLUDE=$(OUT_PREFIX)/include

export LD_LIBRARY_PATH=$(OUT_LIB)
export PATH:=$(OUT_BIN):$(PATH):.

# General compiler settings
COMPILER_HOST_PREFIX=x86_64-linux-gnu # GCC prefix for the architecture of this machine
COMPILER_PREFIX=x86_64-w64-mingw32
COMPILER_PATH=/usr/bin
ARCH_BIT=64

FC=$(COMPILER_PREFIX)-gfortran
CC=$(COMPILER_PREFIX)-gcc
CXX=$(COMPILER_PREFIX)-g++
AR=$(COMPILER_PREFIX)-ar
LD=$(COMPILER_PREFIX)-ld
NM=$(COMPILER_PREFIX)-nm
LDSHARED=$(COMPILER_PREFIX)-ld
RANLIB=$(COMPILER_PREFIX)-ranlib
STRIP=$(COMPILER_PREFIX)-strip
SIZE=$(COMPILER_PREFIX)-size
OBJCOPY=$(COMPILER_PREFIX)-objcopy
OBJDUMP=$(COMPILER_PREFIX)-objdump
READELF=$(COMPILER_PREFIX)-readelf
WINDRES=$(COMPILER_PREFIX)-windres

### FLAGS
DEFAULT_CFLAGS=-m64 -fPIC -static-libgcc -O3 -D_WIN32 -D_WIN64 -DMINGW
DEFAULT_CXXFLAGS=-m64 -fPIC -static-libgcc -static-libstdc++ -O3  -D_WIN32 -D_WIN64 -DMINGW
DEFAULT_LDFLAGS=-m64 --static -static-libgcc -static-libstdc++ -lpthread

CFLAGS=-I$(OUT_INCLUDE) $(DEFAULT_CFLAGS)
CXXFLAGS=-I$(OUT_INCLUDE) $(DEFAULT_CXXFLAGS)
LDFLAGS=-L$(OUT_LIB) $(DEFAULT_LDFLAGS)
FFLAGS=-O3 -frecursive

### Meson related configs
CPU=x86_64
CPU_FAMILY=x86_64
ENDIAN=little
OS=windows
MSN_CMD=meson
CUSTOM_MSN=

### Customize CFG/CMK
MAK_CMD=make
CMK_CMD=cmake
CFG_CMD=configure
CUSTOM_CMK=-DCMAKE_SYSTEM_PROCESSOR=x86_64 -DWIN32=true  -D_WIN32=true -DWIN64=true -D_WIN64=true -DMINGW=true -DCMAKE_SYSTEM_NAME=Windows -DCMAKE_RC_COMPILER=$(COMPILER_PATH)/$(WINDRES) -DHB_HAVE_UNISCRIBE=true -DHAVE_MMAP=false -DHAVE_STRTOD_L=false
CUSTOM_CFG=GCC_WINDRES=$(COMPILER_PATH)/$(WINDRES) WINDRES=$(COMPILER_PATH)/$(WINDRES) LIBS="-lshlwapi -lssp -lusp10 -lole32 -luuid -lcomctl32 -lwsock32 -lws2_32 -lksuser -lwinmm -lrpcrt4 -lcrypt32 -lgdi32"

### Package Related CFG
OPENSSL_CFG=mingw64
FFMPEG_CFG=--target-os=mingw64