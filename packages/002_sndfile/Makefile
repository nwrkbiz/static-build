############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the sndfile library, depends on sqlite3 and alsa
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libsndfile-1.0.28
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=http://www.mega-nerd.com/libsndfile/files/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/AUTHORS


#### Build settings ####

CONFIGURE=$(DEFAULT_CFG)
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
