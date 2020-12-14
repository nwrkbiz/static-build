############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the doxygen executable.
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=graphviz-2.44.1
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://www2.graphviz.org/Packages/stable/portable_source/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/AUTHORS $(WORKDIR)/$(DIRNAME)/COPYING

#### Build settings ####

CONFIGURE=$(DEFAULT_CFG) --disable-shared  --disable-ltdl-install --disable-ltdl --disable-swig --disable-sharp --disable-go --disable-guile --disable-java --disable-lua --disable-tcl --disable-ruby --disable-r --disable-python3 --disable-python2 --disable-python --disable-php --disable-perl --disable-ocaml
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
