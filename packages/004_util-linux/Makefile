############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the util linux library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=util-linux-2.35.1
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.35/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64))
CONFIGURE=$(DEFAULT_CFG)  --without-systemd --without-python --with-bashcompletiondir=$(OUT_PREFIX)
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_MAKE) install-usrlib_execLTLIBRARIES install-binPROGRAMS install-pkgconfigDATA  install-nodist_blkidincHEADERS install-nodist_fdiskincHEADERS install-nodist_mountincHEADERS install-nodist_smartcolsincHEADERS install-uuidincHEADERS && sed -i '/lmount/ s/$$/ -lblkid/' $(OUT_LIB)/pkgconfig/mount.pc
else
MAKE=$(DEFAULT_CFG)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_MAKE) install-uuidincHEADERS
endif

# build targets
include $(WORKDIR)../GENERAL.mk

