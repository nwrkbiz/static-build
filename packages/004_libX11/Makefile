############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the x11 library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libX11-1.8.3
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://www.x.org/releases/current/src/lib/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

ifneq (,$(filter $(MAKECMDGOALS),webasm_llvm))
# webasm
MAKE=
else
CONFIGURE=$(DEFAULT_CFG) --disable-selective-werror --disable-ipv6
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)
endif

# build targets
include $(WORKDIR)../GENERAL.mk

