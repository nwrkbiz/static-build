############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu, giri@nwrk.biz)
# Description: Build all packages for all architectures copied to the root directory.
############################################################################
PACK_DIRS=$(shell ls -d packages/*/)
COMPILER_DIRS=$(shell ls -d compiler_packages/*/)

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

clean:
	rm -rf ./3rdParty