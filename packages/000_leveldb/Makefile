############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the leveldb library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=leveldb-1.23
PACKNAME=1.23.zip
PACKAGE_URL=https://github.com/google/leveldb/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

CONFIGURE=$(DEFAULT_CMK) -DHAVE_CRC32C=false -DHAVE_SNAPPY=false -DLEVELDB_BUILD_TESTS=false -DLEVELDB_BUILD_BENCHMARKS=false
MAKE=$(DEFAULT_MAKE) leveldb
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_MAKE) install/fast

# build targets
include $(WORKDIR)../GENERAL.mk
