############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the zlib library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=zlib-1.2.13
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://zlib.net/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/README $(WORKDIR)/$(DIRNAME)/zlib.h

#### Build settings ####

PRE_CFG=export CC=$(GCC_PATH)/$(GCC_PREFIX)-gcc && export AR=$(GCC_PATH)/$(GCC_PREFIX)-ar && export CFLAGS="$(CFLAGS)" && export LDFLAGS="$(LDFLAGS)"
CONFIGURE=configure --static --libdir=$(OUT_LIB) --sharedlibdir=$(OUT_LIB) --includedir=$(OUT_INCLUDE) --eprefix=$(OUT_PREFIX) --prefix=$(OUT_PREFIX)
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
