############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the dlib library (depends on lapack, sqlite and libX11)
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=dlib-19.21
PACKNAME=$(DIRNAME).tar.bz2
PACKAGE_URL=http://dlib.net/files/$(PACKNAME)
UNPACK=tar xvf
LICENSE=$(WORKDIR)/$(DIRNAME)/dlib/LICENSE.txt

#### Build settings ####

CONFIGURE=$(DEFAULT_CMK)
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_MAKE) install/fast

# build targets
include $(WORKDIR)../GENERAL.mk
