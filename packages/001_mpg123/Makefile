############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for mpg123
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=mpg123-1.31.1
PACKNAME=$(DIRNAME).tar.bz2
PACKAGE_URL=https://sourceforge.net/projects/mpg123/files/mpg123/1.31.1/$(PACKNAME)
UNPACK=tar -xf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

CONFIGURE=$(DEFAULT_CFG) --with-cpu=generic_fpu --with-audio=dummy
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
