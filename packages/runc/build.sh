TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

## !!! ROOTED DEVICE REQUIRED TO USE THIS PACKAGE !!!

TERMUX_PKG_HOMEPAGE=https://www.opencontainers.org/
TERMUX_PKG_DESCRIPTION="A tool for spawning and running containers according to the OCI specification"
TERMUX_PKG_VERSION=1.0.0-rc5
TERMUX_PKG_SRCURL=https://github.com/opencontainers/runc/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=770e180d1cca1f3c1a67512ebf9720caafe97af4fc2fe12fa43a3cf7bfa77522
TERMUX_PKG_DEPENDS="libseccomp"

termux_step_make() {
    termux_setup_golang

    export GOPATH="${PWD}/go"

    mkdir -p "${GOPATH}/src/github.com/opencontainers"
    ln -sf "${TERMUX_PKG_SRCDIR}" "${GOPATH}/src/github.com/opencontainers/runc"

    cd "${GOPATH}/src/github.com/opencontainers/runc" && make
}

termux_step_make_install() {
    cd "${GOPATH}/src/github.com/opencontainers/runc"
    install -Dm755 runc "${TERMUX_PREFIX}/bin/runc"
}

termux_step_create_debscripts() {
	## POST INSTALL:
	{
		echo "#!${TERMUX_PREFIX}/bin/sh"
		echo "echo"
		echo "echo \"WARNING: This package require root permissions.\""
		echo "echo"
		echo "exit 0"
	} > postinst
}
