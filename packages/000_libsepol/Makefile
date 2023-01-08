############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the libsepol library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libsepol-3.4
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://github.com/SELinuxProject/selinux/releases/download/3.4/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING

#### Build settings ####

ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64))
MAKE=USE_PCRE2=y RANLIB=$(GCC_PREFIX)-ranlib CC=$(GCC_PREFIX)-gcc PREFIX=$(OUT_PREFIX) DESTDIR=$(OUT_PREFIX) CPATH=$(OUT_PREFIX)/include $(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && PREFIX="" DESTDIR=$(OUT_PREFIX) $(DEFAULT_INSTALL)
else
MAKE=
endif

# build targets
include $(WORKDIR)../GENERAL.mk
