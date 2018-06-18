TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=http://st.suckless.org
TERMUX_PKG_DESCRIPTION="A simple virtual terminal emulator for X."
TERMUX_PKG_VERSION=0.8.1
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=http://dl.suckless.org/st/st-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=c4fb0fe2b8d2d3bd5e72763e80a8ae05b7d44dbac8f8e3bb18ef0161c7266926
TERMUX_PKG_DEPENDS="libxext, libxft, libutil, xorg-fonts-75dpi | xorg-fonts-100dpi"
TERMUX_PKG_BUILD_IN_SRC=true
