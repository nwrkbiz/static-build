############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the mathgl library (depends on libx11, fltk, libharu, giflib, lbjpeg, zlib libpng, gsl)
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=mathgl-2.4.4
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://downloads.sourceforge.net/project/mathgl/mathgl/mathgl%202.4.4/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/COPYING_LGPL $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

PRE_CFG=sed -i -e 's/mgl-fltk/mgl-fltk-static/g' $(WORKDIR)$(DIRNAME)/utils/CMakeLists.txt && sed -i -e '/mgl_fltk_example/d' $(WORKDIR)$(DIRNAME)/examples/CMakeLists.txt && sed -i -e 's/mgl-fltk/mgl-fltk-static/g' $(WORKDIR)$(DIRNAME)/examples/CMakeLists.txt && sed -i -e 's/mgl mgl-fltk/mgl-static mgl-fltk-static/g' $(WORKDIR)$(DIRNAME)/mgllab/CMakeLists.txt
ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64))
CONFIGURE=$(DEFAULT_CMK) -Denable-gsl=ON -Denable-pdf=ON -Denable-gif=ON -Denable-pthread=ON -Denable-openmp=OFF -Denable-opengl=OFF -Denable-all-docs=off -Denable-all-swig=OFF -Denable-rvalue=ON -Denable-ltdl=OFF -Denable-doc-site=OFF -Denable-all-widgets=OFF -Denable-fltk=ON -DHPDF_INCLUDE_DIR=$(OUT_INCLUDE) -DHPDF_LIB=$(OUT_LIB)/libhpdfs.a -DMGL_DEP_LIBS="$(OUT_LIB)/libtiff.a;$(OUT_LIB)/libxcb.a;$(OUT_LIB)/libXau.a;$(OUT_LIB)/libXdmcp.a" -DFLTK_MATH_LIBRARY=$(OUT_PREFIX)/$(GCC_PREFIX)/lib/libm.a -Dlink_type=-static
else
CONFIGURE=$(DEFAULT_CMK) -DIntl_INCLUDE_DIR=Intl_INCLUDE_DIR-NOTFOUND -Denable-gsl=ON  -Denable-pdf=ON -Denable-gif=ON -Denable-pthread=ON -Denable-openmp=OFF -Denable-opengl=OFF -Denable-all-docs=off -Denable-all-swig=OFF -Denable-rvalue=ON -Denable-ltdl=OFF -Denable-doc-site=OFF -Denable-all-widgets=OFF -DFLTK_FLUID_EXECUTABLE=$(OUT_BIN)/fluid.exe -Denable-fltk=ON -DHPDF_INCLUDE_DIR=$(OUT_INCLUDE) -DHPDF_LIB=$(OUT_LIB)/libhpdfs.a -DMGL_DEP_LIBS=$(OUT_LIB)/libtiff.a -Dlink_type=-static 
endif
MAKE=$(DEFAULT_MAKE) mgl-static mgl-fltk-static
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
