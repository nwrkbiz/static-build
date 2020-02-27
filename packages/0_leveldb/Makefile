############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the leveldb library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=leveldb-1.22
PACKNAME=1.22.zip
PACKAGE_URL=https://github.com/google/leveldb/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE $(WORKDIR)/$(DIRNAME)/AUTHORS

LIB_OUTPUT=$(WORKDIR)$(DIRNAME)/build/libleveldb.a
INCLUDE_OUTPUT=$(WORKDIR)$(DIRNAME)/include/*

#### Build settings ####

CONFIGURE=$(DEFAULT_CMK) -DHAVE_CRC32C=false -DHAVE_SNAPPY=false
MAKE=$(DEFAULT_MAKE) leveldb
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_MAKE) install/fast

# build targets
include $(WORKDIR)../GENERAL.mk
