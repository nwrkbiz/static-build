############################################################################
# Author: Daniel Giritzer, S1810567004 (daniel@giritzer.eu)
# Description: Build Makefile for the boost library
############################################################################
WORKDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

MODULES=--with-system --with-iostreams --with-program_options --with-test --with-serialization --with-date_time

# Avaiable Modules
# atomic, chrono, container, context, contract, coroutine, date_time, exception, fiber, filesystem, graph, graph_parallel, iostreams, locale
# log, math, mpi, program_options, python, random, regex, serialization, signals, stacktrace, system, test, thread, timer, type_erasure, wave

# package info
DIRNAME=boost_1_69_0
PACKNAME=$(DIRNAME).zip
PACKAGE_URL=https://dl.bintray.com/boostorg/release/1.69.0/source/$(PACKNAME)
UNPACK=unzip -o
LICENSE=$(WORKDIR)/$(DIRNAME)/LICENSE_1_0.txt

#### Build settings ####

CONFIGURE=echo "using gcc : $(OUT_TARGET) : $(GCC_PREFIX)-g++ ;" > $(WORKDIR)/$(DIRNAME)/user-config.jam;  \
cd $(WORKDIR)/$(DIRNAME);  \
bootstrap.sh
MAKE=b2 --user-config="user-config.jam" cflags="$(CFLAGS)" cxxflags="$(CXXFLAGS)" linkflags="$(LDFLAGS)" toolset=gcc-$(OUT_TARGET) link=static variant=release address-model=$(ARCH_BIT) $(MODULES) -j $(MAKE_JOBS) install --prefix=$(OUT_PREFIX)

# build targets
include $(WORKDIR)../GENERAL.mk