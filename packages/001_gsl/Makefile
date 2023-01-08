############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the libgsl library (depends on lapack)
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=gsl-2.7.1
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=http://ftp.gnu.org/gnu/gsl/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

PRE_CFG=cp -rf $(WORKDIR)$(DIRNAME)/ieee-utils/fp-unknown.c $(WORKDIR)$(DIRNAME)/ieee-utils/fp-gnuppc.c && cp -rf $(WORKDIR)$(DIRNAME)/ieee-utils/fp-unknown.c $(WORKDIR)$(DIRNAME)/ieee-utils/fp-gnux86.c
CONFIGURE=$(DEFAULT_CFG)
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk

