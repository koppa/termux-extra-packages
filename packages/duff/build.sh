TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=http://duff.sourceforge.net/
TERMUX_PKG_DESCRIPTION="A command-line utility for quickly finding duplicates in a given set of files"
TERMUX_PKG_VERSION=0.5.2
TERMUX_PKG_SRCURL=http://downloads.sourceforge.net/sourceforge/duff/duff-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=15b721f7e0ea43eba3fd6afb41dbd1be63c678952bf3d80350130a0e710c542e
TERMUX_PKG_RM_AFTER_INSTALL="share/duff"
