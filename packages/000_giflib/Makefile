############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the giflib library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=giflib-5.2.1
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://sourceforge.net/projects/giflib/files/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/README

#### Build settings ####

PRE_CFG=sed -i -e 's~/usr/local~$(OUT_PREFIX)~g' $(WORKDIR)$(DIRNAME)/Makefile && sed -i  '/-m 755 libgif.so/d' $(WORKDIR)$(DIRNAME)/Makefile  && sed -i  '/ln -sf libgif.so./d' $(WORKDIR)$(DIRNAME)/Makefile && sed -i 's/-O2/-Os/g' $(WORKDIR)$(DIRNAME)/Makefile
CONFIGURE=export CC=$(COMPILER_PATH)/$(CC) && export AR=$(COMPILER_PATH)/$(AR) && export CFLAGS="$(CFLAGS)" && export LDFLAGS="$(LDFLAGS)"
MAKE=$(DEFAULT_MAKE) libgif.a
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_MAKE) install-lib install-include

# build targets
include $(WORKDIR)../GENERAL.mk
