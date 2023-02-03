############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu, giri@nwrk.biz)
############################################################################
SETTINGS_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(SETTINGS_DIR)/build_settings/globals.mk

# Output settings for 3rd party libraries 
OUT_TARGET=linux_sh2fdpic_musl
OUT_PREFIX=$(OUTDIR)/$(OUT_TARGET)
OUT_LIB=$(OUT_PREFIX)/lib
OUT_BIN=$(OUT_PREFIX)/bin
OUT_INCLUDE=$(OUT_PREFIX)/include

export LD_LIBRARY_PATH:=$(OUT_LIB)
export PATH:=$(OUT_BIN):$(PATH):.

# General compiler settings
COMPILER_HOST_PREFIX=x86_64-linux-gnu # GCC prefix for the architecture of this machine
COMPILER_PREFIX=sh2-linux-muslfdpic
COMPILER_PATH=$(OUT_BIN)/
ARCH_BIT=32

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

DEFAULT_CFLAGS=-fPIC -static-libgcc -Os
DEFAULT_CXXFLAGS=-fPIC -static-libgcc -static-libstdc++ -Os
DEFAULT_LDFLAGS=--static -static-libgcc -static-libstdc++ -lpthread -ldl

CFLAGS=-I$(OUT_INCLUDE) $(DEFAULT_CFLAGS)
CXXFLAGS=-I$(OUT_INCLUDE) $(DEFAULT_CXXFLAGS)
LDFLAGS=-L$(OUT_LIB) $(DEFAULT_LDFLAGS)
FFLAGS=-Os -frecursive

### Meson related configs
CPU=sh2
CPU_FAMILY=sh4
ENDIAN=little
OS=linux
MSN_CMD=meson
CUSTOM_MSN=--buildtype=minsize 

### Customize CFG/CMK
MAK_CMD=make
CMK_CMD=cmake
CFG_CMD=configure
CUSTOM_CMK=-DCMAKE_SYSTEM_PROCESSOR=sh2 -DCMAKE_SYSTEM_NAME=Linux -DCMAKE_BUILD_TYPE=MINSIZEREL
CUSTOM_CFG=

### Package Related CFG
OPENSSL_CFG=linux-generic32
FFMPEG_CFG=--target-os=linux