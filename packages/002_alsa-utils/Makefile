############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the alsa utility tools, depends on libasound and ncurses
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=alsa-utils-1.2.8
PACKNAME=$(DIRNAME).tar.bz2
PACKAGE_URL=ftp://ftp.alsa-project.org/pub/utils/$(PACKNAME)
UNPACK=tar xvf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING


#### Build settings ####

ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64 webasm_llvm))
CONFIGURE=$(DEFAULT_CFG) --disable-nls --disable-xmlto --enable-alsa-topology
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL) -i
else
MAKE=
endif

# build targets
include $(WORKDIR)../GENERAL.mk
