############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the openssl library.
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=openssl-1.1.1n
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://www.openssl.org/source/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

CONFIGURE=Configure -no-shared $(CFLAGS) $(LDFLAGS) $(OPENSSL_CFG) --prefix=$(OUT_PREFIX) --openssldir=$(OUT_PREFIX) --cross-compile-prefix=$(GCC_PATH)/$(GCC_PREFIX)-
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
