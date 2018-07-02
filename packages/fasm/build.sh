TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

##
##  NOTE: Since FASM is x86-only program, we need a QEMU to run it.
##

TERMUX_PKG_HOMEPAGE=https://flatassembler.net/
TERMUX_PKG_DESCRIPTION="The Flat Assembler. Runs on Android via QEMU."
TERMUX_PKG_VERSION=1.73.04
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://flatassembler.net/fasm-${TERMUX_PKG_VERSION}.tgz
TERMUX_PKG_SHA256=4145d0341e916165c22c7b5ab62ed511ddd0aee4c1c406e97ca5b2ef929b1d78
TERMUX_PKG_DEPENDS="dash, qemu-user-i386"
TERMUX_PKG_PLATFORM_INDEPENDENT=true

termux_step_make() {
    return
}

termux_step_make_install() {
    install -Dm755 "${TERMUX_PKG_BUILDER_DIR}/fasm-wrapper" "${TERMUX_PREFIX}/bin/fasm"
    install -Dm755 "${TERMUX_PKG_SRCDIR}/fasm" "${TERMUX_PREFIX}/libexec/x86-bin/fasm"
}
