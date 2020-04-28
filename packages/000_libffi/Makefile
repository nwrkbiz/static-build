############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the libffi library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libffi-master
PACKNAME=master.zip
PACKAGE_URL=https://github.com/libffi/libffi/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE $(WORKDIR)/$(DIRNAME)/LICENSE-BUILDTOOLS

#### Build settings ####

CONFIGURE=autogen.sh && $(DEFAULT_CFG)
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
