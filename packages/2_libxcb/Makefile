############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the libxcb library (depends on lpthread-stubs, xcb-proto and libxau)
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libxcb-1.13
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://xorg.freedesktop.org/archive/individual/xcb/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING

#### Build settings ####

ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64))
CONFIGURE=$(DEFAULT_CFG) LIBS="-lXdmcp -lXau -ldl -lm"
POST_CFG=cd src
MAKE_WIN=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_MAKE) install-data -i && $(DEFAULT_MAKE) install-exec
else
MAKE=
endif

# build targets
include $(WORKDIR)../GENERAL.mk
