############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the libxcb library (depends on lpthread-stubs, xcb-proto and libxau)
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libxcb-1.14
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://xorg.freedesktop.org/archive/individual/xcb/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING

#### Build settings ####

CONFIGURE=$(DEFAULT_CFG)
POST_CFG=cd src
MAKE_WIN=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_MAKE) install-data -i && $(DEFAULT_MAKE) install-exec

# build targets
include $(WORKDIR)../GENERAL.mk
