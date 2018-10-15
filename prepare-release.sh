#!/bin/bash

# This script "prepares" the binaries in the directory dist/

pathToSkip=$(dirname "${BASH_SOURCE[0]}")
distrib=$(uname -s)
installDir="$pathToSkip/dist/$distrib"

rm -Rf "$pathToSkip/dist"

mkdir "$pathToSkip/dist"
mkdir "$installDir"
mkdir "$installDir/bin"
mkdir "$installDir/lib"

cp "$pathToSkip/sktools/skserver" "$installDir/bin"
cp "$pathToSkip/sktools/sk" "$installDir/bin"
if [ $distrib == Linux ]; then
    strip --strip-unneeded "$pathToSkip/build/bin/skip_server" -o "$installDir/bin/skip_server"
else
    cp "$pathToSkip/build/bin/skip_server" "$installDir/bin/skip_server"
fi

cp "$pathToSkip/build/src/runtime/native/lib/preamble.ll" "$installDir/lib"
cp "$pathToSkip/build/src/runtime/native/libskip_runtime.a" "$installDir/lib"
cp "$pathToSkip/build/src/runtime/native/CMakeFiles/sk_standalone.src.dir/src/sk_standalone.cpp.o" "$installDir/lib"
cp "$pathToSkip/build/third-party/install/lib/libfolly.a" "$installDir/lib"
cp "$pathToSkip/build/third-party/install/lib/libunwind.a" "$installDir/lib"
cp "$pathToSkip/build/third-party/install/lib/libdouble-conversion.a" "$installDir/lib"
cp "$pathToSkip/build/third-party/install/lib/libicuuc.a" "$installDir/lib"
cp "$pathToSkip/build/third-party/install/lib/libicui18n.a" "$installDir/lib"
cp "$pathToSkip/build/third-party/install/lib/libicuio.a" "$installDir/lib"
cp "$pathToSkip/build/third-party/install/lib/libicutu.a" "$installDir/lib"
cp "$pathToSkip/build/third-party/install/lib/libicudata.a" "$installDir/lib"
cp "$pathToSkip/build/third-party/install/lib/libjemalloc_pic.a" "$installDir/lib"


cp -R src/runtime/prelude "$installDir/prelude"
