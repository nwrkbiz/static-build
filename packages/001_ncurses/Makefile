############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for ncurses
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=ncurses-6.2
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=ftp://ftp.invisible-island.net/ncurses/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64))
CONFIGURE=$(DEFAULT_CFG) --disable-stripping --with-termlib
else # workaround wrongly detected select on mingw64
CONFIGURE=$(DEFAULT_CFG) --disable-stripping --enable-term-driver --enable-sp-funcs && sed -i -e 's/HAVE_SELECT 1/HAVE_SELECT 0/g' ./include/ncurses_cfg.h
endif
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
