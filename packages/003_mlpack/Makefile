############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the mlpack library, depends on armadillo, lapack and ensmallen
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=mlpack-3.4.2
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://www.mlpack.org/files/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYRIGHT.txt $(WORKDIR)/$(DIRNAME)/LICENSE.txt

#### Build settings ####

CONFIGURE=$(DEFAULT_CMK) -DDISABLE_DOWNLOADS=ON -DBUILD_SHARED_LIBS=OFF -DBUILD_JULIA_BINDINGS=OFF -DBUILD_PYTHON_BINDINGS=OFF -DBUILD_CLI_EXECUTABLES=OFF -DBUILD_TESTS=OFF -DSTB_IMAGE_INCLUDE_DIR=$(OUT_INCLUDE)  -DARMADILLO_LIBRARY=$(OUT_LIB)/libarmadillo.a -DENSMALLEN_INCLUDE_DIR=$(OUT_INCLUDE) -DBLAS_LIBRARY=$(OUT_LIB)/libblas.a -DLAPACK_LIBRARY=$(OUT_LIB)/liblapack.a -DARMADILLO_INCLUDE_DIR=$(OUT_INCLUDE)
MAKE=sed -i -e 's~$(OUT_INCLUDE)/stb~$(OUT_INCLUDE);$(OUT_INCLUDE)/stb~g' $(WORKDIR)$(DIRNAME)/build/src/mlpack/mlpack_CXX_cotire.cmake && $(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_INSTALL)


# build targets
include $(WORKDIR)../GENERAL.mk
