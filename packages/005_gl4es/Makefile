############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the gl4es library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=gl4es-1.1.4
PACKNAME=v1.1.4.tar.gz
PACKAGE_URL=https://github.com/ptitSeb/gl4es/archive/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE

LIB_OUTPUT=$(WORKDIR)/$(DIRNAME)/lib/libGL.a
INCLUDE_OUTPUT=$(WORKDIR)/$(DIRNAME)/include/*

#### Build settings ####

ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64 webasm_llvm))
CONFIGURE=$(DEFAULT_CMK) -DSTATICLIB=true
MAKE=$(DEFAULT_MAKE)
else
MAKE=
endif

# build targets
include $(WORKDIR)../GENERAL.mk
