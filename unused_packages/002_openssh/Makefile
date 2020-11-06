############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the libXi library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=openssh-portable-V_8_2_P1
PACKNAME=V_8_2_P1.zip
PACKAGE_URL=https://github.com/openssh/openssh-portable/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENCE $(WORKDIR)/$(DIRNAME)/CREDITS

#### Build settings ####

PRE_CFG=autoreconf -vfi
CONFIGURE=$(DEFAULT_CFG)  --disable-strip
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
