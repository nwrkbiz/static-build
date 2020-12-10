############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu, giri@nwrk.biz)
# Description: Build all packages for all architectures copied to the root directory.
############################################################################
SETTINGS_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
PACK_DIRS=$(shell ls -d packages/*/)
COMPILER_DIRS=$(shell ls -d compiler_packages/*/)
EXAMPLE_DIRS=$(shell ls -d examples/*/)

include build_settings/globals.mk

# newline
define NL


endef

all: compilers packages

.PHONY: compilers
compilers:
	$(foreach compiler,$(COMPILER_DIRS), cd $(compiler) && make $(NL))

.PHONY: packages
packages:
	$(foreach package,$(PACK_DIRS), cd $(package) && make $(NL))

.PHONY: examples
examples:
	$(foreach package,$(EXAMPLE_DIRS), cd $(package) && ln -sf $(OUTDIR) . && make -j $(MAKE_JOBS) $(NL))

clean:
	rm -rf $(OUTDIR)
