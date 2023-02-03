############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the sdl2 library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=SDL2-2.26.2
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://www.libsdl.org/release/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE.txt $(WORKDIR)/$(DIRNAME)/CREDITS.txt

#### Build settings ####

ifneq (,$(filter $(MAKECMDGOALS),webasm_llvm))
# webasm
CONFIGURE=$(DEFAULT_CMK) -DEMSCRIPTEN=on
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_INSTALL)
else
CONFIGURE=$(DEFAULT_CFG) --disable-pulseaudio
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)
endif


# build targets
include $(WORKDIR)../GENERAL.mk
