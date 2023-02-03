############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the llmv project
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=binaryen-version_111
PACKNAME=version_111.zip
PACKAGE_URL=https://github.com/WebAssembly/binaryen/archive/refs/tags/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE

#### Build settings ####

ifneq (,$(findstring webasm,$(MAKECMDGOALS)))
CONFIGURE=mkdir -p ./build && cd ./build && cmake .. -DCMAKE_INSTALL_PREFIX="$(OUT_PREFIX)" -DCMAKE_INCLUDE_PATH="$(OUT_INCLUDE)" -DCMAKE_LIBRARY_PATH="$(OUT_LIB)" -DCMAKE_PROGRAM_PATH="$(OUT_BIN)" -DCMAKE_PREFIX_PATH="$(OUT_PREFIX)"  -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=off
MAKE=make -j$(MAKE_JOBS) V=$(MAKE_VERBOSE) VERBOSE=$(MAKE_VERBOSE) 
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && make install
else
MAKE=
endif

# build targets
include $(WORKDIR)../GENERAL.mk
