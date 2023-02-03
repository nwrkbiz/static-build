############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the llmv project
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=llvm-project-llvmorg-17-init/llvm
PACKNAME=llvmorg-17-init.zip
PACKAGE_URL=https://github.com/llvm/llvm-project/archive/refs/tags/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE.TXT

#### Build settings ####

ifneq (,$(findstring webasm,$(MAKECMDGOALS)))
CONFIGURE=mkdir -p ./build && cd ./build && cmake .. -DCMAKE_INSTALL_PREFIX="$(OUT_PREFIX)" -DCMAKE_INCLUDE_PATH="$(OUT_INCLUDE)" -DCMAKE_LIBRARY_PATH="$(OUT_LIB)" -DCMAKE_PROGRAM_PATH="$(OUT_BIN)" -DCMAKE_PREFIX_PATH="$(OUT_PREFIX)"  -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS='lld;clang' -DLLVM_TARGETS_TO_BUILD="host;WebAssembly" -DLLVM_INCLUDE_EXAMPLES=OFF -DLLVM_INCLUDE_TESTS=OFF
MAKE=make -j$(MAKE_JOBS) V=$(MAKE_VERBOSE) VERBOSE=$(MAKE_VERBOSE) 
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && make install
else
MAKE=
endif

# build targets
include $(WORKDIR)../GENERAL.mk
