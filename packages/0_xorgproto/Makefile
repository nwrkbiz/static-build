############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the xproto library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=xorgproto-2019.2
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://www.x.org/releases/current/src/proto/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING-* $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

CONFIGURE=$(DEFAULT_CFG) --host=x86_64-linux-gnu
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
