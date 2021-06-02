############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the mqtt_cpp library, depends on boost
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=fast-cpp-csv-parser-master
PACKNAME=master.zip
PACKAGE_URL=https://github.com/ben-strasser/fast-cpp-csv-parser/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE

#### Build settings ####

CONFIGURE=
MAKE=mkdir -p $(OUT_INCLUDE)
AFTER_BUILD=cp $(WORKDIR)/$(DIRNAME)/csv.h $(OUT_INCLUDE)

# build targets
include $(WORKDIR)../GENERAL.mk
