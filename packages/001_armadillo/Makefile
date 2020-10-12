############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the armadillo library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=armadillo-9.900.4
PACKNAME=$(DIRNAME).tar.xz
PACKAGE_URL=https://sourceforge.net/projects/arma/files/$(PACKNAME)
UNPACK=tar xJf
LICENSE=$(WORKDIR)/$(DIRNAME)/NOTICE.txt $(WORKDIR)/$(DIRNAME)/LICENSE.txt

#### Build settings ####

CONFIGURE=$(DEFAULT_CMK) -DBLAS_LIBRARY=$(OUT_LIB)/libblas.a -DLAPACK_LIBRARY=$(OUT_LIB)/liblapack.a
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
