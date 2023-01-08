############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the alsa library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=musl-cross-make-master
PACKNAME=master.zip
PACKAGE_URL=https://github.com/richfelker/musl-cross-make/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYRIGHT $(WORKDIR)/$(DIRNAME)/LICENSE
INCLUDE_OUTPUT=execinfo.h

#### Build settings ####

ifneq (,$(findstring musl,$(MAKECMDGOALS)))
CONFIGURE=echo 'TARGET=$(GCC_PREFIX)' > config.mak ;\
echo 'OUTPUT=$(OUT_PREFIX)' >> config.mak ;\
echo 'COMMON_CONFIG += CFLAGS="-g0 -Os" CXXFLAGS="-g0 -Os" LDFLAGS="-s"' >> config.mak ;\
echo 'GCC_CONFIG += --enable-languages=c,c++,fortran' >> config.mak ;\
cp -rf $(WORKDIR)/musl-1.2.3/ $(WORKDIR)$(DIRNAME)/patches/
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL) && cd $(WORKDIR) && mkdir -p $(OUT_INCLUDE)/sys && cp unistd.h $(OUT_INCLUDE)/sys && sed -i -e '/\#include <linux\/types.h>/ i \#include <time.h>' $(OUT_PREFIX)/$(GCC_PREFIX)/include/sound/asound.h
else
MAKE=
endif

# build targets
include $(WORKDIR)../GENERAL.mk
