############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the xorgproto library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=xorgproto-2022.2
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://www.x.org/releases/current/src/proto/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING-* $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

CONFIGURE=$(DEFAULT_CFG)
MAKE=$(DEFAULT_MAKE)

ifeq (,$(filter $(MAKECMDGOALS),windows_64))
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)
else
# hack for mingw64 basetsd.h datatype redefinition
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL) && sed -i -e '/define LONG64/ a \#   undef LONG64' $(OUT_INCLUDE)/X11/Xmd.h
endif


# build targets
include $(WORKDIR)../GENERAL.mk
