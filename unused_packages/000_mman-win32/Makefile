############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the mman-win32 library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=mman-win32-master
PACKNAME=master.zip
PACKAGE_URL=https://github.com/witwall/mman-win32/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/README.md

#### Build settings ####

ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64))
MAKE=
else
CONFIGURE=$(DEFAULT_CMK)
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_INSTALL)
endif

# build targets
include $(WORKDIR)../GENERAL.mk

