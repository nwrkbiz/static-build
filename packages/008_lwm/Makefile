############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal Makefile for the lwm window manager
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=lwm-master
PACKNAME=master.zip
PACKAGE_URL=https://github.com/jamesfcarter/lwm/archive/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING $(WORKDIR)/$(DIRNAME)/AUTHORS

#### Build settings ####

ifeq (,$(filter $(MAKECMDGOALS),windows_32 windows_64))
MAKE=$(GCC_PATH)/$(GCC_PREFIX)-gcc -g0 -s lwm.c manage.c mouse.c client.c cursor.c error.c disp.c shape.c resource.c session.c ewmh.c -DSHAPE $(CFLAGS) $(LDFLAGS) -lXext -lX11 -lxcb -lXdmcp -lXau -lSM -lICE -o lwm
AFTER_BUILD=cp $(WORKDIR)$(DIRNAME)/lwm $(OUT_BIN)
else
MAKE=
endif

# build targets
include $(WORKDIR)../GENERAL.mk

