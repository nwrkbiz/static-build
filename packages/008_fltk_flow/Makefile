############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Universal Makefile for the fltk FLOW library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# package info
DIRNAME=Fl_Flow-main
PACKNAME=main.zip
PACKAGE_URL=https://github.com/osen/Fl_Flow/archive/refs/heads/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/COPYING

#### Build settings ####

FLOW_INCLUDES= \
  $(WORKDIR)$(DIRNAME)/src/Fl_Flow/Fl_Exception.h \
  $(WORKDIR)$(DIRNAME)/src/Fl_Flow/Fl_Helper.h \
  $(WORKDIR)$(DIRNAME)/src/Fl_Flow/Fl_Transform.h \
  $(WORKDIR)$(DIRNAME)/src/Fl_Flow/Fl_Instruction.h \
  $(WORKDIR)$(DIRNAME)/src/Fl_Flow/Fl_State.h \
  $(WORKDIR)$(DIRNAME)/src/Fl_Flow/Fl_Flow.h

MAKE=mkdir -p include/FL && echo '\#ifndef FL_FL_FLOW_H' > include/FL/Fl_Flow.H && echo '\#define FL_FL_FLOW_H' >> include/FL/Fl_Flow.H && cat $(FLOW_INCLUDES) >> include/FL/Fl_Flow.H && echo '\#endif' >> include/FL/Fl_Flow.H
AFTER_BUILD=cp $(WORKDIR)$(DIRNAME)/include/FL/Fl_Flow.H $(OUT_INCLUDE)/FL/

# build targets
include $(WORKDIR)../GENERAL.mk
