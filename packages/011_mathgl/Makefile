############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the mathgl library (depends on libx11, fltk, libharu, giflib, lbjpeg, zlib libpng, gsl)
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=mathgl-8.0.1
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://downloads.sourceforge.net/project/mathgl/mathgl/mathgl%208.0/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/COPYING_LGPL $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

ifneq (,$(filter $(MAKECMDGOALS),webasm_llvm))
PRE_CFG=sed -i -r '116s/(.{10}).{10}/\1/' $(WORKDIR)$(DIRNAME)/CMakeLists.txt && sed -i -e 's/mgl-fltk/mgl-fltk-static/g' $(WORKDIR)$(DIRNAME)/utils/CMakeLists.txt && sed -i -e '/mgl_fltk_example/d' $(WORKDIR)$(DIRNAME)/examples/CMakeLists.txt && sed -i -e 's/mgl-fltk/mgl-fltk-static/g' $(WORKDIR)$(DIRNAME)/examples/CMakeLists.txt && sed -i -e 's/mgl mgl-fltk/mgl-static mgl-fltk-static/g' $(WORKDIR)$(DIRNAME)/mgllab/CMakeLists.txt && sed -i -e 's/ rect, u3d/ rect, 0, 0 ,u3d, 0/g' $(WORKDIR)$(DIRNAME)/src/prc.cpp && sed -i -e 's/FIND_PACKAGE(FLTK)//g' $(WORKDIR)$(DIRNAME)/CMakeLists.txt && sed -i -e 's/wcsftime/\/\//g' $(WORKDIR)$(DIRNAME)/src/axis.cpp
else
PRE_CFG=sed -i -r '116s/(.{10}).{10}/\1/' $(WORKDIR)$(DIRNAME)/CMakeLists.txt && sed -i -e 's/mgl-fltk/mgl-fltk-static/g' $(WORKDIR)$(DIRNAME)/utils/CMakeLists.txt && sed -i -e '/mgl_fltk_example/d' $(WORKDIR)$(DIRNAME)/examples/CMakeLists.txt && sed -i -e 's/mgl-fltk/mgl-fltk-static/g' $(WORKDIR)$(DIRNAME)/examples/CMakeLists.txt && sed -i -e 's/mgl mgl-fltk/mgl-static mgl-fltk-static/g' $(WORKDIR)$(DIRNAME)/mgllab/CMakeLists.txt && sed -i -e 's/ rect, u3d/ rect, 0, 0 ,u3d, 0/g' $(WORKDIR)$(DIRNAME)/src/prc.cpp
endif

ifneq (,$(filter $(MAKECMDGOALS),webasm_llvm))
CONFIGURE=$(DEFAULT_CMK) -DIntl_INCLUDE_DIR= -Denable-gsl=ON -Denable-pdf=ON -Denable-gif=ON -Denable-pthread=ON -Denable-openmp=OFF -Denable-opengl=OFF -Denable-all-docs=off -Denable-all-swig=OFF -Denable-rvalue=ON -Denable-ltdl=OFF -Denable-doc-site=OFF -Denable-all-widgets=OFF -DFLTK_INCLUDE_DIR=$(OUT_INCLUDE)  -DFLTK_FLUID_EXECUTABLE=$(OUT_BIN)/fluid -Denable-fltk=ON -DFLTK_FOUND=1 -DHPDF_INCLUDE_DIR=$(OUT_INCLUDE) -DHPDF_LIB=$(OUT_LIB)/libhpdf.a -DMGL_DEP_LIBS="$(OUT_LIB)/libtiff.a;$(OUT_LIB)/libxcb.a;$(OUT_LIB)/libXau.a;$(OUT_LIB)/libXdmcp.a" -DFLTK_MATH_LIBRARY=$(OUT_PREFIX)/$(GCC_PREFIX)/lib/libm.a -Dlink_type=-static -DFLTK_LIBRARIES='$(OUT_LIB)/libfltk.a $(OUT_LIB)/libfltk_forms.a $(OUT_LIB)/libfltk_images.a $(OUT_LIB)/libX11.a $(OUT_LIB)/libnano-X.a'
else
ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64))
CONFIGURE=$(DEFAULT_CMK) -DIntl_INCLUDE_DIR= -Denable-gsl=ON -Denable-pdf=ON -Denable-gif=ON -Denable-pthread=ON -Denable-openmp=OFF -Denable-opengl=OFF -Denable-all-docs=off -Denable-all-swig=OFF -Denable-rvalue=ON -Denable-ltdl=OFF -Denable-doc-site=OFF -Denable-all-widgets=OFF -DFLTK_INCLUDE_DIR=$(OUT_INCLUDE)  -DFLTK_FLUID_EXECUTABLE=$(OUT_BIN)/fluid -Denable-fltk=ON -DFLTK_FOUND=1 -DHPDF_INCLUDE_DIR=$(OUT_INCLUDE) -DHPDF_LIB=$(OUT_LIB)/libhpdf.a -DMGL_DEP_LIBS="$(OUT_LIB)/libtiff.a;$(OUT_LIB)/libxcb.a;$(OUT_LIB)/libXau.a;$(OUT_LIB)/libXdmcp.a" -DFLTK_MATH_LIBRARY=$(OUT_PREFIX)/$(GCC_PREFIX)/lib/libm.a -Dlink_type=-static
else
CONFIGURE=$(DEFAULT_CMK) -DIntl_INCLUDE_DIR= -Denable-gsl=ON -Denable-pdf=ON -Denable-gif=ON -Denable-pthread=ON -Denable-openmp=OFF -Denable-opengl=OFF -Denable-all-docs=off -Denable-all-swig=OFF -Denable-rvalue=ON -Denable-ltdl=OFF -Denable-doc-site=OFF -Denable-all-widgets=OFF -DFLTK_INCLUDE_DIR=$(OUT_INCLUDE)  -DFLTK_FLUID_EXECUTABLE=$(OUT_BIN)/fluid.exe -Denable-fltk=ON -DFLTK_FOUND=1 -DHPDF_INCLUDE_DIR=$(OUT_INCLUDE) -DHPDF_LIB=$(OUT_LIB)/libhpdf.a -DMGL_DEP_LIBS=$(OUT_LIB)/libtiff.a -Dlink_type=-static
endif
endif

MAKE=$(DEFAULT_MAKE) mgl-static mgl-fltk-static
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_INSTALL) -i

# build targets
include $(WORKDIR)../GENERAL.mk
