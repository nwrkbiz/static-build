############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu, giri@nwrk.biz)
# Description: GENERAL build targets.
############################################################################
PACKAGES_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
TARGETS := $(basename $(shell cd $(PACKAGES_DIR)/../ && ls *.mk))

### Default configuration (can be used in package makefiles, usually this covers all settings for static libraries)
DEFAULT_CFG=configure --with-pie --x-includes=$(OUT_INCLUDE) --x-libraries=$(OUT_LIB) --enable-malloc0returnsnull PKG_CONFIG_PATH="$(OUT_PREFIX):$(OUT_PREFIX)/pkgconfig:$(OUT_LIB)/pkgconfig:$(OUT_PREFIX)/share/pkgconfig:$(OUT_PREFIX)/usr/lib/pkgconfig" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" CPPFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" --build=$(GCC_HOST_PREFIX) --host=$(GCC_PREFIX) FC=$(GCC_PATH)/$(GCC_PREFIX)-gfortran FFLAGS="$(FFLAGS)" --prefix=$(OUT_PREFIX) --datadir=$(OUT_PREFIX) --includedir=$(OUT_INCLUDE) --libdir=$(OUT_LIB) --bindir=$(OUT_BIN) --disable-shared --enable-static $(CUSTOM_CFG) 
DEFAULT_MSN=echo [properties] > c.txt && echo "sys_root='$(OUT_PREFIX)'" >> c.txt && echo "needs_exe_wrapper=true" >> c.txt && echo [host_machine] >> c.txt && echo "system='$(OS)'" >> c.txt && echo "cpu_family='$(CPU_FAMILY)'" >> c.txt && echo "cpu='$(CPU)'" >> c.txt && echo "endian='$(ENDIAN)'" >> c.txt && echo [binaries] >> c.txt && echo "c='$(GCC_PREFIX)-gcc'" >> c.txt && echo "cpp='$(GCC_PREFIX)-g++'" >> c.txt && echo "ar='$(GCC_PREFIX)-ar'" >> c.txt && echo "ld='$(GCC_PREFIX)-ld'" >> c.txt && echo "objcopy='$(GCC_PREFIX)-objcopy'" >> c.txt && echo "strip='$(GCC_PREFIX)-strip'" >> c.txt && echo "pkgconfig='pkg-config'"  >> c.txt && echo "windres='$(GCC_PREFIX)-windres'" >> c.txt &&  PKG_CONFIG_PATH="$(OUT_PREFIX):$(OUT_PREFIX)/pkgconfig:$(OUT_LIB)/pkgconfig:$(OUT_PREFIX)/share/pkgconfig:$(OUT_PREFIX)/usr/lib/pkgconfig" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" CPPFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" FC=$(GCC_PATH)/$(GCC_PREFIX)-gfortran FFLAGS="$(FFLAGS)" meson --cross-file c.txt _build --prefix=$(OUT_PREFIX) --datadir=$(OUT_PREFIX) --includedir=$(OUT_INCLUDE) --libdir=$(OUT_LIB) --bindir=$(OUT_BIN) --default-library=static $(CUSTOM_MSN)
DEFAULT_CMK=mkdir -p build && cd build && cmake .. -DBUILD_SHARED_LIBS=false -DCMAKE_INSTALL_PREFIX="$(OUT_PREFIX)" -DCMAKE_INCLUDE_PATH="$(OUT_INCLUDE)" -DCMAKE_LIBRARY_PATH="$(OUT_LIB)" -DCMAKE_PROGRAM_PATH="$(OUT_BIN)" -DCMAKE_PREFIX_PATH="$(OUT_PREFIX)" -DCMAKE_C_FLAGS="$(CFLAGS)" -DCMAKE_CXX_FLAGS="$(CXXFLAGS)" -DCMAKE_F_FLAGS="$(FFLAGS)" -DCMAKE_C_COMPILER=$(GCC_PATH)/$(GCC_PREFIX)-gcc -DCMAKE_CXX_COMPILER=$(GCC_PATH)/$(GCC_PREFIX)-g++ -DCMAKE_F_COMPILER=$(GCC_PATH)/$(GCC_PREFIX)-gfortran -DCMAKE_FC_COMPILER=$(GCC_PATH)/$(GCC_PREFIX)-gfortran -DCMAKE_LINKER=$(GCC_PATH)/$(GCC_PREFIX)-ld -DCMAKE_AR=$(GCC_PATH)/$(GCC_PREFIX)-ar -DCMAKE_RANLIB=$(GCC_PATH)/$(GCC_PREFIX)-ranlib -DCMAKE_TRY_COMPILE_TARGET_TYPE=STATIC_LIBRARY -DCMAKE_SKIP_BUILD_RPATH=TRUE -DCMAKE_SKIP_RPATH=TRUE $(CUSTOM_CMK) 
DEFAULT_MAKE=make -j$(MAKE_JOBS) V=$(MAKE_VERBOSE) VERBOSE=$(MAKE_VERBOSE)
DEFAULT_INSTALL=$(DEFAULT_MAKE) install

