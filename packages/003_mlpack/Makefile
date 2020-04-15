############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the mlpack library, depends on armadillo, lapack and ensmallen
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=mlpack-3.2.2
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://www.mlpack.org/files/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYRIGHT.txt $(WORKDIR)/$(DIRNAME)/LICENSE.txt

#### Build settings ####

CONFIGURE=$(DEFAULT_CMK) -DSTB_IMAGE_INCLUDE_DIR=$(OUT_INCLUDE) -DBOOST_INCLUDEDIR=$(OUT_INCLUDE) -DARMADILLO_LIBRARY=$(OUT_LIB)/libarmadillo.a  -DBOOST_LIBRARYDIR=$(OUT_LIB) -DENSMALLEN_INCLUDE_DIR=$(OUT_INCLUDE) -DBLAS_LIBRARY=$(OUT_LIB)/libblas.a -DLAPACK_LIBRARY=$(OUT_LIB)/liblapack.a -DARMADILLO_INCLUDE_DIR=$(OUT_INCLUDE)
MAKE=$(DEFAULT_MAKE) mlpack
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && make VERBOSE=1 V=1 install/fast -i


# build targets
include $(WORKDIR)../GENERAL.mk