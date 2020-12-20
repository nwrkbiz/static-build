############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the scrcpy binary/library. Depends on ffmpeg and sdl2
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=flwm-1.02
PACKNAME=$(DIRNAME).zip
PACKAGE_URL=
UNPACK=unzip
LICENSE=$(WORKDIR)/$(DIRNAME)/README

#### Build settings ####

PKG_LDFLAGS=-lXcursor -lXinerama -lXft  -lXrender -lXfixes -lXext -lX11 -lxcb -lXau -lXdmcp
PRE_CFG=autoreconf -vfi
CONFIGURE=$(DEFAULT_CFG) LIBS="-static -lXcursor -lXinerama -lXft  -lXrender -lXfixes -lXext -lX11 -lxcb -lXau -lXdmcp"
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(NINJA_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