# ninja
ifeq (,$(filter $(VERBOSE),1))
NINJA_MAKE=ninja -v -C _build -j$(MAKE_JOBS)
else
NINJA_MAKE=ninja -C _build -j$(MAKE_JOBS) 
endif
NINJA_INSTALL=$(NINJA_MAKE) install

### include file containing config depending on build target
ifeq (,$(filter $(MAKECMDGOALS),clean all unpack))
ifneq ($(MAKECMDGOALS),)
include $(PACKAGES_DIR)/../$(MAKECMDGOALS).mk
endif
endif

# newline
define NL


endef
.PHONY: all
all:
	$(foreach target,$(TARGETS),make $(target)$(NL))
	make clean

.PHONY: unpack
unpack:
ifeq ("$(wildcard $(WORKDIR)/$(PACKNAME))","")
	wget $(PACKAGE_URL)
endif
ifneq ($(strip $(BEFORE_UNPACK)),)
	$(BEFORE_UNPACK)
endif
	$(UNPACK) $(PACKNAME)
ifneq ($(strip $(LICENSE)),)
	mkdir -p $(OUT_LICENSE)/$(DIRNAME)
	cp $(LICENSE) $(OUT_LICENSE)/$(DIRNAME)
	cp $(PACKNAME) $(OUT_LICENSE)/$(DIRNAME)
endif
ifneq ($(strip $(AFTER_UNPACK)),)
	$(AFTER_UNPACK)
endif

.PHONY: clean
clean:
ifneq ("$(wildcard $(WORKDIR)$(DIRNAME))","")
	cd $(WORKDIR)$(DIRNAME) && make clean
endif


.PHONY: $(TARGETS)
$(TARGETS):

.PHONY: $(OUT_TARGET)
$(OUT_TARGET): clean unpack
	$(eval BUILD_CMD := cd $(WORKDIR)/$(DIRNAME) && )

ifneq ($(strip $(PRE_CFG)),)
	$(eval BUILD_CMD := ${BUILD_CMD} $(PRE_CFG) &&) 
endif
ifneq ($(strip $(CONFIGURE)),)
	$(eval BUILD_CMD := ${BUILD_CMD} $(CONFIGURE) &&)
endif
ifneq ($(strip $(POST_CFG)),)
	$(eval BUILD_CMD := ${BUILD_CMD} $(POST_CFG) &&) 
endif
ifneq ($(strip $(MAKE)),)
	mkdir -p $(OUTDIR)
	mkdir -p $(OUT_INCLUDE)
	mkdir -p $(OUT_LIB)
	$(BUILD_CMD) $(MAKE)
ifneq ($(strip $(INCLUDE_OUTPUT)),)
	cp -rf $(INCLUDE_OUTPUT)  $(OUT_INCLUDE)
endif
ifneq ($(strip $(LIB_OUTPUT)),)
	cp -rf $(LIB_OUTPUT)  $(OUT_LIB)
endif
endif
ifneq ($(strip $(AFTER_BUILD)),)
	cd $(WORKDIR)/$(DIRNAME) && $(AFTER_BUILD)
endif