Build System to create static libraries
=======================================

A set of makefiles I use to build my static dependencies.

Copy the settings file(s) for the needed architecture(s) from build_settings to the root directory and run make.
Global settings can be adjusted in build_settings/globals.mk.

### GNU Targets
For gnu targets the easiest way is to install the crossbuild-essential-* and gfortran-* packages from the Debian repository.

### Musl Targets
For musl targets the crosscompiler toolchain has to exist within the targets output directory. Musl GCC toolchains can easily be built using https://github.com/richfelker/musl-cross-make/. To build the gfortran compiler change "GCC_CONFIG += --enable-languages=c,c++" to "GCC_CONFIG += --enable-languages=c,c++,fortran" within the config.mak.

### About

2020, Daniel Giritzer

https://page.nwrk.biz/giri
