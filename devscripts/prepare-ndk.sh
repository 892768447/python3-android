#!/bin/bash

# https://stackoverflow.com/a/4774063
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

NDK_VER=r17b
HOST_OS="$(uname | tr 'A-Z' 'a-z')"
NDK_ARCHIVE=android-ndk-$NDK_VER-$HOST_OS-x86_64.zip
wget --no-verbose https://dl.google.com/android/repository/$NDK_ARCHIVE

rm -rf $(pwd)/android-ndk-$NDK_VER
unzip -q $NDK_ARCHIVE

rm -rf $(pwd)/android-ndk
mv $(pwd)/android-ndk-$NDK_VER $(pwd)/android-ndk

"$SCRIPTPATH"/strip-ndk.sh $(pwd)/android-ndk

rm -vf $NDK_ARCHIVE
