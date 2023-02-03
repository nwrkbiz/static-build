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

ifneq (,$(filter $(MAKECMDGOALS),webasm_llvm))
# webasm
MAKE=
else
CONFIGURE=$(DEFAULT_CMK) -DHB_HAVE_FREETYPE=ON
MAKE=$(DEFAULT_MAKE) harfbuzz harfbuzz-subset
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_MAKE) install/fast
endif

# build targets
include $(WORKDIR)../GENERAL.mk
