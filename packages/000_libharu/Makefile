############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the libharu PDF library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libharu-RELEASE_2_3_0
PACKNAME=RELEASE_2_3_0.zip
PACKAGE_URL=https://github.com/libharu/libharu/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/README
#### Build settings ####

PRE_CFG=sed -i -e 's~define	G3CODES~undef	G3CODES~g' $(WORKDIR)$(DIRNAME)/src/hpdf_image_ccitt.c
CONFIGURE=$(DEFAULT_CMK)  -DMATH_LIB=m -DLIBHPDF_SHARED=NO -DLIBHPDF_STATIC=ON
MAKE=$(DEFAULT_MAKE) -i
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_INSTALL) -i

# build targets
include $(WORKDIR)../GENERAL.mk
