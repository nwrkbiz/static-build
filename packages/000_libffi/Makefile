############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the libffi library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libffi-3.4.2
PACKNAME=v3.4.2.zip
PACKAGE_URL=https://github.com/libffi/libffi/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE $(WORKDIR)/$(DIRNAME)/LICENSE-BUILDTOOLS

#### Build settings ####

ifeq (,$(filter $(MAKECMDGOALS),linux_sh2fdpic_musl linux_sh2_musl linux_sh2eb_musl linux_sh2ebfdpic_musl))
CONFIGURE=autogen.sh && $(DEFAULT_CFG)
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)
else
MAKE=
endif

# build targets
include $(WORKDIR)../GENERAL.mk
