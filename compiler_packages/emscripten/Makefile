############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the llmv project
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=emscripten-3.1.31
PACKNAME=3.1.31.zip
PACKAGE_URL=https://github.com/emscripten-core/emscripten/archive/refs/tags/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE

#### Build settings ####

ifneq (,$(findstring webasm,$(MAKECMDGOALS)))
MAKE=cp -rf $(WORKDIR)/$(DIRNAME)/* $(OUT_BIN)
AFTER_BUILD=cd $(OUT_BIN)/ && npm install
else
MAKE=
endif

# build targets
include $(WORKDIR)../GENERAL.mk
