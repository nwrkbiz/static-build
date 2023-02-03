############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the libselinux library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libselinux-3.4
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://github.com/SELinuxProject/selinux/releases/download/3.4/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE

#### Build settings ####

ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64 webasm_llvm))
MAKE=USE_PCRE2=y RANLIB=$(RANLIB) CC=$(CC) PREFIX=$(OUT_PREFIX) DESTDIR=$(OUT_PREFIX) CPATH=$(OUT_PREFIX)/include LIBRARY_PATH=$(OUT_LIB) FTS_LDLIBS=-lfts $(DEFAULT_MAKE) -i
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && USE_PCRE2=y RANLIB=$(RANLIB) CC=$(CC) PREFIX="" DESTDIR=$(OUT_PREFIX) CPATH=$(OUT_PREFIX)/include LIBRARY_PATH=$(OUT_LIB) FTS_LDLIBS=-lfts $(DEFAULT_INSTALL) -i
else
MAKE=
endif

# build targets
include $(WORKDIR)../GENERAL.mk
