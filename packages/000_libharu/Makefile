############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the libharu PDF library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libharu-master
PACKNAME=master.zip
PACKAGE_URL=https://github.com/libharu/libharu/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/README
#### Build settings ####

CONFIGURE=$(DEFAULT_CMK)  -DMATH_LIB=m
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
