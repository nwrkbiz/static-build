############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the mqtt_cpp library, depends on boost
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=mqtt_cpp-12.1.0
PACKNAME=v12.1.0.zip
PACKAGE_URL=https://github.com/redboltz/mqtt_cpp/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE_1_0.txt

#### Build settings ####

CONFIGURE=$(DEFAULT_CMK) -DMQTT_BUILD_EXAMPLES=OFF -DMQTT_BUILD_TESTS=OFF -DMQTT_USE_STATIC_BOOST=ON -DMQTT_USE_STATIC_OPENSSL=ON -DMQTT_USE_TLS=ON -DMQTT_USE_WS=ON -DMQTT_STD_VARIANT=ON -DMQTT_STD_OPTIONAL=ON -DMQTT_STD_STRING_VIEW=ON -DMQTT_STD_ANY=ON -DMQTT_STD_SHARED_PTR_ARRAY=ON
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
