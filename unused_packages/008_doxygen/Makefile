############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the doxygen executable.
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=doxygen-Release_1_9_6
PACKNAME=Release_1_9_6.zip
PACKAGE_URL=https://github.com/doxygen/doxygen/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE

#### Build settings ####


ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64))
CONFIGURE=$(DEFAULT_CMK)
else
CONFIGURE=$(DEFAULT_CMK) -DCMAKE_EXE_LINKER_FLAGS="$(LDFLAGS)  -Wl,--whole-archive -liconv -Wl,--no-whole-archive"
endif
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_MAKE) install/fast

# build targets
include $(WORKDIR)../GENERAL.mk
