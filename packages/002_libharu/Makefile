############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the libharu PDF library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libharu-2.4.3
PACKNAME=v2.4.3.zip
PACKAGE_URL=https://github.com/libharu/libharu/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE
#### Build settings ####

CONFIGURE=$(DEFAULT_CMK)  -DM_LIB=m -DMATH_LIB=m -DLIBHPDF_SHARED=NO -DLIBHPDF_STATIC=ON
MAKE=$(DEFAULT_MAKE) -i
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_INSTALL) -i

# build targets
include $(WORKDIR)../GENERAL.mk
