############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the glib library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=glib-2.66.1
PACKNAME=$(DIRNAME).tar.xz
PACKAGE_URL=https://ftp.gnome.org/pub/gnome/sources/glib/2.66/$(PACKNAME)
UNPACK=tar xJf
LICENSE=$(WORKDIR)/$(DIRNAME)/README

#### Build settings ####

ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64))
CONFIGURE=$(DEFAULT_MSN)
MAKE=$(NINJA_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(NINJA_INSTALL)
else # skip windows build for now, need to add a mingw-w64-gettext first
MAKE=
endif

# build targets
include $(WORKDIR)../GENERAL.mk
