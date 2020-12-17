############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the scrcpy binary/library. Depends on ffmpeg and sdl2
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=scrcpy-1.16
PACKNAME=v1.16.zip
PACKAGE_URL=https://github.com/Genymobile/scrcpy/archive/$(PACKNAME)
UNPACK=unzip
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE

#### Build settings ####

export ANDROID_SDK_ROOT=/usr/lib/android-sdk

PKG_LDFLAGS=-lXcursor -lXinerama -lXft  -lXrender -lXfixes -lXext -lX11 -lxcb -lXau -lXdmcp -lasound
#PRE_CFG=sed -i -e 's/SDL_RENDERER_ACCELERATED/SDL_RENDERER_SOFTWARE/g' $(WORKDIR)$(DIRNAME)/app/src/screen.c
CONFIGURE=$(DEFAULT_MSN)
MAKE=$(NINJA_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(NINJA_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
