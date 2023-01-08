############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the openjpeg library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=openjpeg-2.5.0
PACKNAME=v2.5.0.tar.gz
PACKAGE_URL=https://github.com/uclouvain/openjpeg/archive/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE $(WORKDIR)/$(DIRNAME)/AUTHORS.md

#### Build settings ####

CONFIGURE=$(DEFAULT_CMK)
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
