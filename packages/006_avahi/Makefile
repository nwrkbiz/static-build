############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the avahi library, depends on libevent
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=avahi-0.8
PACKNAME=$(DIRNAME).tar.gz
PACKAGE_URL=http://avahi.org/download/$(PACKNAME)
UNPACK=tar xvzf
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE

#### Build settings ####


ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64 linux_sh2fdpic_musl linux_sh2_musl linux_sh2eb_musl linux_sh2ebfdpic_musl))
CONFIGURE=$(DEFAULT_CFG) --with-systemdsystemunitdir=$(OUT_LIB)/system --with-distro=none --disable-qt4 --disable-qt5 --disable-gtk --disable-gtk3 --disable-gdbm --disable-dbus --disable-mono  --disable-python-dbus --disable-pygobject  --disable-python --disable-mono --disable-monodoc
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cd $(WORKDIR)$(DIRNAME) && $(DEFAULT_INSTALL)
else # does not have windows support yet, disable for sh2 due to missing glib & iff
MAKE=
endif

# build targets
include $(WORKDIR)../GENERAL.mk
