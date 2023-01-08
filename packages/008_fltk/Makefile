############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the fltk library (depends on libx11, libXdmcp, Xinerama, Xft, Xrender libz and libpng)
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=fltk-1.3.8
PACKNAME=$(DIRNAME)-source.tar.gz
PACKAGE_URL=https://www.fltk.org/pub/fltk/1.3.8/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/CREDITS

#### Build settings ####

ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64))
CONFIGURE=$(DEFAULT_CFG) --disable-xft --disable-xdbe --disable-xcursor --disable-xinerama --disable-xrender --disable-xfixes LIBS="-lXft -lXinerama -lXcursor -lfontconfig -lXrender -lXext -lXfixes -lharfbuzz -lfreetype -lharfbuzz -lX11 -lxcb -lXdmcp -lXau -lpng -lexpat -lz -ldl -lm -ldl -lm -lpthread"
else
CONFIGURE=$(DEFAULT_CFG) --disable-xft --disable-xdbe --disable-xcursor --disable-xinerama --disable-xrender --disable-xfixes
endif

MAKE=$(DEFAULT_MAKE) -i
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL) -i

# build targets
include $(WORKDIR)../GENERAL.mk
