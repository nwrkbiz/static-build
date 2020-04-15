############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the expat library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libexpat-R_2_2_9
PACKNAME=R_2_2_9.zip
PACKAGE_URL=https://github.com/libexpat/libexpat/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/expat/COPYING $(WORKDIR)/$(DIRNAME)/expat/AUTHORS

#### Build settings ####

PRE_CFG=cd expat && buildconf.sh
CONFIGURE=$(DEFAULT_CFG) --without-docbook --without-xmlwf --without-examples
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/expat && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
