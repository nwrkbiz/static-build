############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the libpng library, depends on zlib
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libpng-1.6.37
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://download.sourceforge.net/libpng/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

CONFIGURE=$(DEFAULT_CFG)
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
