#!/bin/bash
set -e

VERSION="$1"
if [ -z ${VERSION} ]; then
    echo "You must specify version!" >&2
    exit 1
fi

TARGET_BINARIES="gettext-runtime/src/envsubst"
ROOT_PATH=${PWD}

mkdir -p build
pushd build
wget -O gettext-${VERSION}.tar.gz https://ftp.gnu.org/pub/gnu/gettext/gettext-${VERSION}.tar.gz
tar xzf gettext-${VERSION}.tar.gz
cd gettext-${VERSION}/
./configure
make
strip ${TARGET_BINARIES}

OS="$(uname | sed 's/./\L&/g')"
CPU="$(uname -p)"
CPU_SHORT=${CPU%_*}
BIN_DIR="${ROOT_PATH}/${OS}-${CPU_SHORT}/bin/"

mkdir -p "${BIN_DIR}"
cp ${TARGET_BINARIES} "${BIN_DIR}"
popd
rm -rf build

