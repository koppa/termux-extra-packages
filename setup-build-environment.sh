#!/bin/sh
set -e

if [ "$(id -u)" != "0" ]; then
    echo
    echo "Without root, this script won't be able to install needed software."
    echo
    exit 1
fi

apt update
apt upgrade

## needed for building 'xorg-fonts-75dpi', 'xorg-fonts-100dpi'
apt install xfonts-utils
