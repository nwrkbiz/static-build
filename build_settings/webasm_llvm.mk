############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu, giri@nwrk.biz)
############################################################################
SETTINGS_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(SETTINGS_DIR)/build_settings/globals.mk

# Output settings for 3rd party libraries 
OUT_TARGET=webasm_llvm
OUT_PREFIX=$(OUTDIR)/$(OUT_TARGET)
OUT_LIB=$(OUT_PREFIX)/lib
OUT_BIN=$(OUT_PREFIX)/bin
OUT_INCLUDE=$(OUT_PREFIX)/include

export LD_LIBRARY_PATH:=$(OUT_LIB)
export PATH:=$(OUT_BIN):$(PATH):.
export LLVM_ROOT:=$(OUT_BIN)
export BINARYEN_ROOT:=$(OUT_BIN)

# General compiler settings
COMPILER_HOST_PREFIX=x86_64-linux-gnu # GCC prefix for the architecture of this machine
COMPILER_PREFIX=wasm32-unknown-emscripten
COMPILER_PREFIX=
COMPILER_PATH=$(OUT_BIN)/
ARCH_BIT=32

CC=emcc
CXX=em++
AR=emar
LD=emcc
NM=emnm
LDSHARED=emcc
RANLIB=emranlib
STRIP=emstrip
SIZE=emsize
OBJCOPY=
OBJDUMP=emdump
READELF=
WINDRES=

### FLAGS

DEFAULT_CFLAGS=-fPIC -O3 -Wno-version-check -D__STDC_NO_ATOMICS__=1
DEFAULT_CXXFLAGS=-fPIC -O3 -Wno-version-check -D__STDC_NO_ATOMICS__=1
DEFAULT_LDFLAGS=--static -lpthread -ldl -Wno-version-check -m32

CFLAGS=-I$(OUT_INCLUDE) $(DEFAULT_CFLAGS)
CXXFLAGS=-I$(OUT_INCLUDE) $(DEFAULT_CXXFLAGS)
LDFLAGS=-L$(OUT_LIB) $(DEFAULT_LDFLAGS)
FFLAGS=-O3 -frecursive

### Meson related configs
CPU=x86
CPU_FAMILY=x86
ENDIAN=little
OS=linux
MSN_CMD=meson
CUSTOM_MSN=

### Customize CFG/CMK
MAK_CMD=emmake make
CMK_CMD=emcmake cmake
CFG_CMD=emconfigure configure
CUSTOM_CMK=-DCMAKE_EXECUTABLE_SUFFIX=".js" -DCMAKE_SYSTEM_PROCESSOR=x86 -DEMSCRIPTEN_ROOT_PATH=$(OUT_BIN) -DCMAKE_C_PLATFORM_ID=emscripten -DCMAKE_CXX_PLATFORM_ID=emscripten -DCMAKE_C_FLAGS="$(CFLAGS) -D'__TBB_machine_fetchadd4(addr, val)=__sync_fetch_and_add(addr, val)' -include emscripten/version.h -msimd128" -DCMAKE_CXX_FLAGS="$(CXXFLAGS) -D'__TBB_machine_fetchadd4(addr, val)=__sync_fetch_and_add(addr, val) -msimd128' -include emscripten/version.h"
CUSTOM_CFG=

### Package Related CFG
OPENSSL_CFG=linux-generic64 no-asm no-threads no-hw no-weak-ssl-ciphers no-dtls no-shared no-dso
FFMPEG_CFG=--target-os=linux