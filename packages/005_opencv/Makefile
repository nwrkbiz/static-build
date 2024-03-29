############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the opencv library (depends on lapack, libpng, zlib, libjpeg)
# Only builds the imgproc module.
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=opencv-4.7.0
PACKNAME=4.7.0.zip
PACKAGE_URL=https://github.com/opencv/opencv/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE

#### Build settings ####
ifneq (,$(filter $(MAKECMDGOALS),webasm_llvm))
CONFIGURE=$(DEFAULT_CMK) -DBUILD_LIST=flann,imgproc,calib3d,features2d,js -DCV_ENABLE_INTRINSICS=OFF -DBUILD_WASM_INTRIN_TESTS=OFF -DWITH_IPP=OFF -DBUILD_TBB=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DBUILD_opencv_apps=OFF
else
CONFIGURE=$(DEFAULT_CMK) -DBUILD_LIST=imgproc,imgcodecs,calib3d,videoio,features2d -DWITH_IPP=OFF -DBUILD_TBB=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DBUILD_opencv_apps=OFF
endif
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_MAKE) install/fast

# build targets
include $(WORKDIR)../GENERAL.mk
