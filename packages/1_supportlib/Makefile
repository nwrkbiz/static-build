############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the Cpp-SupportLibrary (depends on boost)
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=Cpp-SupportLibrary-1.0.3
PACKNAME=1.0.3.zip
PACKAGE_URL=https://github.com/nwrkbiz/Cpp-SupportLibrary/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE

# Builds artifacts and includes 
INCLUDE_OUTPUT=$(WORKDIR)/$(DIRNAME)/*.h

#### Build settings ####

MAKE=echo "copy"

# build targets
include $(WORKDIR)../GENERAL.mk

