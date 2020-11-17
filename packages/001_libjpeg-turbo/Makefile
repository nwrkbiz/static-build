############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the libjpeg library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libjpeg-turbo-2.0.5
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://sourceforge.net/projects/libjpeg-turbo/files/2.0.5/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE.md

#### Build settings ####

CONFIGURE=$(DEFAULT_CMK) -DENABLE_SHARED=FALSE -DENABLE_STATIC=TRUE -DREQUIRE_SIMD=FALSE 
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
