############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the libiconv library (used on windows only)
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=win-iconv-0.0.8
PACKNAME=v0.0.8.zip
PACKAGE_URL=https://github.com/win-iconv/win-iconv/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/readme.txt

#### Build settings ####

ifneq (,$(filter $(MAKECMDGOALS),windows_32 windows_64))
CONFIGURE=$(DEFAULT_CMK) -DBUILD_SHARED=OFF -DBUILD_STATIC=ON -DBUILD_EXECUTABLE=ON
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_MAKE) install/fast
else
MAKE=
endif

# build targets
include $(WORKDIR)../GENERAL.mk
