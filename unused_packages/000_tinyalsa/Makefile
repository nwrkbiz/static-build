############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the tinyalsa library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=tinyalsa-master
PACKNAME=master.zip
PACKAGE_URL=https://github.com/tinyalsa/tinyalsa/archive/$(PACKNAME)
UNPACK=unzip
LICENSE=$(WORKDIR)/$(DIRNAME)/NOTICE

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
