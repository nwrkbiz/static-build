############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the freetype library, depends on zlib and libpng
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=freetype-2.12.1
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://download.savannah.gnu.org/releases/freetype/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/README $(WORKDIR)/$(DIRNAME)/docs/FTL.TXT $(WORKDIR)/$(DIRNAME)/docs/GPLv2.TXT $(WORKDIR)/$(DIRNAME)/LICENSE.TXT

AFTER_UNPACK=mkdir -p $(OUT_LICENSE)/$(DIRNAME)/src/bdf && cp $(WORKDIR)/$(DIRNAME)/src/bdf/README $(OUT_LICENSE)/$(DIRNAME)/src/bdf && \
mkdir -p $(OUT_LICENSE)/$(DIRNAME)/src/pcf  && cp $(WORKDIR)/$(DIRNAME)/src/pcf/README $(OUT_LICENSE)/$(DIRNAME)/src/pcf && \
mkdir -p $(OUT_LICENSE)/$(DIRNAME)/src/gzip && cp $(WORKDIR)/$(DIRNAME)/src/gzip/zlib.h $(OUT_LICENSE)/$(DIRNAME)/src/gzip

#### Build settings ####

ifneq (,$(filter $(MAKECMDGOALS),webasm_llvm))
# webasm
MAKE=
else
CONFIGURE=$(DEFAULT_CFG) --with-brotli=no
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)
endif

# build targets
include $(WORKDIR)../GENERAL.mk
