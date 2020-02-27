############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the libao library. Depends on alsa
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libao-1.2.2
PACKNAME=1.2.2.tar.gz
PACKAGE_URL=https://github.com/xiph/libao/archive/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64))
PRE_CFG=./autogen.sh
CONFIGURE=$(DEFAULT_CFG) --disable-pulse --enable-alsa --disable-alsa-mmap --disable-wmm
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)
else
PRE_CFG=./autogen.sh
CONFIGURE=$(DEFAULT_CFG) --disable-pulse --disable-alsa --disable-alsa-mmap --enable-wmm
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)
endif

# build targets
include $(WORKDIR)../GENERAL.mk

