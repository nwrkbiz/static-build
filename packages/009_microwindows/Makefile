############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the Cpp-SupportLibrary (depends on boost)
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=microwindows-master
PACKNAME=master.zip
PACKAGE_URL=https://github.com/ghaerr/microwindows/archive/refs/heads/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE

# Builds artifacts and includes 
INCLUDE_OUTPUT=$(WORKDIR)/$(DIRNAME)/src/nx11/X11-local/*
LIB_OUTPUT=$(WORKDIR)/$(DIRNAME)/src/lib/*.a

#### Build settings ####


ifneq (,$(filter $(MAKECMDGOALS),webasm_llvm))
# webasm
PRE_CFG=cp $(WORKDIR)/$(DIRNAME)/src/Configs/config.emscripten $(WORKDIR)/$(DIRNAME)/src/config
CONFIGURE=echo  "EXTRAFLAGS=-I$(OUT_INCLUDE) -L$(OUT_LIB)" >> $(WORKDIR)/$(DIRNAME)/src/config  && echo  "HAVE_FREETYPE_2_SUPPORT=N" >> $(WORKDIR)/$(DIRNAME)/src/config
MAKE=cd $(WORKDIR)/$(DIRNAME)/src/ && $(DEFAULT_MAKE)
AFTER_BUILD=rm -rf $(OUT_INCLUDE)/nanox && mv $(WORKDIR)/$(DIRNAME)/src/include $(OUT_INCLUDE)/nanox && ln -s $(OUT_LIB)/libNX11.a $(OUT_LIB)/libX11.a 
else
MAKE=
endif

# build targets
include $(WORKDIR)../GENERAL.mk

