############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the minizip library, depends on zlib
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=minizip-ng-3.0.8
PACKNAME=3.0.8.zip
PACKAGE_URL=https://github.com/zlib-ng/minizip-ng/archive/refs/tags/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE

#### Build settings ####

CONFIGURE=$(DEFAULT_CMK) -DMZ_BZIP2=off -DMZ_LZMA=off -DMZ_ZSTD=off
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)/$(DIRNAME)/build && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
