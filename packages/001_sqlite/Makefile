############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the sqlite library, depends on zlib
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=sqlite-autoconf-3310100
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://www.sqlite.org/2020/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/sqlite3.h

#### Build settings ####

CONFIGURE=$(DEFAULT_CFG)
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk

