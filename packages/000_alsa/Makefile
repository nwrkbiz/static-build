############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the alsa library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=alsa-lib-1.2.2
PACKNAME=$(DIRNAME).tar.bz2
PACKAGE_URL=ftp://ftp.alsa-project.org/pub/lib/$(PACKNAME)
UNPACK=tar xvf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING


#### Build settings ####

ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64))
CONFIGURE=$(DEFAULT_CFG) --disable-shared --disable-mixer --disable-hwdep --disable-rawmidi --disable-seq --disable-instr --disable-alisp --with-pcm-plugins=no --with-libdl=no --with-configdir=./alsa_config
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL) && mv $(WORKDIR)$(DIRNAME)/src/conf $(OUT_PREFIX)/alsa_conf
else
MAKE=
endif

# build targets
include $(WORKDIR)../GENERAL.mk
