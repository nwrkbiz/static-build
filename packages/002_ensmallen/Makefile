############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the ensmallen library, depends on armadillo, header only
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=ensmallen-2.11.2
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://www.ensmallen.org/files/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYRIGHT.txt $(WORKDIR)/$(DIRNAME)/LICENSE.txt

# Builds artifacts and includes 
INCLUDE_OUTPUT=$(WORKDIR)/$(DIRNAME)/include/*

#### Build settings ####

PRE_CFG=$(DEFAULT_CMK)
MAKE=$(DEFAULT_MAKE) install/fast

# build targets
include $(WORKDIR)../GENERAL.mk

