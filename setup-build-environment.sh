#!/bin/bash
set -e

if [ "$(id -u)" != "0" ]; then
    echo
    echo "Without root, this script won't be able to install needed software."
    echo
    exit 1
fi

apt update
apt upgrade -y

## for adwaita-icon-theme
PACKAGES+=" gnome-common gtk-3-examples libgtk-3-bin"

## for libgtk2, libgtk3
PACKAGES+=" gtk-doc-tools libgdk-pixbuf2.0-dev"

## for python-based packages (e.g. python2-xlib)
PACKAGES+=" python-pip python3-pip"

## for 'xorg-fonts-75dpi', 'xorg-fonts-100dpi'
PACKAGES+=" xfonts-utils"

apt install -y ${PACKAGES}
