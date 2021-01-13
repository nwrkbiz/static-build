############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu)
# Description: Universal flwm window manager.
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=flwm-flwm
PACKNAME=$(DIRNAME).zip
PRE_DL=git clone https://git.code.sf.net/p/flwm/flwm flwm-flwm && zip -r flwm-flwm.zip flwm-flwm && rm -rf flwm-flwm
#PACKAGE_URL=
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/README

#### Build settings ####

PKG_LDFLAGS=-lXcursor -lXinerama -lXft  -lXrender -lXfixes -lXext -lX11 -lxcb -lXau -lXdmcp
PRE_CFG=autoreconf -vfi && sed -i -e 's/DESKTOPS 1/DESKTOPS 0/g' $(WORKDIR)$(DIRNAME)/config.h && sed -i -e 's/WMX_MENU_ITEMS 1/WMX_MENU_ITEMS 0/g' $(WORKDIR)$(DIRNAME)/config.h && sed -i -e 's/XTERM_MENU_ITEM 1/XTERM_MENU_ITEM 0/g' $(WORKDIR)$(DIRNAME)/config.h  && sed -i -e 's/LEFT 3/LEFT 9/g' $(WORKDIR)$(DIRNAME)/config.h && sed -i -e 's/RIGHT 4/RIGHT 12/g' $(WORKDIR)$(DIRNAME)/config.h && sed -i -e 's/TOP 3/TOP 9/g' $(WORKDIR)$(DIRNAME)/config.h && sed -i -e 's/BOTTOM 4/BOTTOM 12/g' $(WORKDIR)$(DIRNAME)/config.h && sed -i -e 's/TITLE_FONT_SIZE 12/TITLE_FONT_SIZE 36/g' $(WORKDIR)$(DIRNAME)/config.h && sed -i -e 's/RESIZE_EDGE 5/RESIZE_EDGE 15/g' $(WORKDIR)$(DIRNAME)/config.h && sed -i -e 's/MENU_FONT_SIZE 12/MENU_FONT_SIZE 108/g' $(WORKDIR)$(DIRNAME)/config.h && sed -i -e 's/MAX_MENU_WIDTH 300/MAX_MENU_WIDTH 900/g' $(WORKDIR)$(DIRNAME)/config.h && sed -i -e 's/MENU_ICON_W 18/MENU_ICON_W 54/g' $(WORKDIR)$(DIRNAME)/config.h && sed -i -e 's/MENU_ICON_H 15/MENU_ICON_H 45/g' $(WORKDIR)$(DIRNAME)/config.h
CONFIGURE=$(DEFAULT_CFG) LIBS="-static -lXcursor -lXinerama -lXft  -lXrender -lXfixes -lXext -lX11 -lxcb -lXau -lXdmcp"
MAKE=$(DEFAULT_MAKE)
AFTER_BUILD=cp $(WORKDIR)$(DIRNAME)/flwm $(OUT_BIN)

# build targets
include $(WORKDIR)../GENERAL.mk
