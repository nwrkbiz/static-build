############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for ncurses
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=ncurses-6.4
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=http://ftp.invisible-island.net/archives/ncurses/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

ifneq (,$(filter $(MAKECMDGOALS),webasm_llvm))
# webasm
MAKE=
else
ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64))
CONFIGURE=$(DEFAULT_CFG) --disable-stripping --with-termlib --enable-pc-files --with-pkg-config-libdir=${OUT_LIB}/pkgconfig --without-debug 
else # workaround wrongly detected select on mingw64
CONFIGURE=$(DEFAULT_CFG) --disable-stripping --enable-term-driver --enable-sp-funcs --enable-pc-files --with-pkg-config-libdir=${OUT_LIB}/pkgconfig --without-debug && sed -i -e 's/HAVE_SELECT 1/HAVE_SELECT 0/g' ./include/ncurses_cfg.h
endif
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)
endif

# build targets
include $(WORKDIR)../GENERAL.mk
