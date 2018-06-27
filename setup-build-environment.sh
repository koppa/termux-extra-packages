#!/bin/bash
set -e

if [ "$(id -u)" != "0" ]; then
    echo
    echo "Without root, this script won't be able to install needed software."
    echo
    exit 1
fi

LOG_FILE=/proc/self/fd/1
if [ -n "${TRAVIS_BUILD_ID}" ]; then
    [ -f "${LOG_FILE}" ] && truncate -s 0 "${LOG_FILE}"
    LOG_FILE="setup-build-environment.log"
fi

PACKAGES=""

## for adwaita-icon-theme
PACKAGES="${PACKAGES} gnome-common gtk-3-examples libgtk-3-bin"

## for libgtk2, libgtk3
PACKAGES="${PACKAGES} gtk-doc-tools libgdk-pixbuf2.0-dev"

## for python-based packages (e.g. python2-xlib)
PACKAGES="${PACKAGES} python-pip python3-pip"

## for 'xorg-fonts-75dpi', 'xorg-fonts-100dpi'
PACKAGES="${PACKAGES} xfonts-utils"

## for openjdk-9-jre-headless
PACKAGES="${PACKAGES} zip"

[ -n "${TRAVIS_BUILD_ID}" ] && echo "[*] Updating system software..."
apt update --quiet > "${LOG_FILE}" 2>&1
apt upgrade --yes --quiet > "${LOG_FILE}" 2>&1

[ -n "${TRAVIS_BUILD_ID}" ] && echo "[*] Installing additional software..."
apt install --yes --quiet ${PACKAGES} > "${LOG_FILE}" 2>&1
