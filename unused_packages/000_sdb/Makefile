############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the sdb binary/library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=sdb-1.3.0
PACKNAME=1.3.0.zip
PACKAGE_URL=https://github.com/radareorg/sdb/archive/$(PACKNAME)
UNPACK=unzip
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64))
CONFIGURE=$(DEFAULT_MSN)
MAKE=$(NINJA_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(NINJA_INSTALL)
else
MAKE=
endif

# build targets
include $(WORKDIR)../GENERAL.mk
