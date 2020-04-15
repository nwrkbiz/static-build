############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the harfbuzz library (depends on libfreetype, cairo and glib)
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=harfbuzz-2.6.4
PACKNAME=2.6.4.zip
PACKAGE_URL=https://github.com/harfbuzz/harfbuzz/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

CONFIGURE=$(DEFAULT_CMK) -DHB_HAVE_FREETYPE=ON -DHB_HAVE_ICU=ON
MAKE=$(DEFAULT_MAKE) harfbuzz
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_MAKE) install/fast

# build targets
include $(WORKDIR)../GENERAL.mk
