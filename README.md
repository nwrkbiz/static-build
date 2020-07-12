Build System to create static libraries
=======================================

A set of makefiles I use to build my static dependencies.

Copy the settings file(s) for the needed architecture(s) from build_settings to the root directory and run make.
Global settings can be adjusted in build_settings/globals.mk.

### Windows Targets

For the windows targets the easiest way is to install the mingw-w64 and mingw-w64 gfortran packages from the Debian repository.

### Linux Musl Targets

For musl targets the crosscompiler toolchain has to exist within the targets output directory. The toolchain is built automatically when calling make.

### Needed Debian packages

flex, pkg-config, build-essential, cmake, meson, mingw-w64, gfortran-mingw-w64, ... (and maybe more?)

### About

2020, Daniel Giritzer

https://page.nwrk.biz/giri
