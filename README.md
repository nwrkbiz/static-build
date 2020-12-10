Build System to create static libraries
======================

A set of makefiles to build cross-compile toolchains and static libraries for many CPU architectures.

### Why

On linux a commonly faced problem is packaging, because it is not easily possible to package a program to run on all different linux flavours. One way to archieve this is,
by completely statically linking all dependencies into your executable. For this to archieve a special c libary (here musl) is needed. This set of Makefiles will build the needed compilers, libc
and many commonly needed C/C++ libraries from source so you can easily create statically linked executables.

### Prerequisites

Debian 10 (buster amd64) base installation with following additional packages and internet access:

```
sudo apt install ncurses-bin gperf flex bison pkg-config build-essential cmake meson mingw-w64 gfortran-mingw-w64 texinfo doxygen build-essential libltdl-dev
```

#### Configure mingw to use posix threads

```
sudo update-alternatives --set x86_64-w64-mingw32-gcc /usr/bin/x86_64-w64-mingw32-gcc-posix
sudo update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix
sudo update-alternatives --set i686-w64-mingw32-gcc /usr/bin/i686-w64-mingw32-gcc-posix
sudo update-alternatives --set i686-w64-mingw32-g++ /usr/bin/i686-w64-mingw32-g++-posix
```

### HowTo

Copy or symlink the settings file(s) for the needed architecture(s) from build_settings to the root directory and run make.
Global settings (i.e. number of build jobs etc.) can be adjusted in build_settings/globals.mk.

#### Security Info

Currently no signature checking is performed on the downloaded packages!

### Windows Targets

For windows only the libraries in the "packages" folder is built. The debian mingw toolchain is used. (MinGW allows creating fully statically linked executables, so there is no need for a special compiler.)

### Linux Musl Targets

For musl targets the crosscompiler toolchain has to exist within the targets output directory. The toolchain is built automatically when calling make, all libraries are built afterwards.

### About

2020, Daniel Giritzer

https://page.nwrk.biz/giri
