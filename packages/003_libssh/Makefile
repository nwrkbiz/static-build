############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the openssl library.
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=libssh-0.10.4
PACKNAME=$(DIRNAME).tar.xz
PACKAGE_URL=https://www.libssh.org/files/0.10/$(PACKNAME)
UNPACK=tar xJf
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

CONFIGURE=$(DEFAULT_CMK) -DWITH_EXAMPLES=off -DHAVE_OPENSSL_EVP_KDF_CTX=off -DHAVE_OPENSSL_EVP_KDF_CTX_NEW=off -DHAVE_OPENSSL_EVP_KDF_CTX_NEW_ID=off
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME)/build && $(DEFAULT_INSTALL)

# build targets
include $(WORKDIR)../GENERAL.mk
