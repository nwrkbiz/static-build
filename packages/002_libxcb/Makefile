############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the libxcb library (depends on lpthread-stubs, xcb-proto and libxau)
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libxcb-1.15
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://xorg.freedesktop.org/archive/individual/xcb/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING

#### Build settings ####

# fix bug within this version. (fix has been upstreamed already)
ifneq (,$(filter $(MAKECMDGOALS),windows_32 windows_64))
PRE_CFG=sed -i '392s/close/closesocket/' $(WORKDIR)$(DIRNAME)/src/xcb_util.c
endif

CONFIGURE=$(DEFAULT_CFG)
POST_CFG=cd src
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_MAKE) install-data -i && $(DEFAULT_MAKE) install-exec

# build targets
include $(WORKDIR)../GENERAL.mk
