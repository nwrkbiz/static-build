############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the lapack library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=lapack-3.9.0
PACKNAME=v3.9.0.tar.gz
PACKAGE_URL=https://github.com/Reference-LAPACK/lapack/archive/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE

# Builds artifacts and includes 
LIB_OUTPUT=$(WORKDIR)/$(DIRNAME)/libblas.a $(WORKDIR)/$(DIRNAME)/libcblas.a $(WORKDIR)/$(DIRNAME)/liblapack.a
INCLUDE_OUTPUT=

#### Build settings ####

PRE_CFG=echo CC=$(GCC_PREFIX)-gcc > make.inc ;\
echo CFLAGS=-O3 $(CFLAGS) >> make.inc ;\
echo FC=$(GCC_PREFIX)-gfortran >> make.inc ;\
echo FFLAGS=$(FFLAGS) >> make.inc ;\
echo FFLAGS_DRV=$(FFLAGS) >> make.inc ;\
echo FFLAGS_NOOPT=$(FFLAGS) >> make.inc ;\
echo AR=$(GCC_PREFIX)-ar >> make.inc ;\
echo RANLIB=$(GCC_PREFIX)-ranlib >> make.inc ;\
echo ARFLAGS=cr >> make.inc ;\
echo TIMER=INT_ETIME >> make.inc ;\
echo BLASLIB=../../libblas.a >> make.inc ;\
echo CBLASLIB=../../libcblas.a >> make.inc ;\
echo LAPACKLIB=../liblapack.a >> make.inc
MAKE=cd SRC && $(DEFAULT_MAKE) && cd ../BLAS && $(DEFAULT_MAKE) && cd ../CBLAS && $(DEFAULT_MAKE)
AFTER_BUILD=cp -rf $(WORKDIR)/$(DIRNAME)/CBLAS/include/*.h $(OUT_INCLUDE) && \
cp -rf $(WORKDIR)/$(DIRNAME)/LAPACKE/include/*.h $(OUT_INCLUDE)

# build targets
include $(WORKDIR)../GENERAL.mk
