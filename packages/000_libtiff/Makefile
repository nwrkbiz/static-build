############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the libtiff library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=tiff-4.1.0
PACKNAME=$(DIRNAME).zip
PACKAGE_URL=http://download.osgeo.org/libtiff/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYRIGHT
#### Build settings ####

CONFIGURE=$(DEFAULT_CMK) -DBUILD_SHARED_LIBS=OFF 
MAKE=$(DEFAULT_MAKE) -i
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_INSTALL) -i

# build targets
include $(WORKDIR)../GENERAL.mk
