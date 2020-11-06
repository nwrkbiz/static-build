############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for pulseaudio
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=pulseaudio-13.0
PACKNAME=$(DIRNAME).tar.xz
PACKAGE_URL=https://www.freedesktop.org/software/pulseaudio/releases/$(PACKNAME)
UNPACK=tar xJf
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE

#### Build settings ####

CONFIGURE=$(DEFAULT_CFG) --enable-static-bins --enable-force-preopen --without-caps
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
