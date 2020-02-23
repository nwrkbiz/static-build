############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the sdl library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=SDL2-2.0.10
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://www.libsdl.org/release/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING.txt $(WORKDIR)/$(DIRNAME)/CREDITS.txt
LICENSE_OUTPUT=$(OUTDIR)/LICENSES/$(DIRNAME)

#### Build settings ####

CONFIGURE=$(DEFAULT_CFG)
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
