############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the libpcre library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=pcre-8.44
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=ftp://ftp.pcre.org/pub/pcre/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

#to generate pc file this is missing in cmake build
PRE_CFG=$(DEFAULT_CFG)
CONFIGURE=$(DEFAULT_CMK) -DHAVE_STRTOQ=OFF
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_INSTALL) && cp -rf $(WORKDIR)$(DIRNAME)/libpcre.pc $(OUT_LIB)/pkgconfig

# build targets
include $(WORKDIR)../GENERAL.mk
