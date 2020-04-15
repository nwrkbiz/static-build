############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the libXt library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libXt-1.2.0
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://www.x.org/releases/current/src/lib/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING

#### Build settings ####

ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64))
CONFIGURE=$(DEFAULT_CFG)
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)
else
MAKE=
endif

# build targets
include $(WORKDIR)../GENERAL.mk
