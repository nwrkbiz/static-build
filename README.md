Build System to create static libraries
======================

A set of makefiles to build cross-compile toolchains, static libraries and applications for many CPU architectures.

### Why

On Linux a commonly faced problem is packaging, because it is not easily possible to package a program for all different Linux flavors. There are many approaches like containerization to overcome this problem. One other way to archive this is, by completely statically linking all dependencies into your executable. For this to archive a special c library (here musl) is needed. This set of Makefiles will build the needed compilers, libc and many commonly needed C/C++ libraries from source so you can easily create statically linked executables.

### Android Compatibility

For your executables to be better compatible with android devices a set of patches is used, so some standard files (resolv.conf, shells, services, hosts) are also searched relative to your executable. If you build programs with FLTK based GUIs then you can pack your executable into an [Android-X11](https://github.com/nwrkbiz/android-xserver) based app to install and run it on Android.

### Prerequisites

Debian 11 (bullseye amd64) base installation with following additional packages and internet access:

```
sudo apt install qemu-user-static wine libwine fonts-wine wine-binfmt gperf flex bison pkg-config build-essential cmake meson mingw-w64 gfortran-mingw-w64 texinfo doxygen build-essential libltdl-dev
```

#### Configure mingw to use posix threads

```
sudo update-alternatives --set x86_64-w64-mingw32-gcc /usr/bin/x86_64-w64-mingw32-gcc-posix
sudo update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix
sudo update-alternatives --set i686-w64-mingw32-gcc /usr/bin/i686-w64-mingw32-gcc-posix
sudo update-alternatives --set i686-w64-mingw32-g++ /usr/bin/i686-w64-mingw32-g++-posix
```

#### Configure linux to automatically execute .exe files using wine

```
sudo update-binfmts --import /usr/share/binfmts/wine
```

### HowTo

Copy or symlink the settings file(s) for the needed architecture(s) from build_settings to the root directory and run make.
Global settings (i.e. number of build jobs etc.) can be adjusted in build_settings/globals.mk.


#### Example

```
ln -s ./build_settings/linux_x86_64_musl.mk .
ln -s ./build_settings/windows_64.mk .
make
```

#### Security Info

Currently no signature checking is performed on the downloaded packages!


### About

2020, Daniel Giritzer

https://page.nwrk.biz/giri
