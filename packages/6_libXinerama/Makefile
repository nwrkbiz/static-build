############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the libXinerama library (depends on libX11 and libXext)
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libXinerama-1.1.4
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
