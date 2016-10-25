#!/bin/bash
# This script forces Snow Leopard (10.6) to build using Leopard (10.5)
# and to build a 32 bit build.
# Use it when building livCVD, GVars, and lib3ds
#
# Originally wirrten by Damian Stewart
# http://lists.nongnu.org/archive/html/libcvd-members/2010-05/msg00000.html
# Modified by Robert Castle

SDK="-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk"
SDKLIB="-Wl,-syslibroot,/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk"
export MACOSX_DEPLOYMENT_TARGET="10.9"

ARCH="-arch x86_64"

export CFLAGS="$ARCH $SDK -mmacosx-version-min=10.9 -m32 -D_OSX -I/usr/local/include -I/opt/X11/include"
export CXXFLAGS="$ARCH $SDK -mmacosx-version-min=10.9 -m32 -D_OSX -I/usr/local/include -I/opt/X11/include"
export CPPFLAGS="$ARCH $SDK -mmacosx-version-min=10.9 -m32 -D_OSX -I/usr/local/include -I/opt/X11/include"
export LDFLAGS="$ARCH $SDKLIB -mmacosx-version-min=10.9 -m32 -L/usr/local/lib -L/opt/X11/lib"

CC="/usr/local/bin/gcc-4.8"
CXX="/usr/local/bin/g++-4.8"
OBJC="/usr/local/bin/gcc-4.8"

CC="$CC" CXX="$CXX" OBJC="$OBJC" CXXFLAGS="$CXXFLAGS" CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" ./configure $1 $2 $3 $4 $5 $6 $7 $8 $9
