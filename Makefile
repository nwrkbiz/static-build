############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu, giri@nwrk.biz)
# Description: Build all packages for all architectures copied to the root directory.
############################################################################
PACK_DIRS=$(shell ls -d packages/*/)

# newline
define NL


endef

.PHONY: all
all:
	$(foreach package,$(PACK_DIRS), cd $(package) && make $(NL))