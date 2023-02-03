############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the openssl library.
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=openssl-1.1.1s
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://www.openssl.org/source/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

CONFIGURE=Configure -no-shared $(CFLAGS) $(LDFLAGS) $(OPENSSL_CFG) --prefix=$(OUT_PREFIX) --openssldir=$(OUT_PREFIX) --cross-compile-prefix=$(COMPILER_PATH)/$(COMPILER_PREFIX)-
POST_CFG=sed -i -e 's/$$$$(CROSS_COMPILE)gcc/$(CC)/g' ./Makefile && sed -i -e 's/$$$$(CROSS_COMPILE)g++/$(CXX)/g' ./Makefile && sed -i -e 's/$$$$(CROSS_COMPILE)ar/$(AR)/g' ./Makefile && sed -i -e 's/$$$$(CROSS_COMPILE)ranlib/$(RANLIB)/g' ./Makefile && sed -i -e 's/$$$$(CROSS_COMPILE)windres/$(WINDRES)/g' ./Makefile   
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
