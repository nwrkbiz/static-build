############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the googletest and googlemock library.
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=googletest-release-1.8.1
PACKNAME=release-1.8.1.zip
PACKAGE_URL=https://github.com/google/googletest/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE $(WORKDIR)/$(DIRNAME)/LICENSE

#### Build settings ####

PRE_CFG=autoreconf -vfi
CONFIGURE=$(DEFAULT_CFG) --disable-pthreads --with-pthreads=no
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL) -i

# build targets
include $(WORKDIR)../GENERAL.mk
