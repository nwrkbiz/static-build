############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the util linux library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=util-linux-2.35
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.35/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

MAKE=$(DEFAULT_CFG)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_MAKE) install-uuidincHEADERS

# build targets
include $(WORKDIR)../GENERAL.mk

