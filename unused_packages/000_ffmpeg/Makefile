############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for ffmpeg 4.1.5
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=ffmpeg-4457f75
PACKNAME=4457f75c65cbc4cabdedc890b78d2ecf1bb8ccdd.tar.gz
PACKAGE_URL=https://git.ffmpeg.org/gitweb/ffmpeg.git/snapshot/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE.md $(WORKDIR)/$(DIRNAME)/COPYING.*

#### Build settings ####

CONFIGURE=$(DEFAULT_CFG)
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk