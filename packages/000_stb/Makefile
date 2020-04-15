############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the stb library, header only
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=stb-master
PACKNAME=master.zip
PACKAGE_URL=https://github.com/nothings/stb/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE

# Builds artifacts and includes 
INCLUDE_OUTPUT=$(WORKDIR)/$(DIRNAME)/*.h

#### Build settings ####

MAKE=echo "copy"

# build targets
include $(WORKDIR)../GENERAL.mk

