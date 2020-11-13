############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the mathgl library (depends on libx11, fltk, libharu, giflib, lbjpeg, zlib libpng)
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=mathgl-2.4.4
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://downloads.sourceforge.net/project/mathgl/mathgl/mathgl%202.4.4/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/COPYING_LGPL $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64))
PRE_CFG=sed -i -e 's/\(TARGETS \).\{9\}/\1/' $(WORKDIR)$(DIRNAME)/CMakeLists.txt
CONFIGURE=$(DEFAULT_CMK) -Denable-pdf=ON -Denable-gif=ON -Denable-pthread=ON -Denable-openmp=OFF -Denable-opengl=OFF -Denable-all-docs=off -Denable-all-swig=OFF -Denable-rvalue=ON -Denable-ltdl=OFF -Denable-doc-site=OFF -Denable-all-widgets=OFF -DFLTK_MATH_LIBRARY=m -Denable-fltk=ON
else
PRE_CFG=sed -i -e 's/\(TARGETS \).\{9\}/\1/' $(WORKDIR)$(DIRNAME)/CMakeLists.txt
CONFIGURE=$(DEFAULT_CMK) -DIntl_INCLUDE_DIR=Intl_INCLUDE_DIR-NOTFOUND -Denable-pdf=ON -Denable-gif=ON -Denable-pthread=ON -Denable-openmp=OFF -Denable-opengl=OFF -Denable-all-docs=off -Denable-all-swig=OFF -Denable-rvalue=ON -Denable-ltdl=OFF -Denable-doc-site=OFF -Denable-all-widgets=OFF -DFLTK_FLUID_EXECUTABLE=$(OUT_BIN)/fluid.exe -Denable-fltk=ON 
endif
MAKE=$(DEFAULT_MAKE) mgl-fltk-static mgl-static mgl mgl-fltk -i
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_INSTALL) -i

# build targets
include $(WORKDIR)../GENERAL.mk
