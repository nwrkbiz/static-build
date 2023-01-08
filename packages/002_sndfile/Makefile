############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the sndfile library, depends on sqlite3 and alsa
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libsndfile-1.2.0
PACKNAME=1.2.0.zip
PACKAGE_URL=https://github.com/libsndfile/libsndfile/archive/refs/tags/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/AUTHORS


#### Build settings ####

CONFIGURE=$(DEFAULT_CMK) -DBUILD_EXAMPLES=off -DBUILD_TESTING=off -DBUILD_PROGRAMS=off
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
