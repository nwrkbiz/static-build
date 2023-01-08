############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the freeglut library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=freeglut-3.4.0
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=http://prdownloads.sourceforge.net/freeglut/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

CONFIGURE=$(DEFAULT_CMK)  -DFREEGLUT_BUILD_SHARED_LIBS=false -DFREEGLUT_BUILD_STATIC_LIBS=true
MAKE=$(DEFAULT_MAKE) freeglut_static
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_MAKE) install/fast

# build targets
include $(WORKDIR)../GENERAL.mk

