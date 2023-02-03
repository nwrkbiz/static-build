############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the libdaemon library.
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libdaemon-0.14
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=http://0pointer.de/lennart/projects/libdaemon/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE

#### Build settings ####

ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64 webasm_llvm))
CONFIGURE=sed -i 's/AC_FUNC_SETPGRP//g' configure.ac && autoreconf -vfi && $(DEFAULT_CFG)
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)
else
MAKE=
endif

# build targets
include $(WORKDIR)../GENERAL.mk
