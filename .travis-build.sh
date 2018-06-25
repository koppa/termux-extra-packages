#!/bin/bash
set -e

if [ -z "${1}" ]; then
    echo
    echo "[!] ERROR: no argument passed"
    echo
    exit 1
fi

## clone build environment
git clone https://github.com/termux/termux-packages.git

## copy sources to build environment
cp -a ./packages/* ./termux-packages/packages/
cp -a ./packages-x11/* ./termux-packages/packages/

## build package
cp ./setup-build-environment.sh ./termux-packages/
cd ./termux-packages && {
    ./scripts/run-docker.sh sudo ./setup-build-environment.sh
    ./scripts/run-docker.sh ./build-package.sh -a aarch64 "${1}"
}
