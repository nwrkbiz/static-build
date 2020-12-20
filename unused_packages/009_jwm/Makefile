############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the scrcpy binary/library. Depends on ffmpeg and sdl2
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=jwm-s1685
PACKNAME=s1685.zip
PACKAGE_URL=https://github.com/joewing/jwm/archive/$(PACKNAME)
UNPACK=unzip
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE

#### Build settings ####

export ANDROID_SDK_ROOT=/usr/lib/android-sdk

PKG_LDFLAGS=-lxcb -lXcursor -lXinerama -lXft  -lXrender -lXfixes -lXext -lX11 -lxcb -lXau -lXdmcp -lasound
PRE_CFG=cd $(WORKDIR)$(DIRNAME) && ./autogen.sh
CONFIGURE=$(DEFAULT_CFG)
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(NINJA_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
