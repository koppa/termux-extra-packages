TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com> @xeffyr"

TERMUX_PKG_HOMEPAGE=https://bellard.org/riscvemu/
TERMUX_PKG_DESCRIPTION="RISC-V system emulator"
TERMUX_PKG_VERSION=20170806
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/xeffyr/riscvemu/archive/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=ab78b040479a92fa6a28e098c9109d3be3049ab4a75070e4363ddcd22155b96a
TERMUX_PKG_DEPENDS="libcurl, libsdl, openssl"

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DUSE_NETWORK_FILESYSTEM=y
-DUSE_SLIRP_NETWORKING=y
-DUSE_SDL_GRAPHICS=y
-DINSTALL_SAMPLES=y
"

termux_step_post_make_install() {
    ln -sfr "${TERMUX_PREFIX}/bin/riscvemu64" "${TERMUX_PREFIX}/bin/riscvemu"
}

termux_step_create_debscripts() {
    cp "${TERMUX_PKG_BUILDER_DIR}/postinst" ./
}
