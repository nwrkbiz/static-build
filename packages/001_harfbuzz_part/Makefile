############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the harfbuzz library (depends on libfreetype, cairo and glib)
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=harfbuzz-6.0.0
PACKNAME=6.0.0.zip
PACKAGE_URL=https://github.com/harfbuzz/harfbuzz/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

CONFIGURE=$(DEFAULT_CMK)
MAKE=$(DEFAULT_MAKE) harfbuzz harfbuzz-subset
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_MAKE) install/fast

# build targets
include $(WORKDIR)../GENERAL.mk
