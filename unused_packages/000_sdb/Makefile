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

PRE_CFG=sed -i -e 's/libsdb.get_shared_lib/libsdb.get_static_lib/g' $(WORKDIR)$(DIRNAME)/meson.build
CONFIGURE=$(DEFAULT_MSN)
MAKE=$(NINJA_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(NINJA_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
