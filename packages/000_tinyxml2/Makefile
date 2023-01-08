############################################################################
# Workfile: Makefile
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Date: 03.12.2018
# Description: Universal Makefile for the tinyXML2 library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=tinyxml2-9.0.0
PACKNAME=9.0.0.zip
PACKAGE_URL=https://github.com/leethomason/tinyxml2/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/readme.md

# Builds artifacts and includes 
LIB_OUTPUT=$(WORKDIR)/$(DIRNAME)/libtinyxml2.a
INCLUDE_OUTPUT=$(WORKDIR)/$(DIRNAME)/tinyxml2.h

#### Build settings ####

MAKE=$(GCC_PREFIX)-g++ $(CXXFLAGS) -c -o tinyxml2.o tinyxml2.cpp; $(GCC_PREFIX)-ar rvs libtinyxml2.a tinyxml2.o

# build targets
include $(WORKDIR)../GENERAL.mk
