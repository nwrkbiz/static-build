############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the fontconfig program (depends on expat)
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=fontconfig-2.14.1
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://www.freedesktop.org/software/fontconfig/release/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

ifneq (,$(filter $(MAKECMDGOALS),webasm_llvm))
# webasm
MAKE=
else
CONFIGURE=$(DEFAULT_CFG)
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)
endif

# build targets
include $(WORKDIR)../GENERAL.mk
