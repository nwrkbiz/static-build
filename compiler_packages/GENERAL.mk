############################################################################
# Author: Daniel Giritzer (daniel@giritzer.eu, giri@nwrk.biz)
# Description: GENERAL build targets.
############################################################################
PACKAGES_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
TARGETS := $(basename $(shell cd $(PACKAGES_DIR)/../ && ls *.mk))

KOMMA :=','
EMPTY :=
SPACE :=$(empty) $(empty)

### Default configuration (can be used in package makefiles, usually this covers all settings for static libraries)
DEFAULT_CFG=$(CFG_CMD) --with-pie --x-includes=$(OUT_INCLUDE) --x-libraries=$(OUT_LIB) --enable-malloc0returnsnull PKG_CONFIG_PATH="$(OUT_PREFIX):$(OUT_PREFIX)/pkgconfig:$(OUT_LIB)/pkgconfig:$(OUT_PREFIX)/share/pkgconfig:$(OUT_PREFIX)/usr/lib/pkgconfig" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" CPPFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" --build=$(COMPILER_HOST_PREFIX) --host=$(COMPILER_PREFIX) FC=$(COMPILER_PATH)/$(FC) FFLAGS="$(FFLAGS)" --prefix=$(OUT_PREFIX) --datadir=$(OUT_PREFIX) --includedir=$(OUT_INCLUDE) --libdir=$(OUT_LIB) --bindir=$(OUT_BIN) --disable-shared --enable-static $(CUSTOM_CFG) 
DEFAULT_MSN=echo [properties] > c.txt && echo "sys_root=''" >> c.txt && echo "pkg_config_libdir='$(OUT_LIB)/pkgconfig'" >> c.txt && echo "needs_exe_wrapper=true" >> c.txt && echo [built-in options] >> c.txt && echo "c_args=['$(subst $(SPACE),$(KOMMA),$(CFLAGS))']" >> c.txt && echo "cpp_args=['$(subst $(SPACE),$(KOMMA),$(CXXFLAGS))']" >> c.txt && echo "c_link_args=['$(subst $(SPACE),$(KOMMA),$(LDFLAGS))']" >> c.txt && echo "cpp_link_args=['$(subst $(SPACE),$(KOMMA),$(LDFLAGS))']" >> c.txt && echo [host_machine] >> c.txt && echo "system='$(OS)'" >> c.txt && echo "cpu_family='$(CPU_FAMILY)'" >> c.txt && echo "cpu='$(CPU)'" >> c.txt && echo "endian='$(ENDIAN)'" >> c.txt && echo [binaries] >> c.txt && echo "c='$(CC)'" >> c.txt && echo "cpp='$(CXX)'" >> c.txt && echo "ar='$(AR)'" >> c.txt && echo "ld='$(LD)'" >> c.txt && echo "objcopy='$(OBJCOPY)'" >> c.txt && echo "strip='$(STRIP)'" >> c.txt && echo "pkgconfig='pkg-config'"  >> c.txt && echo "windres='$(WINDRES)'" >> c.txt &&   PKG_CONFIG_PATH="$(OUT_PREFIX):$(OUT_PREFIX)/pkgconfig:$(OUT_LIB)/pkgconfig:$(OUT_PREFIX)/share/pkgconfig:$(OUT_PREFIX)/usr/lib/pkgconfig" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" CPPFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" FC=$(COMPILER_PATH)/$(FC) FFLAGS="$(FFLAGS)" LIBRARY_PATH=$(OUT_LIB) $(MSN_CMD) --cross-file c.txt _build --prefix=$(OUT_PREFIX) --datadir=$(OUT_PREFIX) --includedir=$(OUT_INCLUDE) --libdir=$(OUT_LIB) --bindir=$(OUT_BIN) --default-library=static $(CUSTOM_MSN)
DEFAULT_CMK=mkdir -p build && cd build && $(CMK_CMD) ..  -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=false -DCMAKE_INSTALL_PREFIX="$(OUT_PREFIX)" -DCMAKE_INCLUDE_PATH="$(OUT_INCLUDE)" -DCMAKE_LIBRARY_PATH="$(OUT_LIB)" -DCMAKE_PROGRAM_PATH="$(OUT_BIN)" -DCMAKE_PREFIX_PATH="$(OUT_PREFIX)" -DCMAKE_C_FLAGS="$(CFLAGS)" -DCMAKE_CXX_FLAGS="$(CXXFLAGS)" -DCMAKE_F_FLAGS="$(FFLAGS)" -DCMAKE_EXE_LINKER_FLAGS="$(LDFLAGS)" -DCMAKE_C_COMPILER=$(COMPILER_PATH)/$(CC) -DCMAKE_CXX_COMPILER=$(COMPILER_PATH)/$(CXX) -DCMAKE_F_COMPILER=$(COMPILER_PATH)/$(FC) -DCMAKE_FC_COMPILER=$(COMPILER_PATH)/$(FC) -DCMAKE_LINKER=$(COMPILER_PATH)/$(LD) -DCMAKE_AR=$(COMPILER_PATH)/$(AR) -DCMAKE_RANLIB=$(COMPILER_PATH)/$(RANLIB) -DCMAKE_TRY_COMPILE_TARGET_TYPE=STATIC_LIBRARY -DCMAKE_SKIP_BUILD_RPATH=TRUE -DCMAKE_SKIP_RPATH=TRUE $(CUSTOM_CMK) 
DEFAULT_MAKE=$(MAK_CMD) -j$(MAKE_JOBS) V=$(MAKE_VERBOSE) VERBOSE=$(MAKE_VERBOSE)
DEFAULT_INSTALL=$(DEFAULT_MAKE) install

# ninja
ifeq (,$(filter $(MAKE_VERBOSE),1))
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

### Allow extending flags per package
ifneq ($(strip $(PKG_FFLAGS)),)
FFLAGS+=$(PKG_FFLAGS)
endif
ifneq ($(strip $(PKG_CFLAGS)),)
CFLAGS+=$(PKG_CFLAGS)
endif
ifneq ($(strip $(PKG_CXXFLAGS)),)
CXXFLAGS+=$(PKG_CXXFLAGS)
endif
ifneq ($(strip $(PKG_LDFLAGS)),)
LDFLAGS+=$(PKG_LDFLAGS)
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
ifneq ($(strip $(PRE_DL)),)
	$(PRE_DL)
endif
ifeq ("$(wildcard $(WORKDIR)/$(PACKNAME))","")
ifneq ($(strip $(PACKAGE_URL)),)
	wget $(PACKAGE_URL)
endif
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
	rm -rf $(WORKDIR)$(DIRNAME)

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