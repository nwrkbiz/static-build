############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the alsa library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=alsa-lib-1.2.8
PACKNAME=$(DIRNAME).tar.bz2
PACKAGE_URL=http://www.alsa-project.org/files/pub/lib/$(PACKNAME)
UNPACK=tar xvf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING


#### Build settings ####

ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64 webasm_llvm))
CONFIGURE=$(DEFAULT_CFG) --disable-shared --disable-python --with-libdl=no --with-configdir=./alsa_config
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL) && mkdir -p $(OUT_PREFIX)/alsa_config && cp -rf $(WORKDIR)$(DIRNAME)/src/conf/alsa_config/* $(OUT_PREFIX)/alsa_config && cp -rf $(WORKDIR)$(DIRNAME)/src/conf/cards/alsa_config/* $(OUT_PREFIX)/alsa_config/ && cp -rf $(WORKDIR)$(DIRNAME)/src/conf/pcm/alsa_config/* $(OUT_PREFIX)/alsa_config
else
MAKE=
endif

# build targets
include $(WORKDIR)../GENERAL.mk
